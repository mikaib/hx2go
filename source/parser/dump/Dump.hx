package parser.dump;

using StringTools;

import sys.io.File;
import haxe.io.Path;
import haxe.io.Bytes;
import haxe.macro.Type;
import parser.dump.RecordParser;
import parser.IParser;
import sys.FileSystem;

class Dump implements IParser {

    private var _context: Context;

    public function new(context: Context) {
        _context = context;
    }

    public function run(path: String): Void {
        // hardset for now, might need to have path show local path where cli was started
        path = "./dump/AfterDce/go/";
        // trace(path);
        final filePaths = parseFolder(path);
        final records = [];
        for (filePath in filePaths) {
            final parser:RecordParser = {dbg_path: filePath, input: Util.normalizeCLRF(File.getContent(filePath))};
            final record = parser.run();
            records.push(record);
        }

        final depsMap = Deps.run("./dump/go/dependencies.dump");
        final fileNameToModulePath:Map<String,String> = [];
        final cache = _context.getCache();

        for (record in records) {
            if (record?.module == null) {
                trace("module should not be null");
                continue;
            }

            final def = RecordTools.recordToHaxeTypeDefinition(record);
            final module = if (!cache.exists(record.module)) {
                var module: Module = {
                    path: record.module,
                    translator: {},
                    transformer: {},
                    preprocessor: {},
                    context: _context,
                };
                cache.set(record.module, module);
                module;
            }else{
                // module already exists, add a new def to it
                cache.get(record.module);
            }
            module.addDef(def);
            // add to deps module key map
            fileNameToModulePath[record.name_pos.file] = record.module;
            
        }
        for (fileName => files in depsMap) {
            final modulePath = fileNameToModulePath[fileName];
            // assume modulePath is null means the compiler is fine to skip it and is only in eval
            if (modulePath == null) {
                continue;
            }
            final module = cache.get(modulePath);
            if (module == null)
                continue;
            for (fileName in files) {
                final imp = fileNameToModulePath[fileName];
                // assume import is null means the compiler is fine to skip it and is only in eval
                if (imp == null)
                    continue;
                module.addImport(imp);
            }
        }
    }

    public function parseFolder(path:String):Array<String> {
        final list = FileSystem.readDirectory(path);
        var filePaths:Array<String> = [];
        for (obj in list) {
            obj = Path.join([path, obj]);
            if (FileSystem.isDirectory(obj)) {
                // recursively parseFolder
                filePaths = filePaths.concat(parseFolder(obj));
                continue;
            }
            filePaths.push(obj);
        }
        // process files
        return filePaths;
    }

}
