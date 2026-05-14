class PaymentModel {
  String clientName;
  String serviceType;
  double consumption;
  bool hasLateFee;
  bool isSeniorDiscount;
  int age;

  PaymentModel({
    this.clientName = '',
    this.serviceType = 'Agua',
    this.consumption = 0.0,
    this.hasLateFee = false,
    this.isSeniorDiscount = false,
    this.age = 0,
  });
}
