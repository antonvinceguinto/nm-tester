class AcceptanceStatusModel {
  const AcceptanceStatusModel({
    this.id,
    this.name,
    this.color,
  });

  final int? id;
  final String? name;
  final String? color;

  String getInitials() {
    final initials = name?.split(' ').map((e) => e[0]).join() ?? '';
    return initials;
  }
}
