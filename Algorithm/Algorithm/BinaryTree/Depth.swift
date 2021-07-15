//
//  Depth.swift
//  Algorithm
//
//  Created by longxd on 2020/11/30.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 111. 二叉树的最小深度
 给定一个二叉树，找出其最小深度。

 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

 说明：叶子节点是指没有子节点的节点。

  

 示例 1：


 输入：root = [3,9,20,null,null,15,7]
 输出：2
 示例 2：

 输入：root = [2,null,3,null,4,null,5,null,6]
 输出：5

 */
func minDepth(_ root: TreeNode?) -> Int {


    guard let root = root else {
        return 0
    }
    
    if root.left == nil && root.right == nil {
        return 1
    }

    
    let left = minDepth(root.left)
    let right = minDepth(root.right)
    
    if root.left == nil || root.right == nil {
        return left + right + 1
    }
    
    return min(left, right) + 1
    
    
    
}

/**
 104. 二叉树的最大深度
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。
 
 */
func maxDepth(_ root: TreeNode?) -> Int {
    
    if root == nil {
        return 0
    }
    let left = maxDepth(root?.left)
    let right = maxDepth(root?.right)
    
    return max(left,right) + 1
    
    
}
