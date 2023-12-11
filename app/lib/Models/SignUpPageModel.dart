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

  convertPhone() {
    if (phone_number.startsWith('0')) {
      phone_number = '+251${phone_number.substring(1)}';
      return;
    }
    if (phone_number.startsWith('2')) {
      phone_number = '+$phone_number';
      return;
    }
  }

  printAndGetData() {
    print({
      "Full Name": full_name,
      "Nick Name": nick_name,
      "Phone Number": phone_number,
      "Gender": gender,
      "password": password,
    });

    convertPhone();
    return {
      "full_name": full_name,
      "nick_name": nick_name,
      "phone": phone_number,
      "gender": gender,
      "password": password
    };
  }
}
