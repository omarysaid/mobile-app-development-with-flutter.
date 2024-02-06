int findIndexOfFirstOccurrence(List<int> myList, int target) {
  for (int i = 0; i < myList.length; i++) {
    if (myList[i] == target) {
      return i;
    }
  }
  {
    return 0; // If the target isn't found.
  }
}

void main() {
  List<int> myList = [10, 20, 45, 50, 5, 8, 40, 30, 80];
  int target = 30;
  int number = findIndexOfFirstOccurrence(myList, target);
  if (number != 0) {
    print("The first occurrence of $target is at index $number.");
  }
}
