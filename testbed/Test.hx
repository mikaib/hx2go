@:go.TypeAccess({ name: "machine", imports: ["machine"] })
extern class PinMode {}

@:structInit
@:go.TypeAccess({ name: "machine.PinConfig", imports: ["machine"] })
extern class PinConfig {
    var mode: PinMode;
}

@:go.TypeAccess({ name: "machine.Pin", imports: ["machine"] })
extern class Pin {
    function low(): Void;
    function high(): Void;
    function configure(config: PinConfig): Void;
}

@:go.TypeAccess({ name: "machine", imports: ["machine"] })
extern class Machine {
    static var LED: Pin;
    static var pinOutput: PinMode;
    static var pinInput: PinMode;
    static var pinInputPullup: PinMode;
}

class Test {

    public static function main() {
        var pin = Machine.LED;
        var conf: PinConfig = {
            mode: Machine.pinOutput
        };

        pin.configure(conf);

        while (true) {
            pin.high();
            Sys.sleep(1);
            pin.low();
            Sys.sleep(1);
        }
    }

}

