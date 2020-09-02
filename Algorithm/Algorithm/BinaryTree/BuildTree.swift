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
var inorderDict : [Int : Int] = [:]
public  func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    
    guard preorder.count > 0, inorder.count > 0 else {
        return nil
    }
    for (index ,value) in inorder.enumerated() {
        inorderDict[value] = index
    }
    return buildTreeHelp(preOrder: preorder, p_start: 0, p_end: preorder.count-1, inorder: inorder, in_start: 0, in_end: inorder.count-1)
}

func buildTreeHelp(preOrder : [Int],p_start : Int ,p_end :Int ,inorder: [Int] ,in_start:Int ,in_end :Int) -> TreeNode? {
    
    if p_start > p_end {
        return nil
    }

    let root =  TreeNode.init(preOrder[p_start])
    
    let inorder_rootIndex = inorderDict[root.val]
    
    let left_num = inorder_rootIndex! - in_start
    
    root.left = buildTreeHelp(preOrder: preOrder, p_start: p_start+1, p_end: p_start+left_num, inorder: inorder, in_start: in_start, in_end: inorder_rootIndex!-1)
    root.right = buildTreeHelp(preOrder: preOrder, p_start: p_start+left_num+1, p_end: p_end, inorder: inorder, in_start: inorder_rootIndex!+1, in_end: in_end)
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
public  func buildTree_1(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    
    guard inorder.count > 0 ,postorder.count > 0 else {
        return nil
    }
    for (i ,value) in inorder.enumerated() {
        inorderDict[value] = i
    }
    return buildTreeHelp(postorder, 0, postorder.count-1, inorder, 0, inorder.count-1)

}
func buildTreeHelp(_ postorder : [Int],_ post_start : Int ,_ post_end :Int ,_ inorder: [Int] ,_ in_start:Int ,_ in_end :Int) -> TreeNode? {
    
    if in_start > in_end || post_start > post_end{
        return nil
    }
    let root = TreeNode.init(postorder[post_end])
    let rootIndex = inorderDict[root.val]

    
    
    root.left = buildTreeHelp(postorder, post_start, post_start+rootIndex!-1-in_start, inorder, in_start, rootIndex!-1)
    root.right = buildTreeHelp(postorder, post_start+rootIndex!-in_start, post_end-1, inorder, rootIndex!+1, in_end)

    return root
}
