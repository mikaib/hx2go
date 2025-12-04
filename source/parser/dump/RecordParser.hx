package parser.dump;

using StringTools;

// TODO:
// - also check if mapConcrete(v, T) is correct.
// - multiline string parsing
// - cf_expr needs to have proper type
// - cf_overloads must be checked if the type is valid.
// - parseExpr must be implemented when shadow is done
// - swap out strings for enums where possible
// - params need their own struct

class RecordParser {

    private var _input: String;

    public function new(input: String) {
        _input = input;
    }

    public function parseBlock(input: String): Map<String, Dynamic> {
        var result: Map<String, Dynamic> = [];
        var lines: Array<String> = input.split("\n");
        var line: Int = 0;

        while (line < lines.length) {
            var currentLine = lines[line].trim();
            if (currentLine == "" || currentLine == "{" || currentLine == "}") {
                line++;
                continue;
            }

            if (currentLine.endsWith(";")) {
                currentLine = currentLine.substring(0, currentLine.length - 1).trim();
            }

            var parts = currentLine.split("=");
            if (parts.length < 2) {
                line++;
                continue;
            }

            var key = parts[0].trim();
            var value = parts.slice(1).join("=").trim();

            var output: Dynamic = switch(0) {
                case _ if (key.endsWith("_meta")):
                    value
                    .substring(1, value.length - 1)
                    .split("@")
                    .filter(s -> s != "")
                    .map(s -> '@${s.trim()}');

                case _ if (key.endsWith("_pos") || key.endsWith("_name_pos")):
                    parsePosition(lines, line, value);

                case _ if (key.endsWith("_flags")):
                    parseFlags(lines, line, value);

                case _ if (key.endsWith("_expr")):
                    parseExpr(lines, line, value);

                case _ if (key == "cl_ordered_statics" || key == "cl_ordered_fields"):
                    var result = parseList(lines, line, value);
                    line = result.lastLine;
                    result.value.map(item -> mapConcrete(item, RecordClassField));

                case _ if (value == "true" || value == "false"):
                    value == "true";

                case _ if (value.startsWith("[")):
                    var result = parseList(lines, line, value);
                    line = result.lastLine;
                    result.value;

                case _:
                    parseString(lines, line, value);
            }

            result.set(key, output);
            line++;
        }

        return result;
    }

    public function parseFlags(lines: Array<String>, entryLine: Int, value: String): Array<String> {
        return value.split(" ");
    }

    public function parsePosition(lines: Array<String>, entryLine: Int, value: String): Dynamic {
        var file = value.substring(0, value.indexOf(":"));
        var posRange = value.substring(value.indexOf(":") + 1, value.length).split("-");
        return {
            file: file,
            min: Std.parseInt(posRange[0]),
            max: Std.parseInt(posRange[1])
        };
    }

    public function parseString(lines: Array<String>, entryLine: Int, value: String): String {
        return value;
    }

    public function parseList(lines: Array<String>, entryLine: Int, value: String): { value: Array<Dynamic>, lastLine: Int } {
        if (value == "[]") {
            return { value: [], lastLine: entryLine };
        }
        var items: Array<Dynamic> = [];
        var line = entryLine;
        var depth = 0;
        var currentItem: Array<String> = [];
        var skipToNextLine = false;

        if (value.startsWith("[")) {
            depth = 1;
            var rest = value.substring(1).trim();
            if (rest.length > 0 && rest.charAt(0) == "{") {
                currentItem.push("{");
                depth++;
            }
            line++;
        }

        while (line < lines.length) {
            var currentLine = lines[line];
            if (skipToNextLine) {
                skipToNextLine = false;
                line++;
                continue;
            }

            var itemComplete = false;
            for (i in 0...currentLine.length) {
                var char = currentLine.charAt(i);

                switch (char) {
                    case "{", "[":
                        depth++;

                    case "}":
                        depth--;
                        if (depth == 1) {
                            currentItem.push(currentLine);
                            items.push(parseBlock(currentItem.join("\n")));
                            currentItem = [];
                            itemComplete = true;
                            break;
                        }

                    case "]":
                        depth--;
                        if (depth == 0) {
                            if (currentItem.length > 0) {
                                items.push(parseBlock(currentItem.join("\n")));
                            }
                            return { value: items, lastLine: line };
                        }
                }
            }

            if (depth > 1 && !itemComplete) {
                currentItem.push(currentLine);
            }

            line++;
        }

        return { value: items, lastLine: line };
    }

    public function parseExpr(lines: Array<String>, entryLine: Int, value: String): Dynamic {
        return new ExprParser().parse(lines.slice(entryLine));
    }

    public function mapConcrete<T>(map: Map<String, Dynamic>, concrete: Class<T>): T {
        var inst = Type.createEmptyInstance(concrete);
        for (field in Reflect.fields(inst)) {
            if (!map.exists(field)) {
                continue;
            }

            Reflect.setField(inst, field, map.get(field));
        }

        return inst;
    }

    public function run(): RecordClass {
        return mapConcrete(
            parseBlock(_input),
            RecordClass
        );
    }

}