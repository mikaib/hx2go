package parser.dump;

import sys.io.File;

class Deps {
    public static function run(path:String):Map<String,Array<String>> {
        final lines = Util.normalizeCLRF(File.getContent(path)).split("\n");
        var parent = "";
        final map:Map<String,Array<String>> = [];
        final cwd = Sys.getCwd();
        // /Users/o/Documents/GitHub/hx2go/
        // /Users/o/Documents/GitHub/hx2go/std/Sys.go.hx
        for (i in 0...lines.length) {
            // remove prefix of cwd from path
            final isParent = lines[i].charAt(0) != "\t";
            lines[i] = StringTools.ltrim(lines[i]);
            if (cwd == lines[i].substr(0,cwd.length)) {
                lines[i] = lines[i].substr(cwd.length);
            }
            // check if parent or child depending on prefix of tab
            if (isParent) {
                // parent, length - 1 to remove suffix colon
                parent = lines[i].substr(0, lines[i].length - 1);
            }else{
                final child = lines[i];
                if (!map.exists(parent))
                    map[parent] = [];
                map[parent].push(child);
            }
        }
        return map;
    }
}