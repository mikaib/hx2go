package go;

@:coreType @:notNull @:runtimeValue abstract Int32 {
    @:from public static inline function fromHxInt(x: Int): Int32 {
        return Convert.int32(x);
    }
}
