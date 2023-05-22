class UserModel{
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender
  });

  toJson(){
    return{
      'First Name' : firstName,
      'Last Name' : lastName,
      'Email': email,
      'Gender': gender 
    };
  }
}