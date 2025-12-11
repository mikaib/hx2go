package transformer.exprs;

import HaxeExpr.HaxeVar;

function transformVarDeclarations(t:Transformer, e:HaxeExpr, vars:Array<HaxeVar>) {
    for (i in 0...vars.length) {
        t.transformComplexType(vars[i].type);
        t.transformExpr(vars[i].expr, e, i);
    }
}
