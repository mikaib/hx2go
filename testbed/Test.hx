import go.Fmt;

import haxe.iterators.ArrayIterator;

class Vehicle {

    public function new() {
        Sys.println("Vehicle created");
    }

    public function start(): Void {
        Sys.println("Vehicle started");
    }

    public function horsepower(): Int {
        return 100;
    }

}

class Car extends Vehicle {

    override public function start(): Void {
        Sys.println("Car started");
    }

    public function honk(): Void {
        Sys.println("Car honked");
    }

}

class Truck extends Car {

    override public function start(): Void {
        Sys.println("Truck started");
    }

    override public function honk(): Void {
        Sys.println("Truck honked loudly");
    }

}

class Ref<T> {

    public var value: T;

    public function new(_value: T) {
        set(_value);
    }

    public function set(_value: T) {
        value = _value;
    }

    public function get(): T {
        return value;
    }

}

@:analyzer(ignore)
class Test {

    public static function main() {
        var arr = [1, 2, 3];
        var str = ["a", "b", "c"];
        var arr_iter = new ArrayIterator(arr);
        var str_iter = new ArrayIterator(str);

        for (x in arr_iter) {
            Fmt.println('iter', x);
        }

        for (x in str_iter) {
            Fmt.println('iter', x);
        }

        var x: Ref<Int> = new Ref(3);
        Fmt.println(x.get());
        x.set(5);
        Fmt.println(x.get());
        x.set(10);

        var y: Ref<Ref<Int>> = new Ref(x);
        Fmt.println(y.get());
        Fmt.println(y.get().get());

        var truck: Truck = new Truck();
        var vehicle: Vehicle = truck;
        Sys.println(vehicle.horsepower());

        vehicle.start();

        Sys.println(truck.horsepower());
        truck.honk();
    }

}