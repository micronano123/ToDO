class UserModel {
  String name;
  String email;
  String hollandCode;
  List<String> savedCareers;

  UserModel({
    required this.name,
    required this.email,
    this.hollandCode = "",
    this.savedCareers = const [],
  });

  // Method to update profile
  void updateProfile(String name, String email) {
    this.name = name;
    this.email = email;
  }

  // Method to set Holland Code
  void setHollandCode(String code) {
    hollandCode = code;
  }

  // Method to add a saved career
  void addSavedCareer(String career) {
    savedCareers.add(career);
  }
}