//
//  BST.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/22.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 98. 验证二叉搜索树
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。

 假设一个二叉搜索树具有如下特征：

 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 示例 1:

 输入:
     2
    / \
   1   3
 输出: true
 示例 2:

 输入:
     5
    / \
   1   4
      / \
     3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。
 */
func isValidBST(_ root: TreeNode?) -> Bool {

    guard let root = root else {
        return true
    }
    
    return validNode(node: root.left, min: Int.min, max: root.val) && validNode(node: root.right, min: root.val, max: Int.max)
}

func validNode(node :TreeNode? ,min :Int ,max :Int) -> Bool {

    guard let node = node  else {
        return  true
    }
    if node.val < min || node.val > max {
        return false
    }
    
    return validNode(node: node.left, min: min, max: node.val) && validNode(node: node.right, min: node.val, max: max)
}
