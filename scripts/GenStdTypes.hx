using StringTools;

/*
    This script is here to quickly generate all the integer and float types inside of ``/go``
    The script is to possibly be replaced by go2hx generation in the future, but considering the specific nature of these types, that may not happen.
*/

import sys.io.File;
import haxe.io.Path;

var types = ["uint8", "uint16", "uint32", "uint64", "int8", "int16", "int32", "int64", "float32", "float64"];
var operators = [
    { name: "add",      format: "A + B",   bitwise: false, outFloat: false, outBool: false, unary: false },
    { name: "sub",      format: "A - B",   bitwise: false, outFloat: false, outBool: false, unary: false },
    { name: "mul",      format: "A * B",   bitwise: false, outFloat: false, outBool: false, unary: false },
    { name: "div",      format: "A / B",   bitwise: false, outFloat: true,  outBool: false, unary: false },
    { name: "mod",      format: "A % B",   bitwise: false, outFloat: false, outBool: false, unary: false },
    { name: "neg",      format: "-A",      bitwise: false, outFloat: false, outBool: false, unary: true  },
    { name: "preinc",   format: "++A",     bitwise: false, outFloat: false, outBool: false, unary: true  },
    { name: "postinc",  format: "A++",     bitwise: false, outFloat: false, outBool: false, unary: true  },
    { name: "predec",   format: "--A",     bitwise: false, outFloat: false, outBool: false, unary: true  },
    { name: "postdec",  format: "A--",     bitwise: false, outFloat: false, outBool: false, unary: true  },
    { name: "eq",       format: "A == B",  bitwise: false, outFloat: false, outBool: true,  unary: false },
    { name: "neq",      format: "A != B",  bitwise: false, outFloat: false, outBool: true,  unary: false },
    { name: "lt",       format: "A < B",   bitwise: false, outFloat: false, outBool: true,  unary: false },
    { name: "lte",      format: "A <= B",  bitwise: false, outFloat: false, outBool: true,  unary: false },
    { name: "gt",       format: "A > B",   bitwise: false, outFloat: false, outBool: true,  unary: false },
    { name: "gte",      format: "A >= B",  bitwise: false, outFloat: false, outBool: true,  unary: false },
    { name: "and",      format: "A & B",   bitwise: true,  outFloat: false, outBool: false, unary: false },
    { name: "or",       format: "A | B",   bitwise: true,  outFloat: false, outBool: false, unary: false },
    { name: "xor",      format: "A ^ B",   bitwise: true,  outFloat: false, outBool: false, unary: false },
    { name: "not",      format: "~A",      bitwise: true,  outFloat: false, outBool: false, unary: true  },
    { name: "lshift",   format: "A << B",  bitwise: true,  outFloat: false, outBool: false, unary: false },
    { name: "rshift",   format: "A >> B",  bitwise: true,  outFloat: false, outBool: false, unary: false },
    { name: "urshift",  format: "A >>> B", bitwise: true,  outFloat: false, outBool: false, unary: false }
];

var path = "./go";

function toModuleName(str: String) {
    var count = isUnsigned(str) ? 2 : 1;
    return str.substring(0, count).split('').map(c -> c.toUpperCase()).join('') + str.substring(count);
}

function getPrecision(t: String) {
    var pos = t.length - 1;

    while (pos > 0) {
        var char = t.charAt(pos);
        if (Std.parseInt(char) == null) {
            break;
        }

        pos--;
    }

    return Std.parseInt(t.substring(pos + 1));
}

function isFloatType(t: String) {
    return t.toLowerCase().contains('float');
}

function isUnsigned(t: String) {
    return t.toLowerCase().startsWith('u');
}

function main() {
    for (t in types) {
        var module = toModuleName(t);
        var path = Path.join([ path, '$module.hx' ]);
        var content = new StringBuf();

        content.add('package go;\n\n');
        content.add('// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------\n');
        content.add('// Please invoke the generator using `./Scripts/GenStdTypes` from the project root\n');
        content.add('// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------\n\n');
        content.add('@:coreType\n');
        content.add('@:notNull\n');
        content.add('@:runtimeValue\n');
        content.add('abstract $module {\n');

        // info
        var isFloat = isFloatType(module);
        var precision = getPrecision(module);
        var signed = !isUnsigned(module);

        // operator overloads
        for (op in operators) {
            if (op.bitwise && isFloat) continue;

            var returnType = if (op.outFloat) 'Float64';
            else if (op.outBool) 'Bool';
            else module;

            var args = if (op.unary) '';
            else 'other: ${module}';

            switch (op.name) {
                case "div" if (returnType != module):
                    content.add('   @:op(${op.format}) private function ${op.name}(${args}): ${returnType} {\n');
                    content.add('       return (this:${returnType}) / (other:${returnType});\n');
                    content.add('   }\n');
                case _:
                    content.add('   @:op(${op.format}) private function ${op.name}(${args}): ${returnType};\n');
            }
        }

        // @:from functions
        var fromTypes = ['Int'];
        for (f in types) {
            if (isFloatType(f)) continue;
            if (!isUnsigned(f) && !signed) continue; // Int32 can hold UInt16, UInt16 cannot hold Int32, Int32 cannot hold UInt32
            if (getPrecision(f) >= precision && (!isFloat || getPrecision(f) != precision)) continue; // Int32 may not have fromInt32, but Float32 may have fromInt32.

            fromTypes.push(
                toModuleName(f)
            );
        }

        if (isFloat) {
            fromTypes.push('Float');

            for (f in types) {
                if (!isFloatType(f)) continue;
                if (getPrecision(f) >= precision) continue;

                fromTypes.push(
                    toModuleName(f)
                );
            }
        }

        for (f in fromTypes) {
            content.add('   @:from public static inline function from${f}(x: ${f}): $module {\n');
            content.add('       return Convert.$t(x);\n');
            content.add('   }\n');
        }

        content.add('}');

        File.saveContent(path, content.toString());
    }

    var convPath = Path.join([ path, 'Convert.hx' ]);
    var convContent = new StringBuf();

    convContent.add('package go;\n\n');
    convContent.add('// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------\n');
    convContent.add('// Please invoke the generator using `./Scripts/GenStdTypes` from the project root\n');
    convContent.add('// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------\n\n');
    convContent.add('@:go.toplevel\n');
    convContent.add('extern class Convert {\n');

    for (t in types) {
        var module = toModuleName(t);
        convContent.add('   @:go.native("$t")\n');
        convContent.add('   public static extern function $t(x: Any): $module;\n');
    }

    convContent.add('}');

    File.saveContent(convPath, convContent.toString());
}
