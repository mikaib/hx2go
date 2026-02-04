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
//    public function new() {
//        super();
//    }
//
//    override public function start(): Void {
//        super.start();
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
//    public function new() {
//        super();
//    }
//
//    override public function start(): Void {
//        super.start();
//        Sys.println("Truck started");
//    }
//
//    override public function honk(): Void {
//        super.honk();
//        Sys.println("Truck honked loudly");
//    }
//
//}

class MyClass {

    public function new() {
        Sys.println("MyClass instance created");
    }

    public function greet(): Void {
        Sys.println("Hello from MyClass!");
    }

    public function greetFromSelf(): Void {
        Sys.println("Greeting from: " + this);
        this.greet();
    }

}

class MySecondClass extends MyClass {

    override public function greet(): Void {
        Sys.println("Hello from MySecondClass!");
    }

}

class MyThirdClass extends MySecondClass {

    override public function greet(): Void {
        Sys.println("Hello from MyThirdClass!");
    }

}

class Test {

    public static function main() {
        var clsA = new MyClass();
        clsA.greet();
        clsA.greetFromSelf();

        var clsB = new MySecondClass();
        clsB.greet();
        clsB.greetFromSelf();

        var clsC = new MyThirdClass();
        clsC.greet();
        clsC.greetFromSelf();

//        var myCar = new Car();
//        myCar.start();
//        myCar.honk();
//
//        var myTruck = new Truck();
//        myTruck.start();
//        myTruck.honk();
//
//        var myVehicle: Vehicle = new Vehicle();
//        myVehicle.start();
//
//        var carAsVehicle: Vehicle = myCar;
//        carAsVehicle.start();
//
//        var truckAsVehicle: Vehicle = myTruck;
//        truckAsVehicle.start();
//
//        var truckAsCar: Car = myTruck;
//        truckAsCar.honk();
//
//        Sys.println(myTruck.horsepower());

        /*
            Expected Output:

            09:24:26:711   Test.hx:4:,Vehicle created
            09:24:26:712   Test.hx:8:,Vehicle started
            09:24:26:712   Test.hx:21:,Car started
            09:24:26:712   Test.hx:25:,Car honked
            09:24:26:712   Test.hx:4:,Vehicle created
            09:24:26:712   Test.hx:8:,Vehicle started
            09:24:26:712   Test.hx:21:,Car started
            09:24:26:712   Test.hx:38:,Truck started
            09:24:26:712   Test.hx:25:,Car honked
            09:24:26:712   Test.hx:43:,Truck honked loudly
            09:24:26:712   Test.hx:4:,Vehicle created
            09:24:26:712   Test.hx:8:,Vehicle started
            09:24:26:712   Test.hx:8:,Vehicle started
            09:24:26:712   Test.hx:21:,Car started
            09:24:26:712   Test.hx:8:,Vehicle started
            09:24:26:712   Test.hx:21:,Car started
            09:24:26:712   Test.hx:38:,Truck started
            09:24:26:712   Test.hx:25:,Car honked
            09:24:26:712   Test.hx:43:,Truck honked loudly
         */
    }

}