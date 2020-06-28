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
/**
 283. 移动零
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:

 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 */
 public func moveZeroes(_ nums: inout [Int]) {
//    var i = 0
//    for value in nums {
//        if value != 0 {
//            nums[i] = value
//            i += 1
//        }
//    }
//    for j in i..<nums.count {
//        nums[j] = 0
//    }
    var lastNonZeroFoundAt = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            nums.swapAt(lastNonZeroFoundAt, i)
            lastNonZeroFoundAt += 1
            
        }
    }
    
}
/**
 852. 山脉数组的峰顶索引
 我们把符合下列属性的数组 A 称作山脉：

 A.length >= 3
 存在 0 < i < A.length - 1 使得A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1]
 给定一个确定为山脉的数组，返回任何满足 A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1] 的 i 的值。

  

 示例 1：

 输入：[0,1,0]
 输出：1
 示例 2：

 输入：[0,2,1,0]
 输出：1
  

 提示：

 3 <= A.length <= 10000
 0 <= A[i] <= 10^6
 A 是如上定义的山脉
 
 */
// MARK: -二分法
public  func peakIndexInMountainArray(_ A: [Int]) -> Int {
    
    var l  = 0 ,r = A.count - 1 ,m = 0
    while l < r  {
        m = l + (r-l)/2
        if A[m] < A[m+1] {
            l = m+1
        }else{
            r = m
        }
        
    }
    
    return l
}
/**
 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：

 每行中的整数从左到右按升序排列。
 每行的第一个整数大于前一行的最后一个整数。
 示例 1:

 输入:
 matrix = [
   [1,   3,  5,  7],
   [10, 11, 16, 20],
   [23, 30, 34, 50]
 ]
 target = 3
 输出: true
 示例 2:

 输入:
 matrix = [
   [1,   3,  5,  7],
   [10, 11, 16, 20],
   [23, 30, 34, 50]
 ]
 target = 13
 输出: false
 
 */
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    
    let m = matrix.count
    if m == 0 {
        return false
    }
    let n  = matrix[0].count
    if n == 0 {
        return false
    }
    
    var left = 0 ,right = m * n - 1 ,pivotidx = 0 ,pivotElement = 0
    while left <= right {
        pivotidx = left + (right - left)/2
        pivotElement = matrix[pivotidx / n][pivotidx % n]
        if pivotElement == target {
            return true
        }else {
            if target < pivotElement {
                right = pivotidx - 1
            }else{
                left = pivotidx + 1
            }
        }
    }

    return false
}
