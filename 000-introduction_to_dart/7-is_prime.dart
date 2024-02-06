bool isPrime(intnumber) {
  for (int i = 2; i <= intnumber / i; ++i) {
    if (intnumber % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  int number = 7;

  if (isPrime(number)) {
    print('$number is a prime number.');
  } else {
    print('$number is not a prime number.');
  }
}
