//
//  Sum.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/1.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

/**
 1. 两数之和
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

  

 示例:

 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var map : [Int:Int] = [:]
    
    for (index ,value) in nums.enumerated() {

        if let res = map[target-value] {
            return [res,index]
        }
        map[value] = index
    }
    return [Int]()
    
}
/**
 15. 三数之和
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

  

 示例：

 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

 满足要求的三元组集合为：
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
 */
func threeSum(_ nums: [Int]) -> [[Int]] {
    var nums = nums.sorted()
    var result = [[Int]]()
    
    
    for (index ,value) in nums.enumerated() {

        if index == 0 || nums[index] > nums[index-1] {
            var left = index+1
            var right = nums.count - 1
            while left < right {
                let s  = nums[index] + nums[left] + nums[right]
                
                if s == 0 {
                    result.append([value,nums[left],nums[right]])
                    left += 1
                    right -= 1
                    while left < right && nums[left] == nums[left-1] {
                        left += 1
                    }
                    while right > left && nums[right] == nums[right+1] {
                        right -= 1
                    }
                }else if s > 0 {
                    right -= 1
                }else{
                    left += 1
                }
            }
        }
   
    }
    return result
}

/**
 18. 四数之和
 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。

 注意：

 答案中不可以包含重复的四元组。

 示例：

 给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。

 满足要求的四元组集合为：
 [
   [-1,  0, 0, 1],
   [-2, -1, 1, 2],
   [-2,  0, 0, 2]
 ]
 
 */
 func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {

    var res = [[Int]]()
    var nums = nums.sorted()
    if nums.count < 4 {
        return res
    }
    let length = nums.count
    
    for i in 0..<length-3 {
        if nums[i] + nums[i+1] + nums[i+2] + nums[i+3] > target{
            break
        }
        if nums[i] + nums[length-1] + nums[length-2] + nums[length-3] < target{
            continue
        }
        if i > 0 && nums[i] == nums[i-1] {
            continue
        }
        for j in i+1..<nums.count-2 {
            if nums[i] + nums[j] + nums[j+1] + nums[j+2] > target {
                break
            }
            if nums[i] + nums[j] + nums[length-1] + nums[length-2] < target {
                continue
            }
            if j > i+1 && nums[j] == nums[j-1] {
                continue
            }
            var left = j+1
            var right = length-1
            while left < right {
                let s = nums[i] + nums[j] + nums[left] + nums[right]
                if s == target {
                    res.append([nums[i],nums[j],nums[left],nums[right]])
                    left += 1
                    right -= 1
                    while left < right && nums[left] == nums[left-1] {
                        left += 1
                    }
                    while right > left && nums[right] == nums[right+1] {
                        right -= 1
                    }
                }else if s < target {
                    left += 1
                }else{
                    right -= 1
                }
            }
        }
    }
    

    
    return res
    
}
