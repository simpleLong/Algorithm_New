//
//  Rotate.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/11.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 33. 搜索旋转排序数组
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。

 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。

 你可以假设数组中不存在重复的元素。

 你的算法时间复杂度必须是 O(log n) 级别。

 示例 1:

 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 示例 2:

 输入: nums = [4,5,6,7,0,1,2], target = 3
 输出: -1
 
 */
func search(_ nums: [Int], _ target: Int) -> Int {
    
    var left = 0
    var right = nums.count-1
    var middle = (right-left)/2 + left
    
    
    
    
    while left <= right {
        middle = (right-left)/2 + left
        if nums[middle] == target {
            return middle
        }
        
        if nums[left] <=  nums[middle]{
            if nums[left] <= target && target <= nums[middle] {
                right = middle-1
            }else{
                left = middle+1
            }
        }else{
            if nums[right] >= target && target >= nums[middle] {
                left = middle + 1
            }else {
                right = middle - 1
            }
        }
    }
    
    
    
    return -1
}
