import go.math.Rand;
import go.StrConv;
import go.Fmt;
import go.Go;

extern class Std {
	// TODO: this extern is incomplete - https://api.haxe.org/Std.html
	inline static function string(s:Dynamic):String
		return Fmt.sprintf("%v", s);

	@:deprecated('Std.is is deprecated. Use Std.isOfType instead.')
	static function is(v:Dynamic, t:Dynamic):Bool;

	static function isOfType(v:Dynamic, t:Dynamic):Bool;
	static function downcast<T:{}, S:T>(value:T, c:Class<S>):S;

	@:deprecated('Std.instance() is deprecated. Use Std.downcast() instead.')
	static function instance<T:{}, S:T>(value:T, c:Class<S>):S;

	inline static function int(x:Float):Int
		return Go.int(x);

	inline static function parseInt(x:String):Null<Int> {
		// Workaround because a direct return does weird formatting
		var result = StrConv.ParseInt(x, 10, 0);
		return result.i;
	}

	inline static function parseFloat(x:String):Float {
		var result = StrConv.ParseFloat(x, 64);
		return result.f;
	}

	inline static function random(x:Int):Int {
		return Rand.intn(x);
	}
}
