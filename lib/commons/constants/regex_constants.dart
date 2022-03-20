class RegexConstants {
  static final RegExp regVietnamLowerCaseChar = RegExp(
    r'[^a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s]',
  );
  static final RegExp allDigitRegex = RegExp(r'[^0-9]');
  static const String newVietnamPhoneNumber = r'(0[3|5|7|8|9])+([0-9]{8})\b';
  static const String oldVietnamPhoneNumber = r'(09|01[2|6|8|9])+([0-9]{8})\b';
  static const String validEmailRegex =
      r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'; // I got Regex pattern from this https://stackoverflow.com/a/50663835
  static const String hasLowerCaseRegex = r'[a-z]';
  static const String hasUpperCaseRegex = r'[A-Z]';
  static const String notHasDigitRegex = r'[^0-9]';
  static const String hasOnlyDigitRegex = r'^[0-9]*$';
  static const String hasOnlyAlphabetsRegex = r'^[a-zA-Z]*$';
  static const String hasOnlyAlphabetsAndNumbersRegex = r'^[a-zA-Z0-9]*$';
}
