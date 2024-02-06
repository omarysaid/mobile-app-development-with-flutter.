String intToRoman(int number) {
  List<String> symbols = [
    "M",
    "CM",
    "D",
    "CD",
    "C",
    "XC",
    "L",
    "XL",
    "X",
    "IX",
    "V",
    "IV",
    "I"
  ];
  List<int> values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];

  StringBuffer result = StringBuffer();

  for (int a = 0; a < symbols.length; a++) {
    while (number >= values[a]) {
      result.write(symbols[a]);
      number -= values[a];
    }
  }

  return result.toString();
}

void main() {
  int number = 18;
  String roman = intToRoman(number);
  print("Roman numeral for $number is: $roman");
}
