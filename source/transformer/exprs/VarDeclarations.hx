package transformer.exprs;

import haxe.macro.ComplexTypeTools;
import HaxeExpr.HaxeVar;

function transformVarDeclarations(t:Transformer, e:HaxeExpr, vars:Array<HaxeVar>) {
    for (i in 0...vars.length) {
        // mikaib: unsure if this breaks anything else, so I'll leave it be for now...
        // if (vars[i].expr == null) {
        //     vars[i].expr = {
        //         t: ComplexTypeTools.toString(vars[i].type),
        //         def: EConst(CIdent("null"))
        //     };
        // }

        t.transformComplexType(vars[i].type);
        t.transformExpr(vars[i].expr, e, i);
    }
}
