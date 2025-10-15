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
    
//        vector<int> array = {0,0,1,1,1,2,2,3,3,4};
        vector<int> array = {1, 1, 2, 3, 3};
//    vector<int> array = {1};
    int profit = maxProfit(array);
    cout << profit << endl;
}
