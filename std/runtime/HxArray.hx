package runtime;

import haxe.Rest;
import go.Syntax;
import go.Slice;
import go.GoInt;
import go.Go;

// TODO: remove extern from class and functions when module resolution works correctly.
extern class HxArray {

    @:pure public inline extern static function getData<T>(arr: Array<T>): Slice<T>
        return Syntax.code('{0}.data', arr);

    public inline extern static function setData<T>(arr: Array<T>, data: Slice<T>): Void
        Syntax.code('{0}.data = {1}', arr, data);

    public inline extern static function push<T>(arr: Array<T>, value: T): GoInt {
        var data = getData(arr);
        setData(arr, Go.append(data, value));

        return Go.len(data);
    }

    public inline extern static function concat<T>(on: Array<T>, arr: Array<T>): Array<T> {
        var newArr: Array<T> = on.copy();
        setData(newArr, Syntax.code('append({0}.data, {1}.data...)', newArr, arr));

        return newArr;
    }

    public inline extern static function copy<T>(arr: Array<T>): Array<T> {
        var newArr: Array<T> = [];
        setData(newArr, Syntax.code('append({0}.data, {1}.data...)', newArr, arr));

        return newArr;
    }

    public inline extern static function pop<T>(arr: Array<T>): Null<T> {
        var data = getData(arr);
        var lastIdx = data.length - 1;

        var last = data[lastIdx];
        setData(arr, Syntax.code('{0}.data[:{1}]', arr, lastIdx));

        return last;
    }

    public inline extern static function reverse<T>(arr: Array<T>): Void {
        var data = getData(arr);
        var x = 0;
        var y = Go.len(data) - 1;

        while (x < y) {
            var dx = data[x];
            var dy = data[y];
            data[x] = dy;
            data[y] = dx;

            x++;
            y--;
        }
    }

    public inline extern static function getLength<T>(arr: Array<T>): GoInt {
        return Go.len(getData(arr));
    }

}
