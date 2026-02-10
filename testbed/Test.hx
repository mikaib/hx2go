import go.Fmt;
//class Vehicle {
//
//    public function new() {
//        Sys.println("Vehicle created");
//    }
//
//    public function start(): Void {
//        Sys.println("Vehicle started");
//    }
//
//    public function horsepower(): Int {
//        return 100;
//    }
//
//}
//
//class Car extends Vehicle {
//
//    override public function start(): Void {
//        Sys.println("Car started");
//    }
//
//    public function honk(): Void {
//        Sys.println("Car honked");
//    }
//
//}
//
//class Truck extends Car {
//
//    override public function start(): Void {
//        Sys.println("Truck started");
//    }
//
//    override public function honk(): Void {
//        Sys.println("Truck honked loudly");
//    }
//
//}
//
//@:analyzer(ignore)
//class Test {
//
//    public static function main() {
//        var truck: Truck = new Truck();
//        var vehicle: Vehicle = truck;
//        Sys.println(vehicle.horsepower());
//
//        vehicle.start();
//
//        Sys.println(truck.horsepower());
//        truck.honk();
//    }
//
//}
//
///*
//
//14:05:18:663   Test.hx:4:,Vehicle created
//14:05:18:664   Test.hx:20:,Car started
//14:05:18:664   Test.hx:24:,Car honked
//14:05:18:664   Test.hx:4:,Vehicle created
//14:05:18:664   Test.hx:33:,Truck started
//14:05:18:664   Test.hx:37:,Truck honked loudly
//14:05:18:664   Test.hx:4:,Vehicle created
//14:05:18:664   Test.hx:8:,Vehicle started
//14:05:18:664   Test.hx:65:,100
// */

//class Ref<T> {
//
//    public var value: T;
//
//    public function new(_value: T) {
//        set(_value);
//    }
//
//    public function set(_value: T) {
//        value = _value;
//    }
//
//    public function get(): T {
//        return value;
//    }
//
//}

class Greeter {

    public var name: String;

    public function new(_name: String) {
        name = _name;
    }

    public function greet(): Void {
        Fmt.println("Hello,", name);
    }

}

@:analyzer(ignore)
class Test {

    public static function main() {
//        var x: Ref<Int> = new Ref(3);
//        Fmt.println(x.get());
//        x.set(5);
//        Fmt.println(x.get());
//        x.set(10);
//
//        var y: Ref<Ref<Int>> = new Ref(x);
//        Fmt.println(y.get());
//        Fmt.println(y.get().get());

        var g = new Greeter("Joe");
        g.greet();
    }

}