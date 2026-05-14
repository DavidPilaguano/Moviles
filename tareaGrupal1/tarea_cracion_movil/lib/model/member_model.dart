class Member {
  final String name;
  final double lastWeight;
  final List<double> currentWeights;

  Member({
    required this.name,
    required this.lastWeight,
    required this.currentWeights,
  });

  // Lógica de cálculo dentro del modelo
  double get averageWeight =>
      currentWeights.reduce((a, b) => a + b) / currentWeights.length;

  double get weightDifference => averageWeight - lastWeight;

  String get status => weightDifference > 0 ? "SUBIÓ" : "BAJÓ";
}
