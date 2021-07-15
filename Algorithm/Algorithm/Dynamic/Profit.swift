//
//  Profit.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/4.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

/**
 121. 买卖股票的最佳时机
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

 如果你最多只允许完成一笔交易（即买入和卖出一支股票一次），设计一个算法来计算你所能获取的最大利润。

 注意：你不能在买入股票前卖出股票。

  

 示例 1:

 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 示例 2:

 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
 */

func maxProfit1(_ prices: [Int]) -> Int {

    guard prices.count > 0 else {
        return 0
    }
    let n  = prices.count
    var dp_1 = -prices[0]
    var dp_0 = 0


    for i  in 1..<n {
        (dp_0,dp_1) = (max(dp_0, dp_1 + prices[i]),max(dp_1, -prices[i]))
    }

    return dp_0
    

    
    
    
    
}


/**
 122. 买卖股票的最佳时机 II
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。

 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

  

 示例 1:

 输入: [7,1,5,3,6,4]
 输出: 7
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
      随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3 。
 示例 2:

 输入: [1,2,3,4,5]
 输出: 4
 解释: 在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
      注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。
      因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。
 示例 3:

 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
  

 提示：

 1 <= prices.length <= 3 * 10 ^ 4
 0 <= prices[i] <= 10 ^ 4
 
 
 */

func maxProfit_2(_ prices: [Int]) -> Int {

    if prices.count == 0 {
        return 0
    }
    
    var dp_1 = -prices[0]
    var dp_0 = 0
    for i  in 1..<prices.count {
      (dp_0 ,dp_1) = ( max(dp_0, dp_1 + prices[i]) , max(dp_1, dp_0 - prices[i]))
    }
    
    
    return dp_0
    
    
}

/**
 123. 买卖股票的最佳时机 III
 给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你最多可以完成 两笔 交易。

 注意: 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

 示例 1:

 输入: [3,3,5,0,0,3,1,4]
 输出: 6
 解释: 在第 4 天（股票价格 = 0）的时候买入，在第 6 天（股票价格 = 3）的时候卖出，这笔交易所能获得利润 = 3-0 = 3 。
      随后，在第 7 天（股票价格 = 1）的时候买入，在第 8 天 （股票价格 = 4）的时候卖出，这笔交易所能获得利润 = 4-1 = 3 。
 示例 2:

 输入: [1,2,3,4,5]
 输出: 4
 解释: 在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
      注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。
      因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。
 示例 3:

 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这个情况下, 没有交易完成, 所以最大利润为 0。
 
 
 */

//func maxProfit_3(_ prices: [Int]) -> Int {
//
//
//    let k = 2
//    
//    
//    
//    
//}

func maxProfit_3(_ prices: [Int]) -> Int {

    if prices.count == 0 {
        return 0
    }

    let k = 2
    let n  = prices.count
    
    var dp = Array<Array<Int>>.init(repeating: Array<Int>.init(repeating: 0, count: 2), count: k+1)
    
    for i  in 0..<n {
        for j in 1...k {
            if i == 0 {
                dp[j][0] = 0
                dp[j][1] = -prices[i]
            }else{
                (dp[j][0],dp[j][1]) = (max(dp[j][0], dp[j][1] + prices[i]),max(dp[j][1], dp[j-1][0] - prices[i]))
            }
        }
    }
    
    
    return dp[k][0]
    
}




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

/**
 188. 买卖股票的最佳时机 IV
 给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你最多可以完成 k 笔交易。

 注意: 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

 示例 1:

 输入: [2,4,1], k = 2
 输出: 2
 解释: 在第 1 天 (股票价格 = 2) 的时候买入，在第 2 天 (股票价格 = 4) 的时候卖出，这笔交易所能获得利润 = 4-2 = 2 。
 示例 2:

 输入: [3,2,6,5,0,3], k = 2
 输出: 7
 解释: 在第 2 天 (股票价格 = 2) 的时候买入，在第 3 天 (股票价格 = 6) 的时候卖出, 这笔交易所能获得利润 = 6-2 = 4 。
      随后，在第 5 天 (股票价格 = 0) 的时候买入，在第 6 天 (股票价格 = 3) 的时候卖出, 这笔交易所能获得利润 = 3-0 = 3 。
 
 */
func maxProfit_4(_ k: Int, _ prices: [Int]) -> Int {
    if prices.count == 0 {
        return 0
    }
    let n  = prices.count
    if k > n/2 {
        return maxProfit_2(prices)
    }
    var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: 2), count: k+1)
    
    for i in 0..<n {
        for j in 1...k {
            if i == 0 {
                dp[j][0] = 0
                dp[j][1] = -prices[i]
            }else{
                ( dp[j][0] ,dp[j][1] ) = (max(dp[j][0], dp[j][1] + prices[i]) ,max(dp[j][1], dp[j-1][0] - prices[i]))
            }
        }
    }
    

    return dp[k][0]
}

/**
 309. 最佳买卖股票时机含冷冻期
 给定一个整数数组，其中第 i 个元素代表了第 i 天的股票价格 。

 设计一个算法计算出最大利润。在满足以下约束条件下，你可以尽可能地完成更多的交易（多次买卖一支股票）:

 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。
 示例:

 输入: [1,2,3,0,2]
 输出: 3
 解释: 对应的交易状态为: [买入, 卖出, 冷冻期, 买入, 卖出]
 
 */
func maxProfit_V(_ prices: [Int]) -> Int {
    if prices.count == 0 {
        return 0
    }
    let n  = prices.count
    
    var dp = Array<Array<Int>>.init(repeating: Array<Int>(repeating: 0, count: 2), count: n)
    dp[0][0] = 0
    dp[0][1] = -prices[0]
    for i  in 1..<n {

        if i == 1 {
            (dp[i][0] ,dp[i][1]) = (max(dp[i-1][0], dp[i-1][1] + prices[i]), max(dp[i-1][1],  -prices[i] ))
        }else{
            (dp[i][0],dp[i][1]) = (max(dp[i-1][0], dp[i-1][1] + prices[i]) ,max(dp[i-1][1], dp[i-2][0] - prices[i]))
        }
    }
    return dp[n-1][0]
}
