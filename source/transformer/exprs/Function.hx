package transformer.exprs;

import HaxeExpr.HaxeFunction;

function transformFunction(t:Transformer, f:HaxeFunction) {
    for (arg in f.args) {
        if (arg.value != null)
            t.iterateExpr(arg.value);
        t.transformComplexType(arg.type);
    }
    t.iterateExpr(f.expr);
    t.transformComplexType(f.ret);
}