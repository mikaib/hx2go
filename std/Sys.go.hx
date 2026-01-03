class Sys {
    public static function println<Type>(v:Type)
        go.Syntax.code("println({0})", v);
    public static function print<Type>(v:Type)
        go.Syntax.code("print({0})", v);
}