import go.Float64;
import go.Fmt;

@:go.StructAccess({ name: "bass", imports: ["github.com/wieku/danser-go/framework/bass"] })
extern class Bass {
    static function init(offscreen: Bool): Void;
    static function newTrack(path: String): Track;
}

@:go.StructAccess({ name: "*bass.TrackBass", imports: ["github.com/wieku/danser-go/framework/bass"] })
extern class Track {
    function play(): Void;
    function getPosition(): Float64;
    function getLength(): Float64;
}

class Test {

    public static function main(): Void {
        Bass.init(false);

        var track: Track = Bass.newTrack("/home/mikaib/Music/audio.mp3");
        if (track == null) {
            Sys.println('failed to load track!');
            return;
        }

        track.play();

        while (true) {
            Fmt.println(track.getPosition(), '/', track.getLength());
        }
    }

}