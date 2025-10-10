//
//  main.cpp
//  neetcodecpp
//
//  Created by Sarvar Boltaboyev on 09/10/25.
//

#include <iostream>
using namespace std;

int maxArea(vector<int>& height);

int main() {
    vector<int> array = { 1,8,6,2,5,4,8,3,7 };
    int result = maxArea(array);
    
    cout << result << endl;
}
