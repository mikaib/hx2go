import go.Fmt;

class Test {

    public static function main(): Void {
        var arr = ["Hello", "World", "Hx2go"];
        arr.push("!");
        arr.reverse();

        for (word in arr) {
            Fmt.println(word);
        }

        Sys.println(arr.copy());
        Sys.println(arr.join(", "));
    }

}

