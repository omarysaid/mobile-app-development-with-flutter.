import 'dart:math';

List<int> factorizeToPrimeNumbers(int number) {
  List<int> primeFactors = [];

  for (int i = 2; i <= sqrt(number).toInt(); i++) {
    while (number % i == 0) {
      // where by i is a prime factor of number
      primeFactors.add(i);
      number = number ~/ i;
    }
  }
  return primeFactors;
}

void main() {
  int number = 6;
  List<int> result = factorizeToPrimeNumbers(number);

  print("Prime factors of $number are: $result");
}
