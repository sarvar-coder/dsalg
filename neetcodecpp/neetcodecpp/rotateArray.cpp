//
//  rotateArray.cpp
//  neetcodecpp
//
//  Created by Sarvar Boltaboyev on 09/10/25.
//

#include <iostream>
using namespace std;

void rotate(vector<int>& nums, int k) {
    if (k == 0 || nums.size() == 1 || nums.size() == k) { return;}
    vector<int> newNums;
    newNums.reserve(nums.size());
    
    int i = 0;
    int n = int(nums.size()) - 1;
    
    int ptr1 = k;
    int ptr2 = k;
    
    if (k > nums.size()) {
        ptr1 = k % nums.size();
        ptr2 = k % nums.size();
    }
    
    while (i < n) {
        if (ptr1 != 0) {
            newNums.push_back(nums[n - ptr1 + 1]);
            ptr1--;
        }
        
        if (ptr1 == 0) {
            newNums.push_back(nums[i - ptr2 + 1]);
        }
        i++;
    }
    nums = newNums;
}
