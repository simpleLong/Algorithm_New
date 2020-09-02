//
//  LengthOfLIS.swift
//  Algorithm
//
//  Created by longxd on 2020/8/25.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 300. 最长上升子序列
 给定一个无序的整数数组，找到其中最长上升子序列的长度。

 示例:

 输入: [10,9,2,5,3,7,101,18]
 输出: 4
 解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
 说明:

 可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
 你算法的时间复杂度应该为 O(n2) 。
 进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?
 
 */
func lengthOfLIS(_ nums: [Int]) -> Int {
   
   if nums.count == 0 {
       return 0
   }
   
    let n = nums.count
    var dp = [Int].init(repeating:1 ,count:n)

    for i in 0..<nums.count {
        for j in 0..<i {
            print("nums[i]===",nums[i])
            if nums[i] > nums[j] {
                dp[i] = max(dp[i] ,dp[j]+1)
            }
        }
    }
    var res = 1
    for i  in 0..<nums.count {
        res = max(res, dp[i])
    }
    


    return res
}
