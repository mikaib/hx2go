import go.Go;

@:analyzer(ignore)
class Test {

    public static function main() {
        var i: Int = 15;
        var f: Float = 20;

        var i32 = Go.int32(10);
        var u32 = Go.uint32(10);

        Sys.println(i == f);
        Sys.println(i32 == u32);

        var aI: Int = -1;
        var bI: Int = 1;
        Sys.println((aI >>> bI : Int));
    }

}
