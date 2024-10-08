class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatar
      
      });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['email'],
      email: json['email'],
      avatar: json['avatar']
      );
}



// "id": 7,
//             "email": "michael.lawson@reqres.in",
//             "first_name": "Michael",
//             "last_name": "Lawson",
//             "avatar": "https://reqres.in/img/faces/7-image.jpg"
//         }