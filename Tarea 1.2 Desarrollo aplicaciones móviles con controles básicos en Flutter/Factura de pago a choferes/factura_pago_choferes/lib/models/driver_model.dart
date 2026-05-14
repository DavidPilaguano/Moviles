class DriverModel {
  String name;
  List<double> dailyHours; // 6 días
  double hourlyRate;
  bool isActive;
  String shift; // RadioButton: Diurna/Nocturna

  DriverModel({
    this.name = '',
    List<double>? dailyHours,
    this.hourlyRate = 0.0,
    this.isActive = true,
    this.shift = 'Diurna',
  }) : dailyHours = dailyHours ?? List.filled(6, 0.0);

  double get totalHours => dailyHours.reduce((a, b) => a + b);
  double get weeklySalary => totalHours * hourlyRate;
}
