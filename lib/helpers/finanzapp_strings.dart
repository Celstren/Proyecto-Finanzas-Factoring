import 'package:intl/intl.dart';

class MainViewStrings {
  static const int _stringPrecision = 3;

  static const String MAIN_TITLE = "Finanzapp";

  //Finance Strings
  static const String FINANCE_YEAR = "Año";
  static const String FINANCE_YEARS = "Años";
  static const String SIX_MONTH_PERIOD = "Semestre";
  static const String SIX_MONTH_PERIODS = "Semestres";
  static const String FOUR_MONTH_PERIOD = "Cuatrimestre";
  static const String FOUR_MONTH_PERIODS = "Cuatrimestres";
  static const String THREE_MONTH_PERIOD = "Trimestre";
  static const String THREE_MONTH_PERIODS = "Trimestres";
  static const String TWO_MONTH_PERIOD = "Bimestre";
  static const String TWO_MONTH_PERIODS = "Bimestres";
  static const String FINANCE_MONTH = "Mes";
  static const String FINANCE_MONTHS = "Meses";
  static const String FIFTEEN_DAY_PERIOD = "Quincena";
  static const String FIFTEEN_DAY_PERIODS = "Quincenas";
  static const String FINANCE_DAY = "Día";
  static const String FINANCE_DAYS = "Días";

  static financeYearCount(double howMany) => Intl.plural(
    howMany,
    zero: "0 Años",
    one: "${howMany.toStringAsFixed(_stringPrecision)} Año",
    other: "${howMany.toStringAsFixed(_stringPrecision)} Años",
    name: "Años",
    args: [howMany],
    examples: const {'howMany': 42},
    desc: "${howMany.toStringAsFixed(_stringPrecision)} Años",
  );

  static sixMonthPeriodCount(double howMany) => Intl.plural(
    howMany,
    zero: "0 Semestres",
    one: "${howMany.toStringAsFixed(_stringPrecision)} Semestre",
    other: "${howMany.toStringAsFixed(_stringPrecision)} Semestres",
    name: "Semestres",
    args: [howMany],
    examples: const {'howMany': 42},
    desc: "${howMany.toStringAsFixed(_stringPrecision)} Semestres",
  );

  static fourMonthPeriodCount(double howMany) => Intl.plural(
    howMany,
    zero: "0 Cuatrimestres",
    one: "${howMany.toStringAsFixed(_stringPrecision)} Cuatrimestre",
    other: "${howMany.toStringAsFixed(_stringPrecision)} Cuatrimestres",
    name: "Cuatrimestres",
    args: [howMany],
    examples: const {'howMany': 42},
    desc: "${howMany.toStringAsFixed(_stringPrecision)} Cuatrimestres",
  );

  static threeMonthPeriodCount(double howMany) => Intl.plural(
    howMany,
    zero: "0 Trimestres",
    one: "${howMany.toStringAsFixed(_stringPrecision)} Trimestre",
    other: "${howMany.toStringAsFixed(_stringPrecision)} Trimestres",
    name: "Trimestres",
    args: [howMany],
    examples: const {'howMany': 42},
    desc: "${howMany.toStringAsFixed(_stringPrecision)} Trimestres",
  );

  static twoMonthPeriodCount(double howMany) => Intl.plural(
    howMany,
    zero: "0 Bimestres",
    one: "${howMany.toStringAsFixed(_stringPrecision)} Bimestre",
    other: "${howMany.toStringAsFixed(_stringPrecision)} Bimestres",
    name: "Bimestres",
    args: [howMany],
    examples: const {'howMany': 42},
    desc: "${howMany.toStringAsFixed(_stringPrecision)} Bimestres",
  );

  static financeMonthCount(double howMany) => Intl.plural(
    howMany,
    zero: "0 Meses",
    one: "${howMany.toStringAsFixed(_stringPrecision)} Mes",
    other: "${howMany.toStringAsFixed(_stringPrecision)} Meses",
    name: "Meses",
    args: [howMany],
    examples: const {'howMany': 42},
    desc: "${howMany.toStringAsFixed(_stringPrecision)} Meses",
  );

  static fifteenDayPeriodCount(double howMany) => Intl.plural(
    howMany,
    zero: "0 Quincenas",
    one: "${howMany.toStringAsFixed(_stringPrecision)} Quincena",
    other: "${howMany.toStringAsFixed(_stringPrecision)} Quincenas",
    name: "Quincenas",
    args: [howMany],
    examples: const {'howMany': 42},
    desc: "${howMany.toStringAsFixed(_stringPrecision)} Quincenas",
  );

  static financeDayCount(double howMany) => Intl.plural(
    howMany,
    zero: "0 Días",
    one: "${howMany.toStringAsFixed(_stringPrecision)} Día",
    other: "${howMany.toStringAsFixed(_stringPrecision)} Días",
    name: "Días",
    args: [howMany],
    examples: const {'howMany': 42},
    desc: "${howMany.toStringAsFixed(_stringPrecision)} Días",
  );

}

class FactoringCalculatorStrings {
  static const String TITLE = "Calculadora de Factoring";
  static const String COST = "Importe neto del recibo por honorario";
  static const String MONEY_TYPE = "Tipo de moneda";
  static const String END_DATE = "Plazo de vencimiento";
  static const String RATE_TYPE = "Tipo de Tasa";
  static const String RATE = "Tasa";
}

class SimpleRateStrings {
    static const String TITLE = "Tasa de Interés Simple";
    static const String COST = "Capital";
    static const String RATE = "Interés";
    static const String STOCK = "Monto";
    static const String DEFAULT_VALUE = "0.00";
    static const String CALCULATE_VALUE_OF = "Hallar valor del";
    static const String CALCULATE = "Calcular";
}

class NominalRateStrings {
  static const String TITLE = "Tasa de Interés Nominal";
}

class EffectiveRateStrings {
  static const String TITLE = "Tasa de Interés Efectiva";
}

class SeeEquivalenciesStrings {

  static const String TITLE = "Ver Equivalencias";
  static const String BASED_ON_VALUE_SELECTED = "Equivalencias basadas en el valor seleccionado: ";
  static const String EQUIVALENCE_TO = "equivale a";
  static const String DEFAULT_EQUIVALENCY_QUANTITY = "1";
  static const String NEW_EQUIVALENCY_QUANTITY_HINT = "0";
  static const String CALCULATE_EQUIVALENCY_TO = "calcular su equivalencia a";
  static const String IS_EXACT = "¿Es Exacto?";
}

class TIRCalculatorStrings {

  static const String TITLE = "Calculadora de TIR";
  static const String INITIAL_OUTLAY = "Desembolso Inicial";
  static const String IRR = "TIR";
  static const String INTERNAL_RATE_RETURN = "Tasa Interna de Retorno";
  static const String MONEY_HINT = "\$ 0.00";
  static const String TIME_HINT = "Ingrese Periodo";
  static const String INTERNAL_RATE_RETURN_IRR = "Tasa Interna de Retorno (TIR)";
  static const String CHARGE = "Cobro";
  static const String PAYMENT = "Pago";
  static const String FORM_TITLE = "Relación de Pagos por Honorarios";
  static const String ADD_FEE = "Añadir";
  static const String REMOVE_FEE = "Remover";
  static const String CALCULATE_TIR = "Calcular TIR";

  //Error messages

  static const String INVALID_INITIAL_OUTLAY = "El desembolso inicial es inválido";
  static const String EMPTY_FEES_LIST = "La lista de pagos por honorarios no puede estar vacía";
  static const String NEGATIVE_UTILITY = "La cantidad cobrada no puede ser mayor a la cantidad pagada en el pago #";
  static const String INVALID_TIME = "Tiempo ingresado inválido en el pago #";
}