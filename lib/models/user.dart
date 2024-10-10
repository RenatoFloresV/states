class User {
  String name;
  int age;
  DateTime? birthday;
  String gender;
  List<String> professions;

  User({
    required this.name,
    required this.age,
    this.birthday,
    required this.gender,
    required this.professions,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? '',
        age = json['age'] ?? 0,
        birthday = json['birthday'],
        gender = json['gender'] ?? '',
        professions = json['professions'] ?? [];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'birthday': birthday,
        'gender': gender,
        'professions': professions,
      };

  // User copyWith({
  //   String? name,
  //   int? age,
  //   DateTime? birthday,
  //   String? gender,
  //   List<String>? professions,
  // }) {
  //   return User(
  //     name: name ?? this.name,
  //     age: age ?? this.age,
  //     birthday: birthday ?? this.birthday,
  //     gender: gender ?? this.gender,
  //     professions: professions ?? this.professions,
  //   );
  // }
}
