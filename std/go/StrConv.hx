package go;

@:go.TypeAccess({name: "strconv", imports: ["strconv"]})
extern class StrConv {
	static function parseBool(str:String):Result<Bool, Error>;
	static function parseFloat(s:String, bitSize:GoInt):Result<Float64, Error>;
	static function parseInt(s:String, base:GoInt, bitSize:GoInt):Result<Int64, Error>;
}
