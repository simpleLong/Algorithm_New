//
//  Anagram.swift
//  Algorithm
//
//  Created by longxd on 2020/6/27.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

/**
 242. 有效的字母异位词
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
 
 示例 1:
 
 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:
 
 输入: s = "rat", t = "car"
 输出: false
 说明:
 你可以假设字符串只包含小写字母。
 
 进阶:
 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
 
 
 */
// MARK: -用数组代替hash表
public  func isAnagram(_ s: String, _ t: String) -> Bool {
    
    if s.count != t.count {
        return false
    }
    var array = [Int].init(repeating: 0, count: 26)
    let tArray = Array(t)
    
    for (index ,value) in s.enumerated() {
        array[Int(value.asciiValue!)-97] += 1
        array[Int(tArray[index].asciiValue!)-97] -= 1
    }
    
    return array == [Int].init(repeating: 0, count: 26)
    
}
/**
 49. 字母异位词分组
 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
 
 示例:
 
 输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
 输出:
 [
 ["ate","eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 说明：
 
 所有输入均为小写字母。
 不考虑答案输出的顺序。
 
 */
func hashValue(_ str: String) -> UInt64 {
     var hash: UInt64 = 0
     for code in str.unicodeScalars {
         let value = code.value - 97
         hash += UInt64(pow(5.0, Double(value)))
     }

     return hash
 }

 func groupAnagrams(_ strs: [String]) -> [[String]] {
     var dic = [UInt64 : [String]]()
     for str in strs {
         let hash = hashValue(str)
         if let strings = dic[hash] {
             dic[hash] = strings + [str]
         } else {
             dic[hash] = [str]
         }
     }
     return Array(dic.values)
 }
