import go.Go;
import go.math.Rand;

@:pure
extern class Math {

    static var PI(get, null):Float;
    static var NEGATIVE_INFINITY(get, null):Float;
    static var POSITIVE_INFINITY(get, null):Float;
    static var NaN(get, null):Float;

    inline static function abs(v:Float):Float
        return go.math.Math.abs(v);

    inline static function min(a:Float, b:Float):Float
        return go.math.Math.min(a, b);

    inline static function max(a:Float, b:Float):Float
        return go.math.Math.max(a, b);

    inline static function sin(v:Float):Float
        return go.math.Math.sin(v);

    inline static function cos(v:Float):Float
        return go.math.Math.cos(v);

    inline static function tan(v:Float):Float
        return go.math.Math.tan(v);

    inline static function asin(v:Float):Float
        return go.math.Math.asin(v);

    inline static function acos(v:Float):Float
        return go.math.Math.acos(v);

    inline static function atan(v:Float):Float
        return go.math.Math.atan(v);

    inline static function atan2(y:Float, x:Float):Float
        return go.math.Math.atan2(y, x);

    inline static function exp(v:Float):Float
        return go.math.Math.exp(v);

    inline static function log(v:Float):Float
        return go.math.Math.log(v);

    inline static function pow(v:Float, exp:Float):Float
        return go.math.Math.pow(v, exp);

    inline static function sqrt(v:Float):Float
        return go.math.Math.sqrt(v);

    inline static function isNaN(f:Float):Bool
        return go.math.Math.isNaN(f);

    inline static function ffloor(v:Float):Float
        return go.math.Math.floor(v);

    inline static function fceil(v:Float):Float
        return go.math.Math.ceil(v);

    inline static function fround(v:Float):Float
        return go.math.Math.round(v);

    inline static function round(v:Float):Int
        return Go.int(fround(v));

    inline static function floor(v:Float):Int
        return Go.int(ffloor(v));

    inline static function ceil(v:Float):Int
        return Go.int(fceil(v));

    inline static function random():Float
        return Rand.float64();

    inline static function isFinite(f:Float):Bool
        return !go.math.Math.isNaN(f) && !go.math.Math.isInf(f, 0);

    inline static function get_PI():Float
        return go.math.Math.Pi;

    inline static function get_NEGATIVE_INFINITY():Float
        return go.math.Math.inf(-1);

    inline static function get_POSITIVE_INFINITY():Float
        return go.math.Math.inf(1);

    inline static function get_NaN():Float
        return go.math.Math.NaN();

}
