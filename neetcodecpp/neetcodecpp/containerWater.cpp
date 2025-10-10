//
//  containerWater.cpp
//  neetcodecpp
//
//  Created by Sarvar Boltaboyev on 10/10/25.
//

#include <stdio.h>
#include "iostream"
using namespace std;


int maxArea(vector<int>& height) {
    
    int maxSum = 0;
    int sum = 0;
    int n = height.size();
    int left = (n / 2) - 1;
    int right = n / 2;
    
    while (left != 0 || right != n) {
        sum += height[left] + height[right];
        maxSum = max(maxSum, sum);
        
        if (height[left] > height[right]) {
            right++;
        } else if ( height[left] < height[right]) {
            left--;
        }
        
    }
    
    
    return  maxSum;
}
