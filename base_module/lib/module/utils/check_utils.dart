
class CheckUtils{
  bool isPhone(String value) {
    RegExp mobile = RegExp(r"(0|86|17951)?(1[0-9][0-9])[0-9]{8}");
    return mobile.hasMatch(value);
  }

}
