List<int> findTwoNumbersWithSum(List<int> numbers, int target) {
  for (int a = 0; a < numbers.length - 1; a++) {
    for (int b = a + 1; b < numbers.length; b++) {
      if (numbers[a] + numbers[b] == target) {
        return [a, b];
      }
    }
  }

  // return an empty list if no solution is found.
  return [];
}

void main() {
  List<int> num = [2, 7, 11, 15];
  int target = 9;

  List<int> result = findTwoNumbersWithSum(num, target);

  print("Input: num = $num, target = $target");
  print("Output: $result");
}
