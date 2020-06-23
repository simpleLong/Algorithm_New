//
//  Brace.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/18.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

/**
 20. 有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:

 输入: "()"
 输出: true
 示例 2:

 输入: "()[]{}"
 输出: true
 示例 3:

 输入: "(]"
 输出: false
 示例 4:

 输入: "([)]"
 输出: false
 示例 5:

 输入: "{[]}"
 输出: true
 */

func isValid(_ s: String) -> Bool {
    
    let map : [Character :Character] = [")":"(","}":"{","]":"["]
    var stack : [Character] = []
    
    
    for c  in s {
        if Array(map.values).contains(c) {
            stack.append(c)
        }else{
            guard let last = stack.popLast() ,map[c] == last else {
                return false
            }
        }
    }
    

    return stack.count == 0
}


/**
 给定一个只包括 '('，')'的字符串，判断字符串是否有效。注：空字符串属于有效字符串

 示例 1:
 输入: "(())"
 输出: true

  实例 2：
  输入: "())("
 输出: false
 */
func isValid_simple( _ s :String) -> Bool {
     //MARK: 使用计数的方法解决 将栈变成计数问题
    let left :Character = "("
    var count = 0



    for c in s {
        if c == left {
            count += 1
        }else{

            if count == 0 {
                return false
            }
            count -= 1

        }
    }

    return count == 0
}
/**
 32. 最长有效括号
 给定一个只包含 '(' 和 ')' 的字符串，找出最长的包含有效括号的子串的长度。

 示例 1:

 输入: "(()"
 输出: 2
 解释: 最长有效括号子串为 "()"
 示例 2:

 输入: ")()())"
 输出: 4
 解释: 最长有效括号子串为 "()()"
 
 */
func longestValidParentheses(_ s: String) -> Int {
    var maxlength = 0
    let left :Character = "("
    var stack : [Int] = [-1]
    
    
    for (index ,value)  in s.enumerated() {
        if value == left {
            stack.append(index)
        }else{
           _ = stack.popLast()
            if stack.isEmpty {
                stack.append(index)
            }else{
                maxlength = max(maxlength, index-stack.last!)
            }
        }
    }
    
    
    return maxlength
    
}
