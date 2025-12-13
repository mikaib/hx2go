package translator.exprs;

using StringTools;

import haxe.macro.Expr.ComplexType;
import haxe.macro.ComplexTypeTools;
import translator.Translator;
import HaxeExpr;

function translateGoSliceGet(t:Translator, on:HaxeExpr, idx:HaxeExpr) {
    return t.translateExpr(on) + '[' + t.translateExpr(idx) + ']';
}
