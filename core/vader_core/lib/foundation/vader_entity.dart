abstract class VaderEntity {
  const VaderEntity();

  static fromJson(Map<String, Object?> json) {}

  toJson();

  @override
  String toString() {
    return toJson().toString();
  }
}
