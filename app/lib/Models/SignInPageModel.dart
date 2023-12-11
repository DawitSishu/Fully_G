class SignInData {
  SignInData({this.phone = '', this.password = ''});
  String phone;
  String password;

  checkSignInData() => phone.isEmpty || password.isEmpty;

  convertPhone() {
    if (phone.startsWith('0')) {
      phone = '+251${phone.substring(1)}';
      return;
    }
    if (phone.startsWith('2')) {
      phone = '+$phone';
      return;
    }
  }

  printAndGetData() {
    convertPhone();
    print({"phone": phone, "password": password});
    return {"phone": phone, "password": password};
  }
}
