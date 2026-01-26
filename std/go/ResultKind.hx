package go;

@:coreType
enum ResultKind<R, E = Error> {
    Success(r: R);
    Failure(e: E);
}
