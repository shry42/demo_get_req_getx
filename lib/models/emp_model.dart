class EmployeeModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;

  EmployeeModel(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
  );

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
  }
}
