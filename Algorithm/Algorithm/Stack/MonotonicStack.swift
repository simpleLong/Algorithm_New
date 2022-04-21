//
//  MonotonicStack.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/5.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

/**
 496. 下一个更大元素 I
 nums1 中数字 x 的 下一个更大元素 是指 x 在 nums2 中对应位置 右侧 的 第一个 比 x 大的元素。

 给你两个 没有重复元素 的数组 nums1 和 nums2 ，下标从 0 开始计数，其中nums1 是 nums2 的子集。

 对于每个 0 <= i < nums1.length ，找出满足 nums1[i] == nums2[j] 的下标 j ，并且在 nums2 确定 nums2[j] 的 下一个更大元素 。如果不存在下一个更大元素，那么本次查询的答案是 -1 。

 返回一个长度为 nums1.length 的数组 ans 作为答案，满足 ans[i] 是如上所述的 下一个更大元素 。

  

 示例 1：

 输入：nums1 = [4,1,2], nums2 = [1,3,4,2].
 输出：[-1,3,-1]
 解释：nums1 中每个值的下一个更大元素如下所述：
 - 4 ，用加粗斜体标识，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
 - 1 ，用加粗斜体标识，nums2 = [1,3,4,2]。下一个更大元素是 3 。
 - 2 ，用加粗斜体标识，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
 示例 2：

 输入：nums1 = [2,4], nums2 = [1,2,3,4].
 输出：[3,-1]
 解释：nums1 中每个值的下一个更大元素如下所述：
 - 2 ，用加粗斜体标识，nums2 = [1,2,3,4]。下一个更大元素是 3 。
 - 4 ，用加粗斜体标识，nums2 = [1,2,3,4]。不存在下一个更大元素，所以答案是 -1 。
  

 提示：

 1 <= nums1.length <= nums2.length <= 1000
 0 <= nums1[i], nums2[i] <= 104
 nums1和nums2中所有整数 互不相同
 nums1 中的所有整数同样出现在 nums2 中
 */
public func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var indexArray = [Int]()
    var resArray = [Int].init(repeating: -1, count: nums1.count)
    for item in nums1 {
        for (index,value) in nums2.enumerated() {
            if item == value {
                indexArray.append(index)
            }
        }
    }
    var stack = [(Int,Int)]()
    var tmpResIndex = [Int].init(repeating: -1, count: nums2.count)
    
    for (index,value) in nums2.enumerated() {

        while let last = stack.last ,value > last.1 {
            tmpResIndex[last.0] = index
           _ = stack.popLast()
            
        }
        stack.append((index,value))
    }
    for (index ,value)  in indexArray.enumerated() {
        if tmpResIndex[value] != -1 {
            //resArray.append(nums2[tmpResIndex[index]])
            resArray[index] = nums2[tmpResIndex[value]];
        }
        
    }

    return resArray
}

/**
 503. 下一个更大元素 II
 给定一个循环数组 nums （ nums[nums.length - 1] 的下一个元素是 nums[0] ），返回 nums 中每个元素的 下一个更大元素 。

 数字 x 的 下一个更大的元素 是按数组遍历顺序，这个数字之后的第一个比它更大的数，这意味着你应该循环地搜索它的下一个更大的数。如果不存在，则输出 -1 。

  

 示例 1:

 输入: nums = [1,2,1]
 输出: [2,-1,2]
 解释: 第一个 1 的下一个更大的数是 2；
 数字 2 找不到下一个更大的数；
 第二个 1 的下一个最大的数需要循环搜索，结果也是 2。
 示例 2:

 输入: nums = [1,2,3,4,3]
 输出: [2,3,4,-1,4]
  

 提示:

 1 <= nums.length <= 104
 -109 <= nums[i] <= 109
 */

func nextGreaterElements(_ nums: [Int]) -> [Int] {
 
    let n = nums.count
    var res = [Int].init(repeating: -1, count: n)
    var stack = [(Int,Int)]()
    for i  in 0..<2*nums.count {
        while let last = stack.last ,nums[i%n] > last.1 {
            res[last.0] = nums[i%n]
            _ = stack.popLast()
        }
        stack.append((i%n,nums[i%n]))
    }
    return res
}
/**
 739. 每日温度
 根据每日 气温 列表，请重新生成一个列表，对应位置的输出是需要再等待多久温度才会升高超过该日的天数。如果之后都不会升高，请在该位置用 0 来代替。

 例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，你的输出应该是 [1, 1, 4, 2, 1, 1, 0, 0]。

 提示：气温 列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。
 */

 //MARK: 用单调栈的思路去解决
public func dailyTemperatures(_ T: [Int]) -> [Int] {

    var stack = [Int]()
    var res = [Int].init(repeating: 0, count: T.count)
    for (index ,value) in T.enumerated() {
        while let last = stack.last ,value > T[last] {
            res[last] = value-last
            _ = stack.popLast()
        }
        stack.append(index)
    }
    return res
    
}
/**
 42. 接雨水
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。



 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。

 示例:

 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6
 通过次数106,148提交次数207,493
 
 https://leetcode-cn.com/problems/trapping-rain-water/
 */
 //MARK: 用单调栈的方法解决
func trap(_ height: [Int]) -> Int {
    var area = 0
    var stack = [Int]()//单调栈的顺序从大到小,如果后面进来的比前面大,则将前面的pop出去
    for (index ,value) in height.enumerated() {


        while let last = stack.last , value > height[last] {
            let h = height[stack.popLast()!]
            if stack.isEmpty {//必须前后有落差才能有积水
                break
            }
            let minheight = min(height[stack.last!], value)//以两根柱子中小的那一根为准
            area += (minheight-h)*(index-stack.last!-1)


        }

        stack.append(index)
    }


    return area
}
 //MARK: 用双指针的方法
//func trap(_ height: [Int]) -> Int {
//
//    if height.isEmpty {
//        return 0
//    }
//    var left = 0
//    var right = height.count-1
//    var left_max = height[0]
//    var right_max = height[height.count-1]
//    var area = 0
//    while left <= right {
//        left_max = max(height[left], left_max)
//        right_max = max(height[right], right_max)
//        if left_max < right_max {
//            area += left_max-height[left]
//            left += 1
//        }else{
//            area += right_max-height[right]
//            right -= 1
//
//        }
//    }
//
//    return area
//}
/**
https://leetcode-cn.com/problems/largest-rectangle-in-histogram/
 */
public  func largestRectangleArea(_ heights: [Int]) -> Int {
   
    var maxArea = 0
    var stack = [Int]()
    let heights = heights + [0]
    
    
    for (index ,value) in heights.enumerated() {
        
        while !stack.isEmpty && value < heights[stack.last!] {
            let height = heights[stack.popLast()!]
            let left  = stack.isEmpty ? -1 : stack.last!
            
            maxArea = max((index-left-1)*height, maxArea)
            
        }
        stack.append(index)
    }
    


    return maxArea
    
    
  }
