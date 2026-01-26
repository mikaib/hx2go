import go.Result;
import go.ResultKind.*;
import go.Error;
import go.Fmt;

@:go.TypeAccess({ name: "*os.File", imports: ["os"] })
extern class File {}

@:go.TypeAccess({ name: "os", imports: ["os"] })
extern class OS {
    static function open(path: String): Result<File, Error>;
}

class Test {

    public static function main() {
        var file: Null<File> = switch OS.open("~/Documents/test.txt") {
            case Success(r): Fmt.println("File opened :-)", r); r;
            case Failure(e): Fmt.println("Failed :'(", e); null;
        }

        Fmt.println("Final result:", file);
    }

}

