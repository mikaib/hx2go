package;

import sys.FileSystem;
import sys.io.File;
import parser.IParser;
import haxe.io.Path;
import translator.TranslatorTools;

@:structInit
class ContextOptions {
    @:opt_name("run")
    @:opt_desc("Run the executable after compilation.")
    @:opt_type("Bool")
    public var runAfterCompilation: Bool = false;

    @:opt_name("build")
    @:opt_desc("Build the executable after compilation.")
    @:opt_type("Bool")
    public var buildAfterCompilation: Bool = false;

    @:opt_name("main")
    @:opt_desc("The entry point of your Haxe program.")
    @:opt_type("String")
    public var entryPoint: String = "Main";
    @:opt_name("output")
    @:opt_desc("Output location of the Go code")
    @:opt_type("String")
    public var output: String = "export";
}

@:structInit
class ContextFile {
    public var path: String;
    public var content: String;
    public var module: Module;
}

typedef ContextResults = Array<ContextFile>;

@:structInit
class Context {
    
    public var options: ContextOptions;
    
    private var _parser: IParser = null;
    private var _cache: Map<String, Module> = [];

    public function new(options: ContextOptions) {
        this.options = options;
        this._parser = new parser.dump.Dump(this);
    }

    /**
     * Gets the module cached inside the context.
     * @param path The path of the module (e.g. package.ClassName)
     * @return A module or null if not found.
     */
    public function getModule(path: String): Null<Module> {
        return _cache[path];
    }

    /**
     * Get the cache
     * @return the cache of modules
     */
    public inline function getCache(): Map<String, Module> {
        return _cache;
    }

    /**
     * Runs the hx2go transpiler.
     * @return A virtual filesystem of all the results including path, content and module.
     */
    public function run(): ContextResults {
        _parser.run("");

        var buf = new StringBuf();
        buf.add("package main\n\n");

        var subBuffer = new StringBuf();
        for (module in _cache.iterator()) {
            if (module.path == options.entryPoint) {
                module.mainBool = true;
            }

            module.run(subBuffer);
        }

        var imports = [];
        for (mod in _cache.iterator()) {
            for (def in mod.defs) {
                for (imp in def.goImports) {
                    if (!imports.contains(imp)) imports.push(imp);
                }
            }
        }

        for (imp in imports) {
            buf.add('import "' + imp + '"\n');
        }

        if (imports.length > 0) buf.add("\n");
        buf.add(subBuffer.toString());

        buf.add('func main() {\n');
        buf.add('\tHx_${modulePathToPrefix(options.entryPoint)}_main()\n');
        buf.add('}\n');

        final outPath = Path.join([ options.output ]);
        final dir = Path.directory(outPath);

        if (!FileSystem.exists(dir)) {
            FileSystem.createDirectory(dir);
        }

        final cwd = Sys.getCwd();
        File.saveContent(outPath, buf.toString());
        Sys.setCwd(dir);

        if (!FileSystem.exists("go.mod")) {
            Sys.command("go mod init hx2go");
        }

        if (options.buildAfterCompilation) {
            Sys.command('go build .');
        }

        if (options.runAfterCompilation) {
            Sys.command('go run .');
        }

        Sys.setCwd(cwd);

        return null;
    }

}