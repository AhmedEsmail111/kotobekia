class HelperFunctions {
  static bool isArabic(String text) {
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);

      // Check if the character is in the Arabic script range
      if (charCode >= 0x0600 && charCode <= 0x06FF) {
        return true;
      }
    }

    return false;
  }
}
