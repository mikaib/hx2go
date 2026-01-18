package translator.exprs;

import translator.Translator;
import HaxeExpr;

function translateReturn(t:Translator, e:HaxeExpr) {
    return e == null ? 'return' : 'return ${t.translateExpr(e)}';
} 