package translator.exprs;

using StringTools;

import haxe.macro.Expr.ComplexType;
import haxe.macro.ComplexTypeTools;
import translator.Translator;
import HaxeExpr;

function translateGoSliceSet(t:Translator, on:HaxeExpr, idx:HaxeExpr, val:HaxeExpr) {
    return t.translateExpr(on) + '[' + t.translateExpr(idx) + '] = ' + t.translateExpr(val);
}
