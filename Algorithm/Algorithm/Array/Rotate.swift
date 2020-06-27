//
//  Rotate.swift
//  Algorithm
//
//  Created by longxd on 2020/6/26.
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
// MARK: -根据旋转数组的特性，当元素不重复时，如果 nums[i] <= nums[j]，说明区间 [i,j] 是「连续递增」的。

/** i、j 可以重合，所以这里使用的比较运算符是「小于等于」

因此，在旋转排序数组中查找一个特定元素时：

若 target == nums[mid]，直接返回
若 nums[left] <= nums[mid]，说明左侧区间 [left,mid]「连续递增」。此时：
若 nums[left] <= target <= nums[mid]，说明 target 位于左侧。令 right = mid-1，在左侧区间查找
否则，令 left = mid+1，在右侧区间查找
否则，说明右侧区间 [mid,right]「连续递增」。此时：
若 nums[mid] <= target <= nums[right]，说明 target 位于右侧区间。令 left = mid+1，在右侧区间查找
否则，令 right = mid-1，在左侧区间查找
注意：区间收缩时不包含 mid，也就是说，实际收缩后的区间是 [left,mid) 或者 (mid,right]
*/
func search(_ nums: [Int], _ target: Int) -> Int {
    
    if nums.count == 0 {
        return -1
    }
    var left = 0 ,right = nums.count-1 ,mid = 0
    
    while left  <= right {
        mid = left + (right-left)/2
        if nums[mid] == target {
            return mid
        }
        if nums[left] <= nums[mid] {
            if nums[left] <= target && target <= nums[mid] {
                right =  mid - 1
            }else{
                left = mid + 1
            }
        }else{
            if nums[mid]  <= target && target <= nums[right] {
                left = mid + 1
            }else{
                right = mid - 1
            }
        }
    }

    return -1
}
/**
 81. 搜索旋转排序数组 II
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。

 ( 例如，数组 [0,0,1,2,2,5,6] 可能变为 [2,5,6,0,0,1,2] )。

 编写一个函数来判断给定的目标值是否存在于数组中。若存在返回 true，否则返回 false。

 示例 1:

 输入: nums = [2,5,6,0,0,1,2], target = 0
 输出: true
 示例 2:

 输入: nums = [2,5,6,0,0,1,2], target = 3
 输出: false
 进阶:

 这是 搜索旋转排序数组 的延伸题目，本题中的 nums  可能包含重复元素。
 这会影响到程序的时间复杂度吗？会有怎样的影响，为什么？

 */
func search(_ nums: [Int], _ target: Int) -> Bool {
    
    if nums.count ==  0 {
        return false
    }
    var left = 0 ,mid = 0 , right = nums.count - 1
    
    while left <= right {
        mid = left + (right - left)/2
        if target == nums[mid] {
            return true
        }
        if nums[left] == nums[mid] {
            left += 1
            continue
        }
        if nums[left] < nums[mid] {
            if nums[left] <= target && target < nums[mid] {
                right = mid - 1
            }else{
                left = mid + 1
            }
        }else{
            if nums[mid] < target && target <= nums[right] {
                left = mid + 1
            }else{
                right = mid - 1
            }
        }
    }
    return false
}
/**
 153. 寻找旋转排序数组中的最小值
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。

 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

 请找出其中最小的元素。

 你可以假设数组中不存在重复元素。

 示例 1:

 输入: [3,4,5,1,2]
 输出: 1
 示例 2:

 输入: [4,5,6,7,0,1,2]
 输出: 0
 
 
 */
func findMin(_ nums: [Int]) -> Int {
    var left = 0 ,right = nums.count - 1
    
    while left < right {
        let mid = left + (right - left)/2
        if nums[mid] > nums[right] {
            left = mid + 1
        }else {
            right = mid
        }
        
    }
    return nums[left]
    
}
/**
 154. 寻找旋转排序数组中的最小值 II
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。

 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

 请找出其中最小的元素。

 注意数组中可能存在重复的元素。

 示例 1：

 输入: [1,3,5]
 输出: 1
 示例 2：

 输入: [2,2,2,0,1]
 输出: 0
 
 */
func findMin_II(_ nums: [Int]) -> Int {
var left = 0 ,right = nums.count - 1

while left < right {
    let mid = left + (right - left)/2
    if nums[mid] > nums[right] {
        left = mid + 1
    }else if nums[left] > nums[mid]{
        right = mid
    }else {
        right -= 1
    }
    
}
return nums[left]

}
