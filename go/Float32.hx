package go;

@:coreType @:notNull @:runtimeValue abstract Float32 from Float to Float {
    @:op(A + B)
    static inline function add(a:Float32, b:Float)
        return (a:Float) + b;
}