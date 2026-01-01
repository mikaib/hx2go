package go;

abstract Star<T>(Pointer<T>) {

    private inline extern function new(ptr: Pointer<T>) {
        this = ptr;
    }

    @:from @:pure private static inline extern function fromValue<T>(x: T): Star<T> {
        return new Star(Pointer.addressOf(x));
    }

    @:to @:pure private inline extern function toValue(): T {
        return this.value;
    }

}
