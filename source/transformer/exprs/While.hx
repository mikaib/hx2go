package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;

function transformWhile(t:Transformer, e:HaxeExpr, cond:HaxeExpr, body:HaxeExpr, norm:Bool) {
    e.def = EWhile(cond, switch (body.def) {
        case EBlock(_): body;
        case _: { t: null, specialDef: null, def: EBlock([ body ]) };
    }, norm);
}
