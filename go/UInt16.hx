package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract UInt16 {
   @:op(A + B) private function add(other: UInt16): UInt16;
   @:op(A - B) private function sub(other: UInt16): UInt16;
   @:op(A * B) private function mul(other: UInt16): UInt16;
   @:op(A / B) private function div(other: UInt16): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A % B) private function mod(other: UInt16): UInt16;
   @:op(-A) private function neg(): UInt16;
   @:op(++A) private function preinc(): UInt16;
   @:op(A++) private function postinc(): UInt16;
   @:op(--A) private function predec(): UInt16;
   @:op(A--) private function postdec(): UInt16;
   @:op(A == B) private function eq(other: UInt16): Bool;
   @:op(A != B) private function neq(other: UInt16): Bool;
   @:op(A < B) private function lt(other: UInt16): Bool;
   @:op(A <= B) private function lte(other: UInt16): Bool;
   @:op(A > B) private function gt(other: UInt16): Bool;
   @:op(A >= B) private function gte(other: UInt16): Bool;
   @:op(A & B) private function and(other: UInt16): UInt16;
   @:op(A | B) private function or(other: UInt16): UInt16;
   @:op(A ^ B) private function xor(other: UInt16): UInt16;
   @:op(~A) private function not(): UInt16;
   @:op(A << B) private function lshift(other: UInt16): UInt16;
   @:op(A >> B) private function rshift(other: UInt16): UInt16;
   @:op(A >>> B) private function urshift(other: UInt16): UInt16;
   @:from public static inline function fromInt(x: Int): UInt16 {
       return Convert.uint16(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): UInt16 {
       return Convert.uint16(x);
   }
}