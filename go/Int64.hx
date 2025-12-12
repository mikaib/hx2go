package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract Int64 {
   @:op(A + B) private function add(other: Int64): Int64;
   @:op(A - B) private function sub(other: Int64): Int64;
   @:op(A * B) private function mul(other: Int64): Int64;
   @:op(A / B) private function div(other: Int64): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A % B) private function mod(other: Int64): Int64;
   @:op(-A) private function neg(): Int64;
   @:op(++A) private function preinc(): Int64;
   @:op(A++) private function postinc(): Int64;
   @:op(--A) private function predec(): Int64;
   @:op(A--) private function postdec(): Int64;
   @:op(A == B) private function eq(other: Int64): Bool;
   @:op(A != B) private function neq(other: Int64): Bool;
   @:op(A < B) private function lt(other: Int64): Bool;
   @:op(A <= B) private function lte(other: Int64): Bool;
   @:op(A > B) private function gt(other: Int64): Bool;
   @:op(A >= B) private function gte(other: Int64): Bool;
   @:op(A & B) private function and(other: Int64): Int64;
   @:op(A | B) private function or(other: Int64): Int64;
   @:op(A ^ B) private function xor(other: Int64): Int64;
   @:op(~A) private function not(): Int64;
   @:op(A << B) private function lshift(other: Int64): Int64;
   @:op(A >> B) private function rshift(other: Int64): Int64;
   @:op(A >>> B) private function urshift(other: Int64): Int64;
   @:from public static inline function fromInt(x: Int): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromInt8(x: Int8): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromInt16(x: Int16): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromInt32(x: Int32): Int64 {
       return Convert.int64(x);
   }
}