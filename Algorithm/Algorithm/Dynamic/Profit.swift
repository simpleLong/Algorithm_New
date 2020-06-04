//
//  Profit.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/4.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 714. 买卖股票的最佳时机含手续费
 给定一个整数数组 prices，其中第 i 个元素代表了第 i 天的股票价格 ；非负整数 fee 代表了交易股票的手续费用。

 你可以无限次地完成交易，但是你每笔交易都需要付手续费。如果你已经购买了一个股票，在卖出它之前你就不能再继续购买股票了。

 返回获得利润的最大值。

 注意：这里的一笔交易指买入持有并卖出股票的整个过程，每笔交易你只需要为支付一次手续费。

 示例 1:

 输入: prices = [1, 3, 2, 8, 4, 9], fee = 2
 输出: 8
 解释: 能够达到的最大利润:
 在此处买入 prices[0] = 1
 在此处卖出 prices[3] = 8
 在此处买入 prices[4] = 4
 在此处卖出 prices[5] = 9
 总利润: ((8 - 1) - 2) + ((9 - 4) - 2) = 8.
 注意:

 0 < prices.length <= 50000.
 0 < prices[i] < 50000.
 0 <= fee < 50000.
 
 */
func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
 //MARK: 最初的动态规划方法
//    var res = [[Int]].init(repeating: [Int].init(repeating: 0, count: 2), count: prices.count)
//
//    res[0][0] = 0
//    res[0][1] = -prices[0]
//    for i  in 1..<prices.count {
//        res[i][0] = max(res[i-1][0], res[i-1][1]+prices[i])
//        res[i][1] = max(res[i-1][1], res[i-1][0]-prices[i]-fee)
//    }
//
//    return res[prices.count-1][0]
 //MARK: 优化后的动态规划方法
    var sold = 0
    var hold = -prices[0]
    for i in 1..<prices.count {
       ( sold  ,hold ) = ( max(sold, hold+prices[i]-fee) , max(hold, sold-prices[i]))

    }
    
    return sold
    
}
