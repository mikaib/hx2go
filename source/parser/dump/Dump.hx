package parser.dump;

import haxe.io.Bytes;
import haxe.macro.Type;

class Dump implements parser.IParser {

    var exprParser = new ExprParser();

    public function new() {
     
    }
    
    public function parseExpr(expr: String): TypedExpr {
        exprParser.parse(expr);
    } 
    
    public function run(data: Bytes): ParserInfo {
        return {};
    }

}