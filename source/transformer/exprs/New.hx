package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;
import translator.TranslatorTools;
import haxe.macro.Expr.TypePath;
import haxe.macro.Expr.MetadataEntry;
import transformer.exprs.FieldAccess;

function transformNew(t:Transformer, e:HaxeExpr, tpath: TypePath, params: Array<HaxeExpr>) {
    final td = t.module.resolveClass(tpath.pack, tpath.name, t.module.path);
    if (td == null) {
        trace('null td for ENew(...)');
    }

    var structInit = false;
    var isNative = false;
    var transformName = false;
    var name = ''; // TODO: default name

    for (m in td.meta()) {
        switch m.name {
            case ':structInit':
                structInit = true;

            case ':go.TypeAccess':
                var res = processStructAccessMeta(t, m, name);
                isNative = res.isNative;
                transformName = res.transformName;
                name = res.name;

            case _: null;
        }
    }

    if (isNative && structInit) {
        e.def = EGoCode('${name}{ Mode: {0} }', params); // TODO: impl
    }

    // TODO: handle normal case

    for (p in params) {
        t.transformExpr(p);
    }
}