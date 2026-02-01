package transformer.exprs;

import haxe.macro.Expr.Binop;
import haxe.macro.Expr.TypePath;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Expr.ComplexType;
import preprocessor.Preprocessor;
import haxe.EnumTools.EnumValueTools;
import preprocessor.Semantics;

function transformBinop(t:Transformer, e:HaxeExpr, op:Binop, e1:HaxeExpr, e2:HaxeExpr) {
    if (handleSideTransform(t, e, op, e1, e2)) return;
    if (handleSideTransform(t, e, op, e2, e1)) return;

    if (e1.t != e2.t && op != OpAssign) {
        promoteBinop(e1, e2, e, op);
    }

    t.iterateExpr(e);
}

function exprToInt(e: HaxeExpr): Int {
    return switch e.def {
        case EConst(CInt(s, _)): Std.parseInt(s);
        case _: 0;
    }
}

function handleSideTransform(t:Transformer, e:HaxeExpr, op:Binop, side:HaxeExpr, otherSide:HaxeExpr):Bool {
    return switch side?.def {
        case EGoEnumIndex(expr): {
            if (expr?.t == null)
                return false;

            switch HaxeExprTools.stringToComplexType(expr.t) {
                case TPath({ pack: ["go"], name: "Result", params: [_, TPType(errType)] }) if (op == OpEq || op == OpNotEq): handleResultBinop(t, e, op, expr, otherSide, errType);
                case _: false;
            }
        }

        case _: false;
    }
}

function handleResultBinop(t:Transformer, e:HaxeExpr, op:Binop, side:HaxeExpr, otherSide:HaxeExpr, errType:ComplexType):Bool {
    final enumIdx = exprToInt(otherSide);
    final cmpError = (op == OpEq) == (enumIdx == 0) ? OpEq : OpNotEq;

    e.def = EBinop(cmpError, {
        t: null,
        def: EField(side, "Error")
    }, {
        t: ComplexTypeTools.toString(errType),
        def: EConst(CIdent("null"))
    });

    t.iterateExpr(e);

    return true;
}

function unpackNull(ct: ComplexType) { // avoid usage of this if you can...
    if (ct == null) {
        return null;
    }

    return switch ct {
        case TPath({ pack: [], name: "Null", params: [TPType(inner)] }): inner;
        case _: ct;
    }
}

function promoteBinop(e1:HaxeExpr, e2:HaxeExpr, e:HaxeExpr, op: Binop) {
    if (e.t == null) {
        Logging.transformer.warn("unknown return type of binop");
        return;
    }

    final resultCt = HaxeExprTools.stringToComplexType(e.t);
    final leftCt = unpackNull(e1.t != null ? HaxeExprTools.stringToComplexType(e1.t) : null);
    final rightCt = unpackNull(e2.t != null ? HaxeExprTools.stringToComplexType(e2.t) : null);

    switch resultCt {
        case TPath({ pack: [], name: "Bool" }): { // compare
            // TODO: impl
        }

        case _: { // generic
            // TODO: impl
        }
    }
}

