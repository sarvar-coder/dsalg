//
//  subArrayEqualasK.cpp
//  neetcodecpp
//
//  Created by Sarvar Boltaboyev on 12/10/25.
//

#include <stdio.h>
#include "iostream"
using namespace std;

vector<int> prefixSum(vector<int>& nums);

int subarraySum(vector<int>& nums, int k) {
    int n = (int) nums.size();
    prefixSum(nums);
    int count = 0;

    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n + 1; j++) {
            if (nums[j] - nums[i] == k) {
                count++;
            }
        }
    }
  
    return count;
}

vector<int> prefixSum(vector<int>& nums) {
    nums.insert(nums.begin(), 0);
    int i = 1;
    int n = int(nums.size()) ;
    while (i < n ) {
        nums[i] = nums[i] + nums[i - 1];
        i++;
    }

    
    return nums;
}
