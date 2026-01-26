package go;

@:coreType
enum ResultKind<R, E = Error> {
    Ok(r: R);
    Err(e: E);
}
