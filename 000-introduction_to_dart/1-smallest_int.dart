import "dart:math";

int getSmallestInteger(List<int> myList) {
  int smallestInteger = myList.reduce(min);

  return smallestInteger;
}

void main() {
  // Example usage:
  List<int> myList = [20, 30, 10, 50, 80, 100];
  int value = getSmallestInteger(myList);

  print("The smallest integer is: $value");
}
