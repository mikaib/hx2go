package go;

@:publicFields
@:go.TypeAccess({name: "strconv", imports: ["strconv"]})
extern class StrConv {
	static function ParseBool(str:String):Tuple<{b:Bool, err:Error}>;
	static function ParseFloat(s:String, bitSize:GoInt):Tuple<{f:Float64, err:Error}>;
	static function ParseInt(s:String, base:GoInt, bitSize:GoInt):Tuple<{i:Int64, err:Error}>;
}
