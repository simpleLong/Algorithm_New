//
//  Valid.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/30.
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
    
    let dic : [Character :Character] = ["(":")","{":"}","[":"]"]
     var stack : [Character] = []
     
     for item in s {
         if dic[item] != nil {
             stack.append(item)

         }else if  stack == [] ||  item != dic[stack.popLast()!] {

             return false
         }
     }
     
     return stack.isEmpty
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
//s = "( ) ) ( ( ) )"
func longestValidParentheses(_ s: String) -> Int {
var maxlength = 0 ,left = 0 ,right = 0
    let leftC :Character = "("
    let sArray = Array(s)
    
    
    
    
    for c  in s {
        if c == leftC {
            left += 1
        }else{
            right += 1
        }
        if left == right {
            maxlength = max(maxlength, 2*right)
        }
        if right > left {
            left = 0
            right = 0
        }
    }
    
    for c  in s.reversed() {
        if c == leftC {
            left += 1
        }else{
            right += 1
        }
        if left == right {
            maxlength = max(maxlength, 2*left)
        }
        if left > right {
            left = 0
            right = 0
        }
    }


return maxlength
}
