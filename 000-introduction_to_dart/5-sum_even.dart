int sumOfEvenNumbers(List<int> numbers) {
  int sum = 0;

  for (int num in numbers) {
    if (num % 2 == 0) {
      sum += num;
    }
  }

  return sum;
}

void main() {
  List<int> numbers = [11, 22, 33, 44, 55, 77];
  int value = sumOfEvenNumbers(numbers);

  print("Sum of even numbers: $value");
}
