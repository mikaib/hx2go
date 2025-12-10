package go;

@:coreType @:notNull @:runtimeValue abstract Int64 from Int {
	/**
		Destructively cast to Int
	**/
	public inline function toInt():Int {
		return cast this;
	}

	@:to
	@:deprecated("Implicit cast from Int64 to Int (32 bits) is deprecated. Use .toInt() or explicitly cast instead.")
	inline function implicitToInt(): Int {
		return toInt();
	}

	@:to
	inline function toInt64():haxe.Int64 {
		return cast this;
	}

	@:from
	static inline function ofInt64(x:haxe.Int64):Int64 {
		return cast x;
	}
}