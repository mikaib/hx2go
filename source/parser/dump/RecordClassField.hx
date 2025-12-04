package parser.dump;

import haxe.macro.Expr;

@:structInit
class RecordClassField {
    public var cf_name: Null<String> = null;
    public var cf_doc: Null<String> = null;
    public var cf_type: Dynamic = null;
    public var cf_pos: Null<Position> = null;
    public var cf_name_pos: Null<Position> = null;
    public var cf_meta: Array<String> = [];
    public var cf_kind: Null<String> = null;
    public var cf_params: Array<Dynamic> = [];
    public var cf_expr: Expr = null;
    public var cf_flags: Array<String> = [];
    public var cf_overloads: Array<RecordClassField> = [];
}