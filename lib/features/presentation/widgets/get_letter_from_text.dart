String getLetterFromText(String text) {
  String letter = "";
  List<String> list = text.split(" ");
  for (int i = 0; i < list.length; i++) {
    letter = letter + list[i][0].toUpperCase();
  }
  return letter;
}
