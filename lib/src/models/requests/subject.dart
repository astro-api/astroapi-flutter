import 'birth_data.dart';

class Subject {
  final String? name;
  final BirthData birthData;
  final String? email;
  final String? notes;

  const Subject({
    this.name,
    required this.birthData,
    this.email,
    this.notes,
  });

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        'birth_data': birthData.toJson(),
        if (email != null) 'email': email,
        if (notes != null) 'notes': notes,
      };
}
