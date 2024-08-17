import 'package:benchmark_harness/benchmark_harness.dart';

int calculate() {
  return 6 * 7;
}

class LoopsPerformance {
  final iterations = 2000000;

  void getReport() {
    print("\n");
    final forLoopWithoutLengthCached =
        ForLoopWithoutLengthCached(iterations: iterations);
    final forLoopWithLengthCached =
        ForLoopWithLengthCached(iterations: iterations);
    final whileLoopWithLengthCached =
        WhileLoopWithLengthCached(iterations: iterations);
    final whileLoopWithoutLengthCached =
        WhileLoopWithoutLengthCached(iterations: iterations);
    final forIn = ForIn(iterations: iterations);
    final forEach = ForEach(iterations: iterations);
    final mapFunction = MapLoop(iterations: iterations);

    forLoopWithoutLengthCached.report();
    forLoopWithLengthCached.report();
    whileLoopWithoutLengthCached.report();
    whileLoopWithLengthCached.report();
    forIn.report();
    forEach.report();
    mapFunction.report();

    print("\n");

    final forLoopMapConversionWithLengthCached =
        ForLoopMapConversionWithLengthCached(iterations: iterations);
    final whileLoopMapConversionWithoutCachedLength =
        WhileLoopMapConversionWithoutCachedLength(iterations: iterations);
    final whileLoopMapConversionWithCachedLength =
        WhileLoopMapConversionWithCachedLength(iterations: iterations);
    final forInLoopMapConversion =
        ForInLoopMapConversion(iterations: iterations);
    final mapFunctionConversion = MapFunctionConversion(iterations: iterations);
    final forLoopMapConversionWithoutLengthCached =
        ForLoopMapConversionWithoutLengthCached(iterations: iterations);
    final forEachLoopMapConversion =
        ForEachLoopMapConversion(iterations: iterations);

    forLoopMapConversionWithoutLengthCached.report();
    forLoopMapConversionWithLengthCached.report();
    whileLoopMapConversionWithoutCachedLength.report();
    whileLoopMapConversionWithCachedLength.report();
    forInLoopMapConversion.report();
    forEachLoopMapConversion.report();
    mapFunctionConversion.report();

    print("\n");
  }
}

class ForLoopWithoutLengthCached extends BenchmarkBase {
  ForLoopWithoutLengthCached({
    required this.iterations,
  }) : super('For Loop without Length Cached');

  final int iterations;

  late final List<int> list;

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    forLoop();
  }

  void forLoop() {
    for (int i = 0; i < list.length; i++) {
      calculate();
    }
  }
}

class ForLoopWithLengthCached extends BenchmarkBase {
  ForLoopWithLengthCached({
    required this.iterations,
  }) : super('For Loop with Length Cached');

  final int iterations;

  late final List<int> list;

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    forLoop();
  }

  void forLoop() {
    final length = list.length;
    for (int i = 0; i < length; i++) {
      calculate();
    }
  }
}

class WhileLoopWithoutLengthCached extends BenchmarkBase {
  WhileLoopWithoutLengthCached({
    required this.iterations,
  }) : super('While Loop without Length Cached');

  final int iterations;

  late final List<int> list;

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    whileLoop();
  }

  void whileLoop() {
    int i = 0;
    while (i < list.length) {
      calculate();
      i++;
    }
  }
}

class WhileLoopWithLengthCached extends BenchmarkBase {
  WhileLoopWithLengthCached({
    required this.iterations,
  }) : super('While Loop with Length Cached');

  final int iterations;

  late final List<int> list;

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    whileLoop();
  }

  void whileLoop() {
    int i = 0;
    final length = list.length;
    while (i < length) {
      calculate();
      i++;
    }
  }
}

class ForIn extends BenchmarkBase {
  ForIn({
    required this.iterations,
  }) : super('For In Loop');

  final int iterations;

  late final List<int> list;

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    forInLoop();
  }

  void forInLoop() {
    for (final element in list) {
      calculate();
    }
  }
}

class ForEach extends BenchmarkBase {
  ForEach({
    required this.iterations,
  }) : super('For Each Loop');

  final int iterations;

  late final List<int> list;

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    forEachLoop();
  }

  void forEachLoop() {
    list.forEach((element) {
      calculate();
    });
  }
}

class MapLoop extends BenchmarkBase {
  MapLoop({
    required this.iterations,
  }) : super('.Map Function');

  final int iterations;

  late final List<int> list;

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    loopMap();
  }

  void loopMap() {
    list.map((element) {
      return calculate();
    }).toList();
  }
}

class ForLoopMapConversionWithoutLengthCached extends BenchmarkBase {
  ForLoopMapConversionWithoutLengthCached({
    required this.iterations,
  }) : super('For Loop Map Conversion Without Length Cached');

  final int iterations;

  late final List<int> list;

  final List<String> result = [];

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    loopMapConversion();
  }

  void loopMapConversion() {
    for (int i = 0; i < list.length; i++) {
      result.add(list[i].toString());
    }
  }
}

class ForLoopMapConversionWithLengthCached extends BenchmarkBase {
  ForLoopMapConversionWithLengthCached({
    required this.iterations,
  }) : super('For Loop Map Conversion With Length Cached');

  final int iterations;

  late final List<int> list;

  final List<String> result = [];

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    loopMapConversion();
  }

  void loopMapConversion() {
    final length = list.length;
    for (int i = 0; i < length; i++) {
      result.add(list[i].toString());
    }
  }
}

class ForInLoopMapConversion extends BenchmarkBase {
  ForInLoopMapConversion({
    required this.iterations,
  }) : super('For In Loop Map Conversion');

  final int iterations;

  late final List<int> list;

  final List<String> result = [];

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    loopMapConversion();
  }

  void loopMapConversion() {
    for (final element in list) {
      result.add(element.toString());
    }
  }
}

class WhileLoopMapConversionWithoutCachedLength extends BenchmarkBase {
  WhileLoopMapConversionWithoutCachedLength({
    required this.iterations,
  }) : super('While Loop Map Conversion Without Cached Length');

  final int iterations;

  late final List<int> list;

  final List<String> result = [];

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    loopMapConversion();
  }

  void loopMapConversion() {
    int i = 0;
    while (i < list.length) {
      result.add(list[i].toString());
      i++;
    }
  }
}

class WhileLoopMapConversionWithCachedLength extends BenchmarkBase {
  WhileLoopMapConversionWithCachedLength({
    required this.iterations,
  }) : super('While Loop Map Conversion With Cached Length');

  final int iterations;

  late final List<int> list;

  final List<String> result = [];

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    loopMapConversion();
  }

  void loopMapConversion() {
    int i = 0;
    final length = list.length;
    while (i < length) {
      result.add(list[i].toString());
      i++;
    }
  }
}

class ForEachLoopMapConversion extends BenchmarkBase {
  ForEachLoopMapConversion({
    required this.iterations,
  }) : super('For Each Loop Map Conversion');

  final int iterations;

  late final List<int> list;

  final List<String> result = [];

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    loopMapConversion();
  }

  void loopMapConversion() {
    list.forEach((element) {
      result.add(element.toString());
    });
  }
}

class MapFunctionConversion extends BenchmarkBase {
  MapFunctionConversion({
    required this.iterations,
  }) : super('.Map Function Conversion');

  final int iterations;

  late final List<int> list;

  @override
  void setup() {
    list = List.generate(iterations, (index) => index);
  }

  @override
  void run() {
    loopMap();
  }

  void loopMap() {
    list.map((element) {
      return element.toString();
    }).toList();
  }
}
