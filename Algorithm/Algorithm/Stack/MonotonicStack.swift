//
//  MonotonicStack.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/5.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

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
    
    for (index ,value) in heights.enumerated() {
        
        while !stack.isEmpty && value < heights[stack.last!] {
            let height = heights[stack.popLast()!]
            let left  = stack.isEmpty ? -1 : stack.last!
            
            maxArea = max((index-left-1)*height, maxArea)
            
        }
        stack.append(index)
    }
    

    while !stack.isEmpty {
        let cur = stack.popLast()
        let left = stack.isEmpty ? -1 :stack.last!
        maxArea = max(maxArea, (heights.count-left-1)*heights[cur!])
        
        
    }
    
    return maxArea
    
    
  }
