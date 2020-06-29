//
//  ProductExceptSelf.swift
//  Algorithm
//
//  Created by longxd on 2020/6/27.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 238. 除自身以外数组的乘积
 给你一个长度为 n 的整数数组 nums，其中 n > 1，返回输出数组 output ，其中 output[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积。

  

 示例:

 输入: [1,2,3,4]
 输出: [24,12,8,6]
  

 提示：题目数据保证数组之中任意元素的全部前缀元素和后缀（甚至是整个数组）的乘积都在 32 位整数范围内。

 说明: 请不要使用除法，且在 O(n) 时间复杂度内完成此题。
 
 */
public  func productExceptSelf(_ nums: [Int]) -> [Int] {
    var res = [Int].init(repeating: 0, count: nums.count)
    var sum = 1
    

    var  i  = 0
    var count = 0
    for i  in 0..<nums.count {
        if nums.count == 1 {
            <#code#>
        }
    }
    
    

    
    for (index ,value) in nums.enumerated() {
        res[index] = sum/(value == 0 ? 1 : value)
    }

    
    return res
}
class MinStack {

    var datastack = [Int]()
    var helperStack = [Int]()
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        datastack.append(x)
        if helperStack.isEmpty || helperStack.last! >=  x {
            helperStack.append(x)
        }else{
            helperStack.append(helperStack.last!)
        }
    }
    
    func pop() {
        _ = datastack.popLast()
        _ = helperStack.popLast()
    }
    
    func top() -> Int {
        return datastack.last!
    }
    
    func getMin() -> Int {
        return helperStack.last!
    }
}
