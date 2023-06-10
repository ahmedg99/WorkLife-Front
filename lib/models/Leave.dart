class Leave {
  final String name;
  final int totalDays;
  late int daysLeft;

  Leave(this.name, this.totalDays) {
    daysLeft = totalDays;
  }
}
