import 'package:logger/logger.dart';

final logger = Logger(
    printer: PrettyPrinter(methodCount: 0),
    filter: ProductionFilter(),
);

var loggerWithStack = Logger(
    printer:  PrefixPrinter(
        PrettyPrinter(
            methodCount: 2,
            colors: false,
            printTime: true
        )
    ),
  filter: ProductionFilter()
);
