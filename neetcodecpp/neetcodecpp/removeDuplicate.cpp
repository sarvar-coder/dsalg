//
//  removeDuplicate.cpp
//  neetcodecpp
//
//  Created by Sarvar Boltaboyev on 13/10/25.
//

#include <stdio.h>
#include "iostream"
using namespace std;

int removeDuplicates(vector<int>& nums) {

    int lastUnique = 0;
    int i = 1;
    
    while (i < nums.size()) {
        if (nums[lastUnique] != nums[i]) {
            lastUnique++;
            nums[lastUnique] = nums[i];
        }
        i++;
    }
//    for (int element : nums) {
//        cout<< element << " " ;
//    }
//    cout << "\n";
    return lastUnique + 1; // cause index starts from zero.
}
