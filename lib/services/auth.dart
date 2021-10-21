class Auth {
  String token = "";

  get() {
    return token;
  }

  set(input) {
    token = input;
    print(token);
    return token;
  }
}
