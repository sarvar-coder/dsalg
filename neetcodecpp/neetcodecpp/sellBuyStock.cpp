//
//  sellBuyStock.cpp
//  neetcodecpp
//
//  Created by Sarvar Boltaboyev on 14/10/25.
//

#include <stdio.h>
#include "iostream"
using namespace std;

int maxProfit(vector<int>& prices) {
    int profit = 0;
    int maxProfit = 0;
    
    
    for(int i = 0; i < (int) prices.size() - 1; i++) {
//        cout << i + 1 << "-day " << prices[i] << endl;
        profit = prices[i + 1] - prices[i];
        if (profit > 0) {
            maxProfit += profit;
        }
    }
    
    return maxProfit;
}
