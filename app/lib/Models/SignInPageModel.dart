class SignInData {
  SignInData({this.phone = '', this.password = ''});
  String phone;
  String password;

  checkSignInData() => phone.isEmpty || password.isEmpty;

  printAndGetData() {
    print({"phone": phone, "password": password});
    return {"phone": phone, "password": password};
  }
}
