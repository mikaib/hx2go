package go;

@:coreType
@:runtimeValue
extern abstract Slice<T> {
    @:pure private extern static function _create<T>(): T;
    @:pure private extern static function _sliceStart<T>(slice: Slice<T>, start: Int32): Slice<T>;
    @:pure private extern static function _sliceStartEnd<T>(slice: Slice<T>, start: Int32, end: Int32): Slice<T>;

    public var length(get, never): Int32;
    private inline function get_length(): Int32 {
        return Go.len(this);
    }

    public var capacity(get, never): Int32;
    private inline function get_capacity(): Int32 {
        return Go.cap(this);
    }

    public inline function new() {
        this = _create();
    }

    public inline function append(v: T): Slice<T> {
        return Go.append(this, v);
    }

    public inline function copy(src: Slice<T>): Int32 {
        return Go.copy(this, src);
    }

    public inline extern overload function slice(start: Int32, end: Int32): Slice<T> {
        return _sliceStartEnd(this, start, end);
    }

    public inline extern overload function slice(start: Int32): Slice<T> {
        return _sliceStart(this, start);
    }
}
