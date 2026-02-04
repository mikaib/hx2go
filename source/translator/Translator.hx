package translator;

import haxe.macro.Printer;
import haxe.macro.Expr;
import translator.exprs.*;
import translator.TranslatorTools;
import HaxeExpr.HaxeTypeDefinition;

/**
 * Translates Haxe AST to Go AST (strings for now TODO)
 */
@:structInit
class Translator {
    public inline function translateComplexType(ct:ComplexType):String {
        return switch ct {
            case TPath(p):
                if (p.pack.length == 0) {
                    p.name;
                }else{
                    p.pack.join(".") + p.name;
                }
            case TFunction(args, ret):
                "func(" + args.map(arg -> translateComplexType(arg)).join(", ") + ")" + translateComplexType(ret);
            case TAnonymous(fields):
                "map[string]any";
            default:
                throw "unknown ct for translateComplexType: " + ct;
        }
    }
    public function translateExpr(e:HaxeExpr):String {
        if (e == null)
            return "#NULL_TRANSLATED_EXPR";
        if (e.def != null)
            return switch e.def {
                case EGoCode(format, exprs):
                    GoCode.translateGoCode(this, format, exprs);
                case EGoSliceConstruct(ct):
                    GoSliceConstruct.translateGoSliceConstruct(this, ct);
                case EParenthesis(e):
                    Parenthesis.translateParenthesis(this, e);
                case ECall(e, params):
                    Call.translateCall(this, e,params);
                case EBlock(exprs):
                    Block.translateBlock(this, exprs);
                case EField(e, field, kind):
                    FieldAccess.translateFieldAccess(this, e, field, kind);
                case EConst(c):
                    Const.translateConst(this, c);
                case EIf(econd, eif, eelse):
                    If.translateIf(this, econd, eif, eelse);
                case EVars(vars):
                    VarDeclarations.translateVarsDeclarations(this, vars);
                case EBinop(op, e1, e2):
                    BinopExpr.translateBinop(this, op, e1, e2);
                case EUnop(op, postFix, e):
                    UnopExpr.translateUnop(this, op, postFix, e);
                case EWhile(econd, e, normalWhile):
                    While.translateWhile(this, econd, e, normalWhile);
                case ECheckType(e2, t):
                    CheckType.translateCheckType(this, e2, t);
                case EUntyped(e):
                    Untyped.translateUntyped(this, e);
                case ECast(e, t):
                    Cast.translateCast(this, e, t);
                case EBreak:
                    Break.translateBreak(this);
                case EReturn(e):
                    Return.translateReturn(this, e);
                case EFunction(kind, f):
                    translator.exprs.Function.translateFunction(this, "", f, null, true);
                case EObjectDecl(fields):
                    translator.exprs.ObjectDeclaration.translateObjectDeclaration(this, fields);
                case EArrayDecl(values, ct):
                    ArrayDeclaration.translateArrayDeclaration(this, e, values, ct);
                case EArray(e1, e2):
                    translator.exprs.ArrayAccess.translateArrayAccess(this, e1, e2);
                case EThrow(e):
                    Throw.translateThrow(this, e);
                default:
                    //trace("UNKNOWN EXPR TO TRANSLATE:" + e.def);
                    "_ = 0";
            }
        return "";
    }
    public function translateDef(def:HaxeTypeDefinition):String {
        var buf = new StringBuf();

        if (!def.isExtern) {
            switch (def.kind) {
                case TDClass:
                    buf.add(translateClassDef(this, def)); // TODO: support interfaces

                case _:
                    // ignore
            }
        }

        for (field in def.fields) {
            final name = field.isStatic ? 'Hx_${modulePathToPrefix(def.name)}_${toPascalCase(field.name)}' : toPascalCase(field.name);
            final expr:HaxeExpr = field.expr;

            switch field.kind {
                case FFun(_):
                    switch expr.def {
                        case EFunction(kind, f):
                            buf.add(translator.exprs.Function.translateFunction(this, name, f, def, field.isStatic) + "\n");
                        default:
                            Logging.translator.error('expr.def failure field:' + field.name);
                            throw "expr.def is not EFunction: " + expr.def;
                    }
                case FVar:
                    buf.add('var $name'); // TODO: typing
                    if (expr != null)
                        buf.add(translateExpr(expr));
                    buf.add("\n");
                case FProp(get, set): // TODO: impl
//                    buf.add('//FPROP\nvar $name');
//                    if (expr != null)
//                        buf.add(expr);
//                    buf.add("\n");
                default:
            }
        }
        return buf.toString();
    }

    public function translateClassDef(t: Translator, def: HaxeTypeDefinition): String {
        var buf = new StringBuf();
        final className = 'Hx_${modulePathToPrefix(def.name)}';

        buf.add('type ${className}_VTable interface {\n');

        for (field in def.fields) {
            switch field.kind {
                case FFun(_) if (!field.isStatic):
                    final methodName = toPascalCase(field.name);
                    final expr:HaxeExpr = field.expr;

                    buf.add('\t$methodName(');

                    switch expr.def {
                        case EFunction(kind, f): {
                            var first = true;
                            for (arg in f.args) {
                                if (!first) {
                                    buf.add(', ');
                                }
                                first = false;
                                buf.add(arg.name + ' ' + t.translateComplexType(arg.type));
                            }
                            buf.add(') ');

                            final returnType = t.translateComplexType(f.ret);
                            if (returnType != "Void") {
                                buf.add(returnType);
                            }
                        }

                        case _: {
                            Logging.translator.error('expr.def failure field:' + field.name);
                            throw "expr.def is not EFunction: " + expr.def;
                        }
                    }

                    buf.add('\n');

                case _:
            }
        }

        buf.add('}\n\n');

        buf.add('type $className struct {\n');
        buf.add('\tVtable ${className}_VTable\n'); // TODO: add superClass to struct

        if (def.superClass != null) {
            buf.add('\tSuper *Hx_${modulePathToPrefix(def.superClass)}\n');
        }

        buf.add('}\n\n');

        buf.add('func ${className}_New() *$className {\n');
        buf.add('\tobj := &$className{}\n');
        buf.add('\tobj.Vtable = obj\n'); // TODO: also set vtable on the entire hierarchy of super classes
        buf.add('\treturn obj\n');
        buf.add('}\n\n');

        return buf.toString();
    }
}
