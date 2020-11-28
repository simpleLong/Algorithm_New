//
//  ConstructTree.swift
//  Algorithm
//
//  Created by longxd on 2020/11/11.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 654. 最大二叉树
 给定一个不含重复元素的整数数组。一个以此数组构建的最大二叉树定义如下：

 二叉树的根是数组中的最大元素。
 左子树是通过数组中最大值左边部分构造出的最大二叉树。
 右子树是通过数组中最大值右边部分构造出的最大二叉树。
 通过给定的数组构建最大二叉树，并且输出这个树的根节点。

  

 示例 ：

 输入：[3,2,1,6,0,5]
 输出：返回下面这棵树的根节点：

       6
     /   \
    3     5
     \    /
      2  0
        \
         1
 
 */
func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
    if nums.count == 0 {
        return nil
    }
    return auxiliary(nums,0,nums.count-1)
}

func auxiliary(_ nums: [Int] ,_ left : Int , _ right: Int) -> TreeNode? {

    if left < 0 || left > right || right > (nums.count + 1) {
        return nil
    }
    var max = Int.min
    var index = -1
    

    for i  in left...right {
        if max < nums[i]  {
            max = nums[i]
            index = i
        }
    }
    let root = TreeNode(max)
    
    let left = auxiliary(nums,left,index-1)
    let right = auxiliary(nums,index+1,right)
    root.left = left
    root.right = right
    
    return root
    
}
