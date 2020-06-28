//
//  BuildTree.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/24.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 105. 从前序与中序遍历序列构造二叉树
 根据一棵树的前序遍历与中序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7
 */
var map : [Int : Int] = [:]
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    
    
    
    for (index , value) in inorder.enumerated() {
        map[value] = index
    }
    
    
    return buildTreeHelp(preOrder: preorder, p_start: 0, p_end: preorder.count, inorder: inorder, in_start: 0, in_end: inorder.count)
}

func buildTreeHelp(preOrder : [Int],p_start : Int ,p_end :Int ,inorder: [Int] ,in_start:Int ,in_end :Int) -> TreeNode? {
    if p_start == p_end {
        return nil
    }
    
    let root_val = preOrder[p_start]
    
    let root = TreeNode.init(root_val)
    
    guard  let i_root_index = map[root_val] else {
        return nil
    }

    let leftNum = i_root_index - in_start
    
    root.left = buildTreeHelp(preOrder: preOrder, p_start: p_start+1, p_end: p_start+leftNum+1, inorder: inorder, in_start: in_start, in_end: i_root_index)
    root.right = buildTreeHelp(preOrder: preOrder, p_start: p_start+leftNum+1, p_end: p_end, inorder: inorder, in_start: i_root_index+1, in_end: in_end)
    
    return root
    
}
/**
 106. 从中序与后序遍历序列构造二叉树
 根据一棵树的中序遍历与后序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 中序遍历 inorder = [9,3,15,20,7]
 后序遍历 postorder = [9,15,7,20,3]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7
 
 */
func buildTree_1(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    
    return nil
}
