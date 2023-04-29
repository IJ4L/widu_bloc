class Validator {
  static String? rule(
    String? value, {
    bool required = false,
  }) {
    if (required && value!.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static String? required(
    dynamic value, {
    String? fieldName,
  }) {
    if (value is String || value == null) {
      if (value.toString() == "null") return "This field is required";
      if (value.isEmpty) return "This field is required";
    }
    return null;
  }

  static String? email(String? value) {
    if (value!.isEmpty) return "This field is required";

    final bool isValidEmail = RegExp(
            "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(value);

    if (!isValidEmail) {
      return "This field is not in a valid email format";
    }
    return null;
  }
}
