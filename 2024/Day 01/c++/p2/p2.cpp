#include<bits/stdc++.h>
#include<cmath>
#include<fstream>
#include<iostream>
#include<string>
#include<vector>

using namespace std;

bool is_a_number(char value) {
  return value != ' ' && value != '\n';
}

int main(void) {
  int total = 0;

  ifstream input_file;
  input_file.open("input.txt");

  string current_line;

  vector<int> left_numbers = {};
  vector<int> right_numbers = {};

  while(!input_file.eof()) {
    int left = 0;
    int right = 0;

    getline(input_file, current_line);

    sscanf(current_line.c_str(), "%d   %d", &left, &right);

    left_numbers.push_back(left);
    right_numbers.push_back(right);
  }

  for(int i : left_numbers) {
    int quantity = count(right_numbers.begin(), right_numbers.end(), i);

    if(quantity > 0) {
      total = total + (quantity * i);
    }
  }

  cout << total << endl;
}