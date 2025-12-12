package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract Int16 {
   @:op(A + B) private function add(other: Int16): Int16;
   @:op(A - B) private function sub(other: Int16): Int16;
   @:op(A * B) private function mul(other: Int16): Int16;
   @:op(A / B) private function div(other: Int16): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A % B) private function mod(other: Int16): Int16;
   @:op(-A) private function neg(): Int16;
   @:op(++A) private function preinc(): Int16;
   @:op(A++) private function postinc(): Int16;
   @:op(--A) private function predec(): Int16;
   @:op(A--) private function postdec(): Int16;
   @:op(A == B) private function eq(other: Int16): Bool;
   @:op(A != B) private function neq(other: Int16): Bool;
   @:op(A < B) private function lt(other: Int16): Bool;
   @:op(A <= B) private function lte(other: Int16): Bool;
   @:op(A > B) private function gt(other: Int16): Bool;
   @:op(A >= B) private function gte(other: Int16): Bool;
   @:op(A & B) private function and(other: Int16): Int16;
   @:op(A | B) private function or(other: Int16): Int16;
   @:op(A ^ B) private function xor(other: Int16): Int16;
   @:op(~A) private function not(): Int16;
   @:op(A << B) private function lshift(other: Int16): Int16;
   @:op(A >> B) private function rshift(other: Int16): Int16;
   @:op(A >>> B) private function urshift(other: Int16): Int16;
   @:from public static inline function fromInt(x: Int): Int16 {
       return Convert.int16(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Int16 {
       return Convert.int16(x);
   }
   @:from public static inline function fromInt8(x: Int8): Int16 {
       return Convert.int16(x);
   }
}