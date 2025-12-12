package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract Float32 {
   @:op(A + B) private function add(other: Float32): Float32;
   @:op(A - B) private function sub(other: Float32): Float32;
   @:op(A * B) private function mul(other: Float32): Float32;
   @:op(A / B) private function div(other: Float32): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A % B) private function mod(other: Float32): Float32;
   @:op(-A) private function neg(): Float32;
   @:op(++A) private function preinc(): Float32;
   @:op(A++) private function postinc(): Float32;
   @:op(--A) private function predec(): Float32;
   @:op(A--) private function postdec(): Float32;
   @:op(A == B) private function eq(other: Float32): Bool;
   @:op(A != B) private function neq(other: Float32): Bool;
   @:op(A < B) private function lt(other: Float32): Bool;
   @:op(A <= B) private function lte(other: Float32): Bool;
   @:op(A > B) private function gt(other: Float32): Bool;
   @:op(A >= B) private function gte(other: Float32): Bool;
   @:from public static inline function fromInt(x: Int): Float32 {
       return Convert.float32(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Float32 {
       return Convert.float32(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): Float32 {
       return Convert.float32(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): Float32 {
       return Convert.float32(x);
   }
   @:from public static inline function fromInt8(x: Int8): Float32 {
       return Convert.float32(x);
   }
   @:from public static inline function fromInt16(x: Int16): Float32 {
       return Convert.float32(x);
   }
   @:from public static inline function fromInt32(x: Int32): Float32 {
       return Convert.float32(x);
   }
   @:from public static inline function fromFloat(x: Float): Float32 {
       return Convert.float32(x);
   }
}