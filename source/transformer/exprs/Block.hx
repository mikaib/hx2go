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

    extractBlock(t, [], e);

    var finalExpr = exprs.pop();
    e.copyFrom(finalExpr);

    var block = t.findOuterBlock(e.parent);
    trace(block);

    var insertInto = switch (block.of.def) {
        case EBlock(x): x;
        case _: null;
    }

    if (insertInto == null) {
        trace('insertInto should not be null!');
        return;
    }

    var insertAt = block.pos;
    for (expr in exprs) {
        insertInto.insert(insertAt, expr);
    }
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
