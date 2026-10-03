class ContactModel {
  final String id;
  final String name;
  final String phone;

  ContactModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map, String id) {
    return ContactModel(
      id: id,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
    );
  }
}
