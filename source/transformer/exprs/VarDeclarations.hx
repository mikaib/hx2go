package transformer.exprs;

import HaxeExpr.HaxeVar;

function transformVarDeclarations(t:Transformer, vars:Array<HaxeVar>) {
    for (i in 0...vars.length) {
        t.transformComplexType(t, vars[i].type);
        t.iterateExpr(vars[i].expr);
    }
}