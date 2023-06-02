class UserModel {
  // unique ID that is generated for each user when he/she registers
  String? uid;
  String? email;
  String? firstName;
  String? lastName;

  UserModel({this.uid, this.email, this.firstName, this.lastName});

  // take data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['secondName'],
    );
  }

  // send some data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': lastName,
    };
  }
}
