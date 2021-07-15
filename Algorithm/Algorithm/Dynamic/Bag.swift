//
//  Bag.swift
//  Algorithm
//
//  Created by longxd on 2020/8/25.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 416. 分割等和子集
 给定一个只包含正整数的非空数组。是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。

 注意:

 每个数组中的元素不会超过 100
 数组的大小不会超过 200
 示例 1:

 输入: [1, 5, 11, 5]

 输出: true

 解释: 数组可以分割成 [1, 5, 5] 和 [11].
  

 示例 2:

 输入: [1, 2, 3, 5]

 输出: false

 解释: 数组不能分割成两个元素和相等的子集.
 
 */
func canPartition(_ nums: [Int]) -> Bool {
    var result = false
    
    let sum  =  nums.reduce(0) { (element1, element2) -> Int in
        return element1 + element2
    }
    if sum%2 != 0 {
        return result
    }
    let res = sum/2
    

    
    
    
    
    return result
}
func dp(_ start :Int,_ num :[Int] ,target: Int){
    
}
/**
 给定一个数组,和一个target,找出所有符合条件的组合
 例如 nums = [1,2,2,3,2,4,7],target = 7
 [
 [1,2,2,2],
 [2,3,2],
 [2,2,3],
 [2,3,2]
 [1,2,4],
 [1,2,4],
 [1,2,4],//这两个2的下标不一样不当做重复的
 [3,4],
 [7]
 ]
 
 */
//var allRes = [[Int]]()
func getTheAllcombination(nums:[Int],target:Int) -> [[Int]] {
    var dp = [([[Int]],[[Int]])].init(repeating: ([[]], [[]]), count: nums.count)
    if nums.count == 0 {
        return [[]]
    }
    if nums[0] == target {//元组的第0个元素装的是不符合条件的组合,第一个元素装的是符合条件的组合
         dp[0].1.append([nums[0]])
    }else{
        dp[0].0.append([nums[0]])
    }
    
    for i  in 1..<nums.count {
        
        dp[i].1 = dp[i-1].1
        dp[i].0 = dp[i-1].0
        for list in dp[i].0 {

            let sum =   list.reduce(0) { (res, element) -> Int in
                res + element
            }
            var array = list
            array.append(nums[i])
            if sum + nums[i] == target{

                dp[i].1.append(array)
            }else{

                dp[i].0.append(array)
            }
        }
    }
    return dp[nums.count-1].1
}

//private func help(start: Int ,end: Int ,nums :[Int] ,target: Int) -> [[Int]]{
//    
//    var dp = [([[Int]],[[Int]])].init(repeating: ([[Int]](), [[Int]]()), count: nums.count)
//    if nums.count == 0 {
//        return [[]]
//    }
//    if nums[0] == target {//元组的第0个元素装的是不符合条件的组合,第一个元素装的是符合条件的组合
//         dp[0].1.append([nums[0]])
//    }else{
//        dp[0].0.append([nums[0]])
//    }
//    
//    for i  in 1..<nums.count {
//        
//        dp[i].1 = dp[i-1].1
//        dp[i].0 = dp[i-1].0
//        for list in dp[i].0 {
//
//            let sum =   list.reduce(0) { (res, element) -> Int in
//                res + element
//            }
//            var array = list
//            array.append(nums[i])
//            if sum + nums[i] == target{
//
//                dp[i].1.append(array)
//            }else{
//
//                dp[i].0.append(array)
//            }
//        }
//    }
//    return dp[nums.count-1].1
//    
//}
