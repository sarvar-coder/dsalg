//
//  firstMissingPositive.cpp
//  neetcodecpp
//
//  Created by Sarvar Boltaboyev on 11/10/25.
//

#include <stdio.h>
#include "iostream"
using namespace std;

int firstMissingPositive(vector<int>& nums) {
    
    ranges::sort(nums);
    int holder = 1;
    int i = 0;
    int n = int(nums.size()) - 1;
    
    while (i <= n) {
        if (holder == nums[i]) { holder++; }
        i++;
    }
    
    return holder;
}
