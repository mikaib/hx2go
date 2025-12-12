package go;

@:coreType @:notNull @:runtimeValue abstract Int32 {
    @:from public static inline function fromHxInt(x: Int): Int32 {
        return Convert.int32(x);
    }

    @:op(A + B)
    public function add(other: Int32): Int32;

    @:op(A - B)
    public function sub(other: Int32): Int32;

    @:op(-A)
    public function neg(): Int32;

    @:op(A * B)
    public function mut(other: Int32): Int32;

    @:op(A / B)
    public inline function div(other: Int32): Float32 {
        return (this : Float32) / (other : Float32);
    }
}
