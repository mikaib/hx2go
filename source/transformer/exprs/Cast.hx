package transformer.exprs;

import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeVar;

function transformCast(t:Transformer, inner: HaxeExpr, e:HaxeExpr, type:ComplexType) {
    switch type {
        case TPath({ pack: [], name: "String" }): { 
            e.def = EGoCode("fmt.Sprint({0})", [inner.copy()]);
        }
        default:
    }
    t.transformComplexType(type);
    t.iterateExpr(e);
}
