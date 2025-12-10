package go;

@:go.toplevel
extern class Convert {
    @:go.native("int32")
    public static extern function int32(x: Float): Int;

    @:go.native("int8")
    public static extern function int8(x: Float): Int;

    @:go.native("int16")
    public static extern function int16(x: Float): Int;

    @:go.native("int64")
    public static extern function int64(x: Float): Int;

    @:go.native("float32")
    public static extern function float32(x: Float): Float32;
}