class SimpleRateFunctions {
  static validateFields(double cost, double rate, double stock){
    return (cost == null && rate != null && stock != null) || (cost != null && rate == null && stock != null) || (cost != null && rate != null && stock == null) || (cost != null && rate != null && stock != null);
  }
}