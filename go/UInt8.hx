package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract UInt8 {
   @:op(A + B) private function add(other: UInt8): UInt8;
   @:op(A - B) private function sub(other: UInt8): UInt8;
   @:op(A * B) private function mul(other: UInt8): UInt8;
   @:op(A / B) private function div(other: UInt8): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A % B) private function mod(other: UInt8): UInt8;
   @:op(-A) private function neg(): UInt8;
   @:op(++A) private function preinc(): UInt8;
   @:op(A++) private function postinc(): UInt8;
   @:op(--A) private function predec(): UInt8;
   @:op(A--) private function postdec(): UInt8;
   @:op(A == B) private function eq(other: UInt8): Bool;
   @:op(A != B) private function neq(other: UInt8): Bool;
   @:op(A < B) private function lt(other: UInt8): Bool;
   @:op(A <= B) private function lte(other: UInt8): Bool;
   @:op(A > B) private function gt(other: UInt8): Bool;
   @:op(A >= B) private function gte(other: UInt8): Bool;
   @:op(A & B) private function and(other: UInt8): UInt8;
   @:op(A | B) private function or(other: UInt8): UInt8;
   @:op(A ^ B) private function xor(other: UInt8): UInt8;
   @:op(~A) private function not(): UInt8;
   @:op(A << B) private function lshift(other: UInt8): UInt8;
   @:op(A >> B) private function rshift(other: UInt8): UInt8;
   @:op(A >>> B) private function urshift(other: UInt8): UInt8;
   @:from public static inline function fromInt(x: Int): UInt8 {
       return Convert.uint8(x);
   }
}