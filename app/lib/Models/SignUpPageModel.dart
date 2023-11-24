class SignUpData {
  SignUpData({
    this.full_name = "",
    this.nick_name = "",
    this.phone_number = "",
    this.password = "",
    this.gender = "",
    this.confirmPassword = "",
  });

  String full_name;
  String nick_name;
  String phone_number;
  String password;
  String gender;
  String confirmPassword;

  checkSignUpData() {
    return password.isEmpty ||
        full_name.isEmpty ||
        gender.isEmpty ||
        nick_name.isEmpty ||
        phone_number.isEmpty;
  }

  printAndGetData() {
    print({
      "Full Name": this.full_name,
      "Nick Name": this.nick_name,
      "Phone Number": this.phone_number,
      "Gender": this.gender,
      "password": this.password,
    });

    return {
      "full_name": this.full_name,
      "nick_name": this.nick_name,
      "phone": this.phone_number,
      "gender": this.gender,
      "password": this.password
    };
  }
}
