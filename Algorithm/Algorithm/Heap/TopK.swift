//
//  TopK.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/5.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 215. 数组中的第K个最大元素
 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

 示例 1:

 输入: [3,2,1,5,6,4] 和 k = 2
 输出: 5
 示例 2:

 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
 输出: 4
 说明:

 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
 */
//public func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
//
//    var heap = Heap.init(array: nums, sort: >)
//    for _ in 0..<k-1 {
//       _ = heap.remove()
//    }
//
//
//
//    return heap.peek()!
//
//
//}

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums
    return randomizedSelect(&nums,0,nums.count-1,k-1)
}

func randomizedPartition(_ array : inout [Int] ,_ low : Int ,_ high : Int) -> Int {
var resIndex = low

let pivotIndex = Int.random(in: low...high)
array.swapAt(pivotIndex, high)
for i  in low...high {
    if array[i] > array[high] {
        array.swapAt(i, resIndex)
        resIndex += 1
    }
}
array.swapAt(high, resIndex)

return resIndex

}

func randomizedSelect(_ array : inout [Int] ,_ low : Int ,_ high : Int,_ k : Int) -> Int {
if low < high {
    let p  = randomizedPartition(&array, low, high)
    
    if p  == k {
        return array[p]
    }else if p > k {
       return randomizedSelect(&array,  low,  p-1,  k)
    }else {
       return  randomizedSelect(&array,  p+1,  high,  k)
    }
    
    
}else{
    return array[low]
}
}
