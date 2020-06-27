//
//  Merge.swift
//  Algorithm
//
//  Created by longxd on 2020/6/25.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 88. 合并两个有序数组
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

  

 说明:

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
  

 示例:

 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 输出: [1,2,2,3,5,6]
 */
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
     
     if m == 0 {
         nums1 = nums2
         return
     }
     if n == 0 {
         return
     }
     
     var nums1Index = m - 1 //第一个数组的index
     var nums2Index = n - 1 //第二个数组的index
     var resultNumIndex = m + n - 1 //最后结合数组的index
     
     while nums1Index >= 0 && nums2Index >= 0 {
         
         if nums1[nums1Index] >= nums2[nums2Index] {
             nums1[resultNumIndex] = nums1[nums1Index]
             nums1Index -= 1
         }else {
             nums1[resultNumIndex] = nums2[nums2Index]
             
             nums2Index -= 1
         }
        resultNumIndex -= 1
     }
     while nums2Index >= 0 {
         nums1[resultNumIndex] = nums2[nums2Index]
         resultNumIndex -= 1
         nums2Index -= 1
     }
}
