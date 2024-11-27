#include<iostream>
#include<fstream>
#include<string>
#include<cmath>

using namespace std;



int main(void) {
  int current_number = 0;
  int adjusted_number = 0;
  int total = 0;

  ifstream input_file;
  string current_line;

  input_file.open("input.txt");

  while(input_file >> current_line) {
    current_number = stoi(current_line);

    adjusted_number = floor(current_number / 3) - 2;

    total += adjusted_number;
  }

  printf(" ---------- TOTAL ----------\n");
  printf("%i\n", total);
}
