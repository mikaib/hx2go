package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract UInt64 {
   @:op(A + B) private function add(other: UInt64): UInt64;
   @:op(A - B) private function sub(other: UInt64): UInt64;
   @:op(A * B) private function mul(other: UInt64): UInt64;
   @:op(A / B) private function div(other: UInt64): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A % B) private function mod(other: UInt64): UInt64;
   @:op(-A) private function neg(): UInt64;
   @:op(++A) private function preinc(): UInt64;
   @:op(A++) private function postinc(): UInt64;
   @:op(--A) private function predec(): UInt64;
   @:op(A--) private function postdec(): UInt64;
   @:op(A == B) private function eq(other: UInt64): Bool;
   @:op(A != B) private function neq(other: UInt64): Bool;
   @:op(A < B) private function lt(other: UInt64): Bool;
   @:op(A <= B) private function lte(other: UInt64): Bool;
   @:op(A > B) private function gt(other: UInt64): Bool;
   @:op(A >= B) private function gte(other: UInt64): Bool;
   @:op(A & B) private function and(other: UInt64): UInt64;
   @:op(A | B) private function or(other: UInt64): UInt64;
   @:op(A ^ B) private function xor(other: UInt64): UInt64;
   @:op(~A) private function not(): UInt64;
   @:op(A << B) private function lshift(other: UInt64): UInt64;
   @:op(A >> B) private function rshift(other: UInt64): UInt64;
   @:op(A >>> B) private function urshift(other: UInt64): UInt64;
   @:from public static inline function fromInt(x: Int): UInt64 {
       return Convert.uint64(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): UInt64 {
       return Convert.uint64(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): UInt64 {
       return Convert.uint64(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): UInt64 {
       return Convert.uint64(x);
   }
}