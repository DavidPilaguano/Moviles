class FriendNumbersModel {
  int sumProperDivisors(int n) {
    int sum = 0;
    for (int i = 1; i <= n ~/ 2; i++) {
      if (n % i == 0) sum += i;
    }
    return sum;
  }

  bool areFriends(int a, int b) {
    return sumProperDivisors(a) == b && sumProperDivisors(b) == a;
  }
}
