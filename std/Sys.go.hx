class Sys {
    public static function println<T>(v:T)
        go.Syntax.code("println({0})", v);
    public static function print<T>(v:T)
        go.Syntax.code("print({0})", v);
}