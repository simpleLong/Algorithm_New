//
//  MinStack.swift
//  Algorithm
//
//  Created by longxd on 2020/6/28.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 155. 最小栈
 设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

 push(x) —— 将元素 x 推入栈中。
 pop() —— 删除栈顶的元素。
 top() —— 获取栈顶元素。
 getMin() —— 检索栈中的最小元素。
  

 示例:

 输入：
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 输出：
 [null,null,null,null,-3,null,0,-2]

 解释：
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.

 */
class MinStack {

    var stack = [Int]()
    var minNum :Int = Int.max
    
    
    /** initialize your data structure here. */
    init() {

    }
    
    func push(_ x: Int) {

        stack.append(x)
        minNum = Int.max
        for num in stack {
            minNum = min(minNum, num)
        }
        
    }
    
    func pop() {

      _ =  stack.popLast()
        minNum = Int.max
        for num in stack {
            minNum = min(minNum, num)
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {

        return minNum
    }
}
