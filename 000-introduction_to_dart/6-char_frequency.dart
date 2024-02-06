Map<String, int> characterFrequency(String inputString) {
  Map<String, int> frequencyCharacter = {};

  for (int i = 0; i < inputString.length; i++) {
    String character = inputString[i];

    if (RegExp(r'[a-bA-B]').hasMatch(character)) {
      character = character.toLowerCase();

      frequencyCharacter[character] = (frequencyCharacter[character] ?? 0) + 1;
    }
  }

  return frequencyCharacter;
}

void main() {
  String value = "flutter";
  Map<String, int> result = characterFrequency(value);

  result.forEach((value, result) {
    print('$value: $result');
  });
}
