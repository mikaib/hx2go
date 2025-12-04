package parser.dump;

import haxe.macro.Expr;

@:structInit
class RecordClass {
    public var cl_path: Null<String> = null;
    public var cl_module: Null<String> = null;
    public var cl_pos: Null<Position> = null;
    public var cl_name_pos: Null<Position> = null;
    public var cl_private: Bool = false;
    public var cl_doc: Null<String> = null;
    public var cl_meta: Array<String> = [];
    public var cl_flags: Array<String> = [];
    public var cl_params: Array<Dynamic> = [];
    public var cl_kind: Null<String> = null;
    public var cl_super: Null<String> = null;
    public var cl_implements: Array<String> = [];
    public var cl_array_access: Null<String> = null;
    public var cl_init: Null<String> = null;
    public var cl_constructor: Null<String> = null;
    public var cl_ordered_fields: Array<RecordClassField> = [];
    public var cl_ordered_statics: Array<RecordClassField> = [];
}