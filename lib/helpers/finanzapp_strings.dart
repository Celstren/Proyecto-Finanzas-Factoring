import 'package:intl/intl.dart';

class MainViewStrings {
  static const int _stringPrecision = 3;

  static const String MAIN_TITLE = "Finanzapp";
  static const String HISTORY = "Historial";
  static const String CALCULATOR = "Calculadora";
  static const String SETTINGS = "Configuración";
  static const String MAIN_PAGE = "Página Principal";

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

  static const String PERIOD_YEAR = "Anual";
  static const String PERIOD_MONTH = "Mensual";
  static const String PERIOD_DAY = "Diaria";
  static const String PERIOD_FIFTEEN_DAY = "Quincenal";
  static const String PERIOD_SIX_MONTH = "Semestral";
  static const String PERIOD_FOUR_MONTH = "Cuatrimestral";
  static const String PERIOD_THREE_MONTH = "Trimestral";
  static const String PERIOD_TWO_MONTH = "Bimestral";

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

  static financeDayIntCount(int howMany) => Intl.plural(
    howMany,
    zero: "0 Días",
    one: "$howMany Día",
    other: "$howMany Días",
    name: "Días",
    args: [howMany],
    examples: const {'howMany': 42},
    desc: "$howMany Días",
  );

}

class FactoringCalculatorStrings {
  static const String TITLE = "Calculadora";
  static const String FEE_RECEIPT_AMOUNT = "Importe del recibo por honorario";
  static const String START_DATE = "Fecha de Inicio";
  static const String END_DATE = "Fecha de Vencimiento";
  static const String MONEY_TYPE = "Tipo de moneda";
  static const String RATE_TYPE = "Tipo de Tasa";
  static const String RATE_AMOUNT = "Porcentaje de la Tasa";
  static const String DAYS_AMOUNT = "Cantidad de días de diferencia: ";
  static const String NOMINAL_RATE = "Tasa Nominal";
  static const String EFFECTIVE_RATE = "Tasa Efectiva";
  static const String CAPITALIZATION = "Capitalización por";
  static const String PERIODS = "La tasa se aplica cada";
  static const String AMOUNT = "Importe Neto";
  static const String TIME = "Tiempo";
  static const String RATE = "Tasa";
  static const String COSTS = "Costos";
  static const String PAYMENTS = "Gastos";
  static const String ADD_MORE = "Añadir +";
  static const String COST_HINT = "Ingrese nombre del costo";
  static const String PAYMENT_HINT = "Ingrese nombre del gasto";
  static const String CALCULATE = "Calcular";
  static const String CLEAR = "Limpiar";
  static const String ERROR_MESSAGE1 = "Las fechas ingresadas son inválidas";
  static const String ERROR_MESSAGE2 = "El valor de la tasa debe ser mayor a cero";
  static const String DISCOUNT_RESULT = "Descuento:";
  static const String NET_VALUE_RESULT = "Valor Neto:";
  static const String RECEIVED_VALUE_RESULT = "Valor Recibido:";
  static const String GIVEN_VALUE_RESULT = "Valor Entregado:";
  static const String EFFECTIVE_ANNUAL_COST_RATE_RESULT = "Tasa de Costes Efectivos Anuales(TCEA):";
  static const String GO_BACK = "Volver";
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

class HistoryStrings {
  static const String NUMBER_OF_FACTORING_CALCULATIONS = "Número de recibos por honorarios: ";
  static const String DATE = "Fecha: ";
  static const String NAME_OF_CONSULTATION = "Consulta N°";

  static const String HISTORY_DIALOG_DESCRIPTION = "Descripción:";
  static const String HISTORY_DIALOG_DESCRIPTION_HINT = "Añada una descripción";
  static const String HISTORY_DIALOG_SAVE = "Guardar";
  static const String HISTORY_DIALOG_ADD = "Añadir";
  static const String HISTORY_DIALOG_DELETE = "Eliminar";

  static const String GET_ALL_CARTERAS_FAILED_ERROR_MESSAGE = "Hubo un error al obtener el registro de carteras";
  static const String SAVE_CARTERA_FAILED_ERROR_MESSAGE = "Hubo un error al añadir cartera";
  static const String SAVE_CARTERA_SUCCESS_MESSAGE = "La cartera se añadió con éxito";
  static const String UPDATE_CARTERA_SUCCESS_MESSAGE = "La cartera se actualizó con éxito";
  static const String UPDATE_CARTERA_FAILED_ERROR_MESSAGE = "Hubo un error al actualizar la cartera";
  static const String DELETE_CARTERA_SUCCESS_MESSAGE = "Cartera eliminada correctamente";
  static const String DELETE_CARTERA_FAILED_ERROR_MESSAGE = "Hubo un error al eliminar la cartera";

  static const String HELP_DIALOG_TITLE = "Cartera";
  static const String HELP_DIALOG_CONTENT = "Las carteras son un grupo de recibos a partir de los cuales se puede calcular el valor de la Tasa Interna de Retorno(TIR).";
}

class CalculationDetailsString {
  static const String TITLE = "Detalles de Cartera";
  static const String NET_AMOUNT = "Importe Neto: ";
  static const String EXPIRATION_DATE = "Fecha de Vencimiento: ";
  static const String DISCOUNT_DATE = "Fecha de Descuento: ";
  static const String RATE = "Tasa: ";
  static const String INTERNAL_RATE_RETURN = "Tasa Interna de Retorno(TIR): ";
  static const String NAME_OF_RECEIPT = "Recibo N°";
  static const String RECIBO_DIALOG_DESCRIPTION = "Descripción:";
  static const String RECIBO_DIALOG_DESCRIPTION_HINT = "Añada descripción";

  static const String TIR_HELP_DIALOG_TITLE = "Tasa Interna de Retorno (TIR)";
  static const String TIR_HELP_DIALOG_CONTENT = "La Tasa interna de retorno es la tasa de interés o rentabilidad que ofrece la inversión de los recibos ingresados.";
  static const String RECEIPT_HELP_DIALOG_TITLE = "Recibo";
  static const String RECEIPT_HELP_DIALOG_CONTENT = "Definición: El Recibo por Honorarios es un tipo comprobante de pago que se emite por los servicios otorgados de algún empleado";
  static const String RECEIPT_HELP_DIALOG_RATE = "Tasa: Una tasa es un coeficiente que refleja la relación entre dos magnitudes y permite expresar el interés (la utilidad, el valor o la ganancia de los recibos). Este puede ser Efectiva o Nominal";
  static const String RECEIPT_HELP_DIALOG_RATE_NOMINAL = "Tasa Nominal: Se denomina interés compuesto en activos monetarios a aquel que se va sumando al capital inicial y sobre el que se van generando nuevos intereses";
  static const String RECEIPT_HELP_DIALOG_RATE_EFFECTIVE = "Tasa Efectiva: La tasa efectiva nos da el porcentaje de interés total que se genera o que se aplica sobre una cantidad de dinero durante un periodo de tiempo determinado";
  static const String RESULT_HELP_DIALOG_TITLE = "Resultados del Cálculo";
  static const String RESULT_HELP_DIALOG_DISCOUNT = "Descuento: Cantidad restada del recibo por honorario entregado";
  static const String RESULT_HELP_DIALOG_NET_VALUE = "Valor Neto: Valor actual del recibo por honorario entregado";
  static const String RESULT_HELP_DIALOG_RECEIVED_VALUE = "Valor Recibido: Valor que el usuario recibe por el recibo por honorario entregado";
  static const String RESULT_HELP_DIALOG_GIVEN_VALUE = "Valor Recibido: Valor que el usuario entrega por la transacción del recibo por honorario";
  static const String RESULT_HELP_DIALOG_TCEA = "Tasa de Costo Efectivo Anual:  Es aquella que engloba todo lo que le cuesta al usuario el crédito que realiza con el recibo";
}

class SignInStrings {
  static const String TITLE = "Recibos por Honorarios Factoring";
  static const String EMAIL_HINT = "Correo";
  static const String PASSWORD_HINT = "Contraseña";
  static const String FORGET_PASSWORD = "¿Olvidaste tu contraseña?";
  static const String SIGN_IN = "Ingresar";
  static const String NO_MEMBER = "¿No tienes una cuenta?";
  static const String REGISTER = "Regístrate";

  static const String MAIL_EMPTY_ERROR_MESSAGE = "Debe completar el campo correo";
  static const String PASSWORD_EMPTY_ERROR_MESSAGE = "Debe completar el campo contraseña";
  static const String WRONG_CREDENTIALS_ERROR_MESSAGE = "Las credenciales ingresadas son incorrectas";
  static const String NO_USER_FOUND_ERROR_MESSAGE = "No se pudo encontrar un usuario registrado";
  static const String LOGIN_SUCCESS_MESSAGE = "Credenciales verficadas con éxito";
}

class RegisterStrings {
  static const NEW_ACCOUNT = "Nueva Cuenta";
  static const FIRST_NAME_HINT = "Nombres";
  static const LAST_NAME_HINT = "Apellidos";
  static const IDENTIFICATION_HINT = "D.N.I.";
  static const MAIL_HINT = "Correo";
  static const PASSWORD_HINT = "Contraseña";
  static const COMPANY_NAME_HINT = "Nombre de Empresa";
  static const REGISTER = "Registrar";
}

class DrawerStrings {
  static const HISTORY = "Historial";
  static const CALCULATOR = "Calculadora";
  static const SETTINGS = "Configuración";
  static const LOGOUT = "Cerrar Sesión";

  //temporal data
  static const TEMP_NAME = "Luiggi Minaya Salcedo";
  static const TEMP_MAIL = "luiggi.minaya@gmail.com";
}

class SettingsStrings {
  static const TEMP_FIRST_NAME = "Luiggi Daniel";
  static const TEMP_LAST_NAME = "Minaya Salcedo";
  static const TEMP_MAIL = "luiggi.minaya@gmail.com";

  static const TEMP_FIRST_NAME_HINT = "Nombres";
  static const TEMP_LAST_NAME_HINT = "Apellidos";
  static const TEMP_MAIL_HINT = "usuario@mail.com";

  static const DOLLAR_CURRENCIES = "Dólares";
  static const PEN_CURRENCIES = "Soles";

  static const SAVE = "Guardar";

  static const LAST_UPDATE = "Última actualización: ";

  static const DISABLE_PERU_STANDARD = "Deshabilitar calendario del Perú: ";
}