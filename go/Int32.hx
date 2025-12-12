package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract Int32 {
   @:op(A + B) private function add(other: Int32): Int32;
   @:op(A - B) private function sub(other: Int32): Int32;
   @:op(A * B) private function mul(other: Int32): Int32;
   @:op(A / B) private function div(other: Int32): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A % B) private function mod(other: Int32): Int32;
   @:op(-A) private function neg(): Int32;
   @:op(++A) private function preinc(): Int32;
   @:op(A++) private function postinc(): Int32;
   @:op(--A) private function predec(): Int32;
   @:op(A--) private function postdec(): Int32;
   @:op(A == B) private function eq(other: Int32): Bool;
   @:op(A != B) private function neq(other: Int32): Bool;
   @:op(A < B) private function lt(other: Int32): Bool;
   @:op(A <= B) private function lte(other: Int32): Bool;
   @:op(A > B) private function gt(other: Int32): Bool;
   @:op(A >= B) private function gte(other: Int32): Bool;
   @:op(A & B) private function and(other: Int32): Int32;
   @:op(A | B) private function or(other: Int32): Int32;
   @:op(A ^ B) private function xor(other: Int32): Int32;
   @:op(~A) private function not(): Int32;
   @:op(A << B) private function lshift(other: Int32): Int32;
   @:op(A >> B) private function rshift(other: Int32): Int32;
   @:op(A >>> B) private function urshift(other: Int32): Int32;
   @:from public static inline function fromInt(x: Int): Int32 {
       return Convert.int32(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Int32 {
       return Convert.int32(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): Int32 {
       return Convert.int32(x);
   }
   @:from public static inline function fromInt8(x: Int8): Int32 {
       return Convert.int32(x);
   }
   @:from public static inline function fromInt16(x: Int16): Int32 {
       return Convert.int32(x);
   }
}