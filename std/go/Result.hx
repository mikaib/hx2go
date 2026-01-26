package go;

@:go.ProcessedType
abstract Result<R, E = Error>(ResultKind<R, E>) from ResultKind<R, E> to ResultKind<R, E> {}
