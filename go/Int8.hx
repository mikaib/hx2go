package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract Int8 {
   @:op(A + B) private function add(other: Int8): Int8;
   @:op(A - B) private function sub(other: Int8): Int8;
   @:op(A * B) private function mul(other: Int8): Int8;
   @:op(A / B) private function div(other: Int8): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A % B) private function mod(other: Int8): Int8;
   @:op(-A) private function neg(): Int8;
   @:op(++A) private function preinc(): Int8;
   @:op(A++) private function postinc(): Int8;
   @:op(--A) private function predec(): Int8;
   @:op(A--) private function postdec(): Int8;
   @:op(A == B) private function eq(other: Int8): Bool;
   @:op(A != B) private function neq(other: Int8): Bool;
   @:op(A < B) private function lt(other: Int8): Bool;
   @:op(A <= B) private function lte(other: Int8): Bool;
   @:op(A > B) private function gt(other: Int8): Bool;
   @:op(A >= B) private function gte(other: Int8): Bool;
   @:op(A & B) private function and(other: Int8): Int8;
   @:op(A | B) private function or(other: Int8): Int8;
   @:op(A ^ B) private function xor(other: Int8): Int8;
   @:op(~A) private function not(): Int8;
   @:op(A << B) private function lshift(other: Int8): Int8;
   @:op(A >> B) private function rshift(other: Int8): Int8;
   @:op(A >>> B) private function urshift(other: Int8): Int8;
   @:from public static inline function fromInt(x: Int): Int8 {
       return Convert.int8(x);
   }
}