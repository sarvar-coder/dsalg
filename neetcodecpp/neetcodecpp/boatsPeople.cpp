//
//  boatsPeople.cpp
//  neetcodecpp
//
//  Created by Sarvar Boltaboyev on 11/10/25.
//

#include <stdio.h>
#include "iostream"
#include <algorithm>
using namespace  std;

int numRescueBoats(vector<int>& people, int limit) {
    
    ranges::sort(people);
    int countBoats = 0;
    int sum = 0;
    int left = 0;
    int right = int(people.size()) - 1;
    
    while (left < right) {
        sum += people[left];
        if (sum == limit) {
            countBoats++;
            left++;
            sum = 0;
        } else if (sum > limit) {
            sum = sum - (sum - people[left]);
        } else {
            left++;
        }
        
    }
    
    return countBoats;
}
