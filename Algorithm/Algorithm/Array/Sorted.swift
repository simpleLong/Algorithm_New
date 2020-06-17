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
 75. 颜色分类
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

 注意:
 不能使用代码库中的排序函数来解决这道题。

 示例:

 输入: [2,0,2,1,1,0]
 输出: [0,0,1,1,2,2]
 进阶：

 一个直观的解决方案是使用计数排序的两趟扫描算法。
 首先，迭代计算出0、1 和 2 元素的个数，然后按照0、1、2的排序，重写当前数组。
 你能想出一个仅使用常数空间的一趟扫描算法吗？
 */
public func sortColors(_ nums: inout [Int]) {
    
    var p2 = nums.count-1 ,p0 = 0,curr = 0

    while curr <= p2 {
        if nums[curr] == 1 {
            curr += 1
        }else if nums[curr] == 2 {
            (nums[curr],nums[p2]) = (nums[p2],nums[curr])

            p2 -= 1
        }else if nums[curr] == 0 {
            (nums[curr],nums[p0]) = (nums[p0],nums[curr])
            curr += 1
            p0 += 1
        }
    }

}
/**
 220. 存在重复元素 III
 在整数数组 nums 中，是否存在两个下标 i 和 j，使得 nums [i] 和 nums [j] 的差的绝对值小于等于 t ，且满足 i 和 j 的差的绝对值也小于等于 ķ 。

 如果存在则返回 true，不存在返回 false。

  

 示例 1:

 输入: nums = [1,2,3,1], k = 3, t = 0
 输出: true
 示例 2:

 输入: nums = [1,0,1,1], k = 1, t = 2
 输出: true
 示例 3:

 输入: nums = [1,5,9,1,5,9], k = 2, t = 3
 输出: false
 */
func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {

    var set:Set<Int> = []
    
    for (index ,value) in nums.enumerated() {
        if t == 0 {
            if set.contains(value) {
                return true
            }
        }else {
            if set.contains(where: {abs($0 - value) <= t}) {
                return true
            }
        }
        set.insert(value)
        if index >= k {
            set.remove(nums[index-k])
        }
    }
    return false
}
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
   func isAnagram(_ s: String, _ t: String) -> Bool {

    if s.count != t.count {
        return false
    }
    var array = [Int](repeating: 0, count: 26)
    let tArray = Array(t)
    for (i,value) in s.enumerated() {
        array[Int(value.asciiValue!)-97] += 1
        array[Int(tArray[i].asciiValue!)-97] -= 1
    }
    
    
      return array == [Int](repeating: 0, count: 26)
   }
/**
 315. 计算右侧小于当前元素的个数
 给定一个整数数组 nums，按要求返回一个新数组 counts。数组 counts 有该性质： counts[i] 的值是  nums[i] 右侧小于 nums[i] 的元素的数量。

 示例:

 输入: [5,2,6,1]
 输出: [2,1,1,0]
 解释:
 5 的右侧有 2 个更小的元素 (2 和 1).
 2 的右侧仅有 1 个更小的元素 (1).
 6 的右侧有 1 个更小的元素 (1).
 1 的右侧有 0 个更小的元素.
 */
