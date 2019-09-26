import 'package:flutter/cupertino.dart';

/// Año Financiero
class FinanceYear {

  final double value;

  FinanceYear({@required this.value}) : assert(value != null);

  // Equivalencias de Año

  /// Años Financieros a Años Financieros
  toFinanceYear({bool isExact = false}) {
    assert(isExact != null);
    return FinanceYear(value: value);
  }

  /// Años Financieros a Semestres
  toSixMonthPeriod({bool isExact = false}) {
    assert(isExact != null);
    return SixMonthPeriod(value: value * (isExact? 365 : 360) / 180);
  }

  /// Años Financieros a Cuatrimestres
  toFourMonthPeriod({bool isExact = false}) {
    assert(isExact != null);
    return FourMonthPeriod(value: value * (isExact? 365 : 360) / 120);
  }

  /// Años Financieros a Trimestres
  toThreeMonthPeriod({bool isExact = false}) {
    assert(isExact != null);
    return ThreeMonthPeriod(value: value * (isExact? 365 : 360) / 90);
  }

  /// Años Financieros a Bimestres
  toTwoMonthPeriod({bool isExact = false}) {
    assert(isExact != null);
    return TwoMonthPeriod(value: value * (isExact? 365 : 360) / 60);
  }

  /// Años Financieros a Meses
  toFinanceMonth({bool isExact = false}) {
    assert(isExact != null);
    return FinanceMonth(value: value * (isExact? 365 : 360) / 30);
  }

  /// Años Financieros a Quincenas
  toFifteenDayPeriod({bool isExact = false}) {
    assert(isExact != null);
    return FifteenDayPeriod(value: value * (isExact? 365 : 360) / 15);
  }

  /// Años Financieros a Días
  toFinanceDay({bool isExact = false}) {
    assert(isExact != null);
    return FinanceDay(value: value * (isExact? 365 : 360));
  }
}

/// Semestre Financiero
class SixMonthPeriod {

  final double value;

  SixMonthPeriod({@required this.value}) : assert(value != null);

  // Equivalencias de Semestre
  /// Semestres a Años
  toFinanceYear({bool isExact = false}) {
    assert(isExact != null);
    return FinanceYear(value: value * 180 / (isExact? 365 : 360));
  }

  /// Semestres a Semestres
  toSixMonthPeriod({bool isExact = false}) => SixMonthPeriod(value: value);

  /// Semestres a Cuatrimestres
  toFourMonthPeriod({bool isExact = false}) => FourMonthPeriod(value: value * 3 / 2);

  /// Semestres a Trimestres
  toThreeMonthPeriod({bool isExact = false}) => ThreeMonthPeriod(value: value * 2);

  /// Semestres a Bimestres
  toTwoMonthPeriod({bool isExact = false}) => TwoMonthPeriod(value: value * 3);

  /// Semestres a Meses
  toFinanceMonth({bool isExact = false}) => FinanceMonth(value: value * 6);

  /// Semestres a Quincenas
  toFifteenDayPeriod({bool isExact = false}) => FifteenDayPeriod(value: value * 12);

  /// Semestres a Días
  toFinanceDay({bool isExact = false}) => FinanceDay(value: value * 180);
}

/// Cuatrimestre Financiero
class FourMonthPeriod {

  final double value;

  FourMonthPeriod({@required this.value}) : assert(value != null);

  // Equivalencias de Cuatrimestre
  /// Cuatrimestres a Años
  toFinanceYear({bool isExact = false}) {
    assert(isExact != null);
    return FinanceYear(value: value * 120 / (isExact? 365 : 360));
  }

  /// Cuatrimestres a Semestre
  toSixMonthPeriod({bool isExact = false}) => SixMonthPeriod(value: value * 2 / 3);

  /// Cuatrimestres a Cuatrimestres
  toFourMonthPeriod({bool isExact = false}) => FourMonthPeriod(value: value);

  /// Cuatrimestres a Trimestres
  toThreeMonthPeriod({bool isExact = false}) => ThreeMonthPeriod(value: value * 4 / 3);

  /// Cuatrimestres a Bimestres
  toTwoMonthPeriod({bool isExact = false}) => TwoMonthPeriod(value: value * 2);

  /// Cuatrimestres a Meses
  toFinanceMonth({bool isExact = false}) => FinanceMonth(value: value * 4);

  /// Cuatrimestres a Quincenas
  toFifteenDayPeriod({bool isExact = false}) => FifteenDayPeriod(value: value * 8);

  /// Cuatrimestres a Días
  toFinanceDay({bool isExact = false}) => FinanceDay(value: value * 120);
}

/// Trimestre Financiero
class ThreeMonthPeriod {

  final double value;

  ThreeMonthPeriod({@required this.value}) : assert(value != null);

  // Equivalencias de Trimestre
  /// Trimestres a Años
  toFinanceYear({bool isExact = false}) {
    assert(isExact != null);
    return FinanceYear(value: value * 90 / (isExact? 365 : 360));
  }

  /// Trimestres a Semestre
  toSixMonthPeriod({bool isExact = false}) => SixMonthPeriod(value: value * 1 / 2);

  /// Trimestres a Cuatrimestre
  toFourMonthPeriod({bool isExact = false}) => FourMonthPeriod(value: value * 3 / 4);

  /// Trimestres a Trimestres
  toThreeMonthPeriod({bool isExact = false}) => ThreeMonthPeriod(value: value);

  /// Trimestres a Bimestres
  toTwoMonthPeriod({bool isExact = false}) => TwoMonthPeriod(value: value * 3 / 2);

  /// Trimestres a Meses
  toFinanceMonth({bool isExact = false}) => FinanceMonth(value: value * 3);

  /// Trimestres a Quincenas
  toFifteenDayPeriod({bool isExact = false}) => FifteenDayPeriod(value: value * 6);

  /// Trimestres a Días
  toFinanceDay({bool isExact = false}) => FinanceDay(value: value * 90);
}

/// Bimestre Financiero
class TwoMonthPeriod {

  final double value;

  TwoMonthPeriod({@required this.value}) : assert(value != null);

  // Equivalencias de Bimestre
  /// Bimestres a Años
  toFinanceYear({bool isExact = false}) {
    assert(isExact != null);
    return FinanceYear(value: value * 60 / (isExact? 365 : 360));
  }

  /// Bimestres a Semestre
  toSixMonthPeriod({bool isExact = false}) => SixMonthPeriod(value: value * 1 / 3);

  /// Bimestres a Cuatrimestre
  toFourMonthPeriod({bool isExact = false}) => FourMonthPeriod(value: value * 1 / 2);

  /// Bimestres a Trimestres
  toThreeMonthPeriod({bool isExact = false}) => ThreeMonthPeriod(value: value * 2 / 3);

  /// Bimestres a Bimestres
  toTwoMonthPeriod({bool isExact = false}) => TwoMonthPeriod(value: value);

  /// Bimestres a Meses
  toFinanceMonth({bool isExact = false}) => FinanceMonth(value: value * 2);

  /// Bimestres a Quincenas
  toFifteenDayPeriod({bool isExact = false}) => FifteenDayPeriod(value: value * 4);

  /// Bimestres a Días
  toFinanceDay({bool isExact = false}) => FinanceDay(value: value * 60);
}

/// Mes Financiero
class FinanceMonth {

  final double value;

  FinanceMonth({@required this.value}) : assert(value != null);

  // Equivalencias de Mes
  /// Meses a Años
  toFinanceYear({bool isExact = false}) {
    assert(isExact != null);
    return FinanceYear(value: value * 30 / (isExact? 365 : 360));
  }

  /// Meses a Semestre
  toSixMonthPeriod({bool isExact = false}) => SixMonthPeriod(value: value * 1 / 6);

  /// Meses a Cuatrimestre
  toFourMonthPeriod({bool isExact = false}) => FourMonthPeriod(value: value * 1 / 4);

  /// Meses a Trimestres
  toThreeMonthPeriod({bool isExact = false}) => ThreeMonthPeriod(value: value * 1 / 3);

  /// Meses a Bimestres
  toTwoMonthPeriod({bool isExact = false}) => TwoMonthPeriod(value: value * 1 / 2);

  /// Meses a Meses
  toFinanceMonth({bool isExact = false}) => FinanceMonth(value: value);

  /// Meses a Quincenas
  toFifteenDayPeriod({bool isExact = false}) => FifteenDayPeriod(value: value * 2);

  /// Meses a Días
  toFinanceDay({bool isExact = false}) => FinanceDay(value: value * 30);
}

/// Quincena Financiero
class FifteenDayPeriod {

  final double value;

  FifteenDayPeriod({@required this.value}) : assert(value != null);

  // Equivalencias de Quincena
  /// Quincenas a Años
  toFinanceYear({bool isExact = false}) {
    assert(isExact != null);
    return FinanceYear(value: value * 15 / (isExact? 365 : 360));
  }

  /// Quincenas a Semestre
  toSixMonthPeriod({bool isExact = false}) => SixMonthPeriod(value: value * 1 / 12);

  /// Quincenas a Cuatrimestre
  toFourMonthPeriod({bool isExact = false}) => FourMonthPeriod(value: value * 1 / 8);

  /// Quincenas a Trimestres
  toThreeMonthPeriod({bool isExact = false}) => ThreeMonthPeriod(value: value * 1 / 6);

  /// Quincenas a Bimestres
  toTwoMonthPeriod({bool isExact = false}) => TwoMonthPeriod(value: value * 1 / 4);

  /// Quincenas a Meses
  toFinanceMonth({bool isExact = false}) => FinanceMonth(value: value * 1 / 2);

  /// Quincenas a Quincenas
  toFifteenDayPeriod({bool isExact = false}) => FifteenDayPeriod(value: value);

  /// Quincenas a Días
  toFinanceDay({bool isExact = false}) => FinanceDay(value: value * 15);
}

/// Día Financiero
class FinanceDay {

  final double value;

  FinanceDay({@required this.value}) : assert(value != null);

  // Equivalencias de Día
  /// Días a Años
  toFinanceYear({bool isExact = false}) {
    assert (isExact != null);
    return FinanceYear(value: value * 1 / (isExact? 365 : 360));
  }

  /// Días a Semestre
  toSixMonthPeriod({bool isExact = false}) => SixMonthPeriod(value: value * 1 / 180);

  /// Días a Cuatrimestre
  toFourMonthPeriod({bool isExact = false}) => FourMonthPeriod(value: value * 1 / 120);

  /// Días a Trimestres
  toThreeMonthPeriod({bool isExact = false}) => ThreeMonthPeriod(value: value * 1 / 90);

  /// Días a Bimestres
  toTwoMonthPeriod({bool isExact = false}) => TwoMonthPeriod(value: value * 1 / 60);

  /// Días a Meses
  toFinanceMonth({bool isExact = false}) => FinanceMonth(value: value * 1 / 30);

  /// Días a Quincenas
  toFifteenDayPeriod({bool isExact = false}) => FifteenDayPeriod(value: value * 1 / 15);

  /// Días a Días
  toFinanceDay({bool isExact = false}) => FinanceDay(value: value);
}