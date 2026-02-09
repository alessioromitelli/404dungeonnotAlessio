class Character {
  String? name;
  String? race;
  String? charClass;
  int? classLevel;
  String userId;

  Character({
    this.name,
    this.race,
    this.charClass,
    this.classLevel,
    required this.userId,
  });
}
