//
//  main.cpp
//  neetcodecpp
//
//  Created by Sarvar Boltaboyev on 09/10/25.
//

#include <iostream>
using namespace std;
#include "functions.hpp"



int main() {
    
    vector<int> array = { 1, 2, 3, 4, 5};
 
    int sth  = subarraySum(array, 5);

    cout << sth << endl;
}
