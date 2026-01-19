import go.Fmt;

class Test {

    public static function main(): Void {
        var arr: Array<Int> = [1, 2, 3];
        var cpy: Array<Int> = arr.copy();
        arr.push(4);

        var combined = arr.concat(cpy);
        var last = combined.pop();
        var reversed = combined.copy();

        reversed.reverse();

        Fmt.println(arr, cpy, combined, reversed, last);
    }

}

