package exprparser;

import parser.dump.ExprParser;
import sys.io.File;

function run() {
    final parser = new ExprParser("DEBUG");
    final lines = File.getContent("tests/exprparser/slice.txt").split("\n");
    final object = parser.parseObject(lines);
    parser.printObject(object);
}