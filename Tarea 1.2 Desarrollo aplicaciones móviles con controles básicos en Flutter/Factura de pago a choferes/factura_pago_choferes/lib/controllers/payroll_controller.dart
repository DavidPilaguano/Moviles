import '../models/driver_model.dart';

class PayrollController {
  List<DriverModel> drivers = [];

  void addDriver(DriverModel driver) {
    if (drivers.length < 5) {
      drivers.add(driver);
    }
  }

  double calculateCompanyTotal() {
    return drivers.fold(0, (sum, item) => sum + item.weeklySalary);
  }

  String getTopMondayDriver() {
    if (drivers.isEmpty) return "N/A";
    var topDriver = drivers.reduce(
      (a, b) => a.dailyHours[0] > b.dailyHours[0] ? a : b,
    );
    return topDriver.name;
  }
}
