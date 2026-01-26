package go;

enum ResultKind<R, E> {
    Success(r: R);
    Failure(e: E);
}
