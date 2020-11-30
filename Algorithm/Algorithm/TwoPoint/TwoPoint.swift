//
//  TwoPoint.swift
//  Algorithm
//
//  Created by longxd on 2020/11/12.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 3. 无重复字符的最长子串
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 
 
 */
func lengthOfLongestSubstring(_ s: String) -> Int {

    var leftIndex = 0

    var maxLength = 0
    var dict : [Character: Int] = [:]
    
    for (index ,value) in s.enumerated() {

        if let tempIndex = dict[value],tempIndex >= leftIndex {
            leftIndex = tempIndex + 1
        }
        maxLength = max(maxLength,index - leftIndex + 1)
        dict[value] = index
    }

    return maxLength
    
}
/**
 5. 最长回文子串
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：

 输入: "cbbd"
 输出: "bb"
 */
var maxStr = ""
func longestPalindrome(_ s: String) -> String {
    
    //help(<#T##s: Array<Character>##Array<Character>#>, <#T##left: Int##Int#>, <#T##right: Int##Int#>)
    let array = Array(s)
    
    for i  in 0..<s.count {
        help(array, i, i)
        if i+1 < s.count {
        help(array, i, i+1)
        }
        
        
        //maxStr = max(help(array, i, i).count, help(array, i, i+1).count)
    }
    return maxStr
}

private func help (_ s :Array<Character> ,_ left : Int ,_ right : Int) {
 
    var left = left
    var right = right
    while left >= 0 && right <= s.count - 1 && s[left] == s[right] {
        left -= 1
        right += 1
    }
    if  left+1 <= right-1 &&  String.init(s[left+1...right-1]).count > s.count  {
        maxStr = String.init(s[left+1...right-1])
    }

}

func decimalToHexadecimal(num :Int) -> String {
    
    var res = ""
    var num = num
    while num >= 16 {
        let tmp = num%16
        res = numToString(tmp) + res
        num = num/16
        
    }
    if num != 0 {
        res = numToString(num) + res
    }

    return res
    
}

func numToString(_ num : Int) -> String {
    let dict : [Int :String] = [10:"A",11:"B",12:"C",13:"D",14:"E",15:"F"]
    
    
    if num < 10 {
        return String(num)
    }else{
        return dict[num]!
    }
    
}
