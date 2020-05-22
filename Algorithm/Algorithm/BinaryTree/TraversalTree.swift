//
//  TraversalTree.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/22.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 94. 二叉树的中序遍历
 给定一个二叉树，返回它的中序 遍历。

 示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,3,2]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 
 */
public  func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var cur = root
    
    while cur != nil || !stack.isEmpty {
        while cur != nil {
            stack.append(cur!)
            cur = cur?.left
        }
        
        if let node = stack.popLast() {
            res.append(node.val)
            cur = node.right
        }
    }
    
    return res
    
}
/**
 144. 二叉树的前序遍历
 给定一个二叉树，返回它的 前序 遍历。

  示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 */
public func preorderTraversal(_ root : TreeNode?) -> [Int] {

    var res = [Int]()
    guard let root = root else {
        return res
    }

    var stack = [TreeNode]()
    stack.append(root)
    while !stack.isEmpty  {
        
        if let node = stack.popLast() {
            res.append(node.val)
            if let right = node.right {
                stack.append(right)
            }
            
            if let left = node.left {
                stack.append(left)
            }
        }
        
    }
    
    return res
    
}
/**
 145. 二叉树的后序遍历
 给定一个二叉树，返回它的 后序 遍历。

 示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [3,2,1]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 */
func postorderTraversal(_ root: TreeNode?) -> [Int] {

    var res = [Int]()
    
    guard let root = root else {
        return res
    }
    var stackin = [root]

    while !stackin.isEmpty {

        if let node = stackin.popLast() {
            if let left = node.left {
                stackin.append(left)
            }
            if let right = node.right {
                stackin.append(right)
            }
            res.append(node.val)
        }
        
    }
    
    return res.reversed()
    
    
}
