class User {
  final String userID;
  final String firstName;
  final String lastName;
  final String email;
  final String streetAddress;
  final String city;
  final int zip;
  final String state;

  User(
      {this.userID,
      this.firstName,
      this.email,
      this.lastName,
      this.streetAddress,
      this.city,
      this.zip,
      this.state});

  Map<String, Object> toJson() {
    return {
      'userID': userID,
      'firstName': firstName,
      'email': email == null ? '' : email,
      'lastName': lastName,
      'streetAddress': streetAddress,
      'city': city,
      'zip': zip,
      'state': state,
      'appIdentifier': 'flutter-onboarding'
    };
  }

  factory User.fromJson(Map<String, Object> doc) {
    User user = new User(
        userID: doc['userID'],
        firstName: doc['firstName'],
        email: doc['email'],
        lastName: doc['lastName'],
        streetAddress: doc['streetAddress'],
        city: doc['city'],
        zip: doc['zip'],
        state: doc['state']);
    return user;
  }
}
