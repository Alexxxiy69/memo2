int howMuch(List<int> rand, int n) {
  int k = 0;
  for(int i = 0; i < rand.length; i++) {
    if(rand[i] == n) {
      k++;
    }
  }
  return k;
}
