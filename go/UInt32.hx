package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract UInt32 {
   @:op(A + B) private function add(other: UInt32): UInt32;
   @:op(A - B) private function sub(other: UInt32): UInt32;
   @:op(A * B) private function mul(other: UInt32): UInt32;
   @:op(A / B) private function div(other: UInt32): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A % B) private function mod(other: UInt32): UInt32;
   @:op(-A) private function neg(): UInt32;
   @:op(++A) private function preinc(): UInt32;
   @:op(A++) private function postinc(): UInt32;
   @:op(--A) private function predec(): UInt32;
   @:op(A--) private function postdec(): UInt32;
   @:op(A == B) private function eq(other: UInt32): Bool;
   @:op(A != B) private function neq(other: UInt32): Bool;
   @:op(A < B) private function lt(other: UInt32): Bool;
   @:op(A <= B) private function lte(other: UInt32): Bool;
   @:op(A > B) private function gt(other: UInt32): Bool;
   @:op(A >= B) private function gte(other: UInt32): Bool;
   @:op(A & B) private function and(other: UInt32): UInt32;
   @:op(A | B) private function or(other: UInt32): UInt32;
   @:op(A ^ B) private function xor(other: UInt32): UInt32;
   @:op(~A) private function not(): UInt32;
   @:op(A << B) private function lshift(other: UInt32): UInt32;
   @:op(A >> B) private function rshift(other: UInt32): UInt32;
   @:op(A >>> B) private function urshift(other: UInt32): UInt32;
   @:from public static inline function fromInt(x: Int): UInt32 {
       return Convert.uint32(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): UInt32 {
       return Convert.uint32(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): UInt32 {
       return Convert.uint32(x);
   }
}