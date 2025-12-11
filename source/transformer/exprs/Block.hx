package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;

function transformBlock(t:Transformer, e:HaxeExpr, exprs:Array<HaxeExpr>) {
    t.iterateExpr(e);

    if (e.parent == null) {
        return;
    }

    var allowed = switch(e.parent.def) {
        case EWhile(_, _, _) | EIf(_, _, _) | EFunction(_, _): true;
        case _: false;
    }

    if (allowed) {
        return; // the block is allowed, no need to process it further.
    }

    trace(e);
    extractBlock(t, [], e);
}

// this function takes a block and modifies the contents so everything is unique (no duplicate var names and such...)
function extractBlock(t:Transformer, remappedNames:Map<String, String>, e:HaxeExpr) {
    if (e?.def == null) {
        return;
    }

    switch (e.def) {
        case EVars(vars):
            for (v in vars) {
                var remap = t.getTempName();
                remappedNames[v.name] = remap;

                v.name = remap;
            }

        case EConst(CIdent(name)):
            e.def = EConst(CIdent(remappedNames[name] ?? name));

        case _: HaxeExprTools.iter(e, extractBlock.bind(t, remappedNames, _));
    }
}
