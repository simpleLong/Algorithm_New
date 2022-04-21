//
//  Coin.swift
//  Algorithm
//
//  Created by longxd on 2022/4/21.
//  Copyright © 2022 longxd. All rights reserved.
//

import Foundation
/**
 322. 零钱兑换
 给你一个整数数组 coins ，表示不同面额的硬币；以及一个整数 amount ，表示总金额。

 计算并返回可以凑成总金额所需的 最少的硬币个数 。如果没有任何一种硬币组合能组成总金额，返回 -1 。

 你可以认为每种硬币的数量是无限的。

  

 示例 1：

 输入：coins = [1, 2, 5], amount = 11
 输出：3
 解释：11 = 5 + 5 + 1
 示例 2：

 输入：coins = [2], amount = 3
 输出：-1
 示例 3：

 输入：coins = [1], amount = 0
 输出：0
 */
//var memo : [Int]!
//public func coinChange(_ coins: [Int], _ amount: Int) -> Int {
//    var memo = [Int].init(repeating: 0, count: amount + 1)
//    let res = dpfunc(amount, coins,memo: &memo)
//
//    return res
//    // 状态转移方程我不知道 不知道怎么表达 用或者不用最大的值
//}
//func dpfunc(_ amount : Int ,_ coins: [Int] ,memo: inout [Int]) -> Int {
//    if amount == 0 {
//        return 0
//    }
//    if amount < 0 {
//        return -1
//    }
//    if memo[amount] != 0 {
//        return memo[amount]
//    }
//    var res = Int.max
//    for coin in coins {
//
//        let subProblem = dpfunc(amount - coin, coins, memo: &memo)
//        if subProblem == -1 {
//            continue
//        }
//        res = min(res, subProblem + 1)
//
//    }
//    memo[amount] = res != Int.max ? res : -1
//    return memo[amount]
//}


public func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    if amount == 0 {
        return 0
    }
    var dp = [Int].init(repeating: amount+1, count: amount+1)
    dp[0] = 0
    for i in 1...amount {
        for coin in coins {
            if i < coin {
                continue
            }
            dp[i] = min(dp[i], dp[i-coin] + 1)
        }
    }
    
    
    return dp[amount] != amount+1 ? dp[amount] : -1
}
