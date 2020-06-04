//
//  Squares.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/4.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 977. 有序数组的平方
 给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。

  

 示例 1：

 输入：[-4,-1,0,3,10]
 输出：[0,1,9,16,100]
 示例 2：

 输入：[-7,-3,2,3,11]
 输出：[4,9,9,49,121]
  

 提示：

 1 <= A.length <= 10000
 -10000 <= A[i] <= 10000
 A 已按非递减顺序排序。
 
 
 */
public func sortedSquares(_ A: [Int]) -> [Int] {//双指针
    var res =  [Int]()
    var j = 0
    let n = A.count
    
    while j < n && A[j] < 0 {
        j += 1
    }
    var i = j - 1
    
    while i >= 0 && j < n {
        if A[i]*A[i] < A[j]*A[j] {
            res.append(A[i]*A[i])
            i -= 1
        }else{
            res.append(A[j]*A[j])
            j += 1
        }
    }
    while  i >= 0 {
        res.append(A[i]*A[i])
        i -= 1
    }
    
    while j < n {
        res.append(A[j]*A[j])
        j += 1
    }
    
    return res
    
}
/**
 905. 按奇偶排序数组
 给定一个非负整数数组 A，返回一个数组，在该数组中， A 的所有偶数元素之后跟着所有奇数元素。

 你可以返回满足此条件的任何数组作为答案。

  

 示例：

 输入：[3,1,2,4]
 输出：[2,4,3,1]
 输出 [4,2,3,1]，[2,4,1,3] 和 [4,2,1,3] 也会被接受。
  

 提示：

 1 <= A.length <= 5000
 0 <= A[i] <= 5000
 */
public  func sortArrayByParity(_ A: [Int]) -> [Int] {
    var A  = A
    
    let n = A.count
    
    var i = 0
    var j = n-1
    
    while i < j {


        if A[i]%2 != 0 && A[j]%2 == 0 {
            (A[i],A[j]) = (A[j],A[i])
            i += 1
            j -= 1
        }
        if  A[i]%2 == 0 {
            i += 1
        }
        
        if  A[j]%2 != 0  {
            j -= 1
        }
        
    }
    
    return A
}
/**
 922. 按奇偶排序数组 II
 给定一个非负整数数组 A， A 中一半整数是奇数，一半整数是偶数。

 对数组进行排序，以便当 A[i] 为奇数时，i 也是奇数；当 A[i] 为偶数时， i 也是偶数。

 你可以返回任何满足上述条件的数组作为答案。

  

 示例：

 输入：[4,2,5,7]
 输出：[4,5,2,7]
 解释：[4,7,2,5]，[2,5,4,7]，[2,7,4,5] 也会被接受。
  

 提示：

 2 <= A.length <= 20000
 A.length % 2 == 0
 0 <= A[i] <= 1000
 */
func sortArrayByParityII(_ A: [Int]) -> [Int] {
    var res = A
    var j  = 1
    
    for i in stride(from: 0, to: res.count, by: 2) {
        if res[i]%2 != 0 {
            while res[j]%2 != 0 {
                j += 2
            }
            (res[i] ,res[j]) = (res[j],res[i])
        }
    }
    return res
    
}
