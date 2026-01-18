@:go.StructAccess({ name: "bass", imports: ["github.com/wieku/danser-go/framework/bass"] })
extern class Bass {
    static function init(offscreen: Bool): Void;
    static function newTrack(path: String): Track;
}

@:go.StructAccess({ name: "*bass.TrackBass", imports: ["github.com/wieku/danser-go/framework/bass"] })
extern class Track {
    function play(): Void;
    function getPosition(): Float;
    function getLength(): Float;
}

class Test {

    public static function main(): Void {
        Bass.init(false);

        var track: Track = Bass.newTrack("/home/mikaib/Music/audio.mp3");
        if (track == null) {
            Sys.println('failed to load sample!');
            return;
        }

        track.play();

        while (true) {
            go.Fmt.println(track.getPosition(), track.getLength());
        }
    }

}