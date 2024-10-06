class User {
  String name;
  int age;
  DateTime birthday;
  String gender;
  List<String> professions;

  User({
    required this.name,
    required this.age,
    required this.birthday,
    required this.gender,
    required this.professions,
  });

  User copyWith({
    String? name,
    int? age,
    DateTime? birthday,
    String? gender,
    List<String>? professions,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      professions: professions ?? this.professions,
    );
  }

  List<Object> get props => [name, age, birthday, gender, professions];

  @override
  String toString() =>
      'User { name: $name, age: $age, birthday: $birthday, gender: $gender, professions: $professions }';
}
