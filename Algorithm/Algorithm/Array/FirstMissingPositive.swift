//
//  FirstMissingPositive.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/1.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

/**
 41. 缺失的第一个正数
 给你一个未排序的整数数组，请你找出其中没有出现的最小的正整数。

  

 示例 1:

 输入: [1,2,0]
 输出: 3
 示例 2:

 输入: [3,4,-1,1]
 输出: 2
 示例 3:

 输入: [7,8,9,11,12]
 输出: 1
  

 提示：

 你的算法的时间复杂度应为O(n)，并且只能使用常数级别的额外空间。
 */
func firstMissingPositive(_ nums: [Int]) -> Int {//使用hash的思想解决
    var nums = nums
    let length = nums.count
    
    
    if !nums.contains(1) {
        return 1
    }
    if length == 1 {
        return 2
    }

    for (index ,value) in nums.enumerated() {
        if value < 1 || value > nums.count {
            nums[index] = 1
        }
    }

    for value in nums {
        if value == length {
            nums[0] = -abs(nums[0])
        }else{
            nums[value] = -abs(nums[value])
        }
    }
     
    for i in 1..<length {
        if nums[i] > 0 {
            return i
        }
    }
    if nums[0] > 0 {
        return length
    }
    
    return length+1
}
