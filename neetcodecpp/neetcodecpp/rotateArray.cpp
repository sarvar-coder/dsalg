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
    
    if (k > nums.size())  { k -= nums.size(); }
    
    while (k != 0) {
        int lastElement = nums.back();
        nums.pop_back();
        nums.insert(nums.begin(), lastElement);
        k--;
    }
    
}
