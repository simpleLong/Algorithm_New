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

    return buildTreeHelp(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)

}

func buildTreeHelp(_ preOrder : [Int],_ p_start : Int ,_ p_end :Int ,_ inorder: [Int] ,_ in_start:Int ,_ in_end :Int) -> TreeNode? {
    
    if p_start > p_end || in_start > in_end {
        return nil
    }
    
    let rootValue = preOrder[p_start]
    var rootIndex = -1
    for i  in in_start...in_end {
        if inorder[i] == rootValue {
            rootIndex = i
        }
    }
    let rootNode = TreeNode(rootValue)
    let leftLength = rootIndex - in_start
    
    let leftNode = buildTreeHelp(preOrder, p_start + 1, p_start + leftLength, inorder, in_start , rootIndex - 1)
    let rightNode = buildTreeHelp(preOrder, p_start + 1 + leftLength, p_end, inorder, rootIndex + 1, in_end)
    rootNode.left = leftNode
    rootNode.right = rightNode

    
    return rootNode

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
    
    if inorder.count == 0 || postorder.count == 0 {
        return nil
    }
    
    return buildTreeHelp_1(inorder, 0, inorder.count - 1, postorder, 0, postorder.count - 1)

}

func buildTreeHelp_1(_ inorder: [Int] ,_ in_start: Int ,_ in_end: Int ,_ postorder: [Int], _ p_start : Int ,_ p_end : Int) -> TreeNode? {
    
    if in_start > in_end || p_start > p_end || in_start < 0 || p_start < 0{
        return nil
    }
    let rootValue = postorder[p_end]
    let rootNode = TreeNode(rootValue)
    
    var rootIndex = 0
    
    for i  in in_start...in_end {
        if inorder[i] == rootValue {
            rootIndex = i
            break
        }
    }
    let leftlength = rootIndex - in_start
    
    
    let left = buildTreeHelp_1(inorder, in_start, rootIndex - 1, postorder, p_start , p_start + leftlength - 1)
    let right = buildTreeHelp_1(inorder, rootIndex + 1, in_end, postorder, p_start + leftlength, p_end-1)
    
    rootNode.left = left
    rootNode.right = right

    return rootNode
    
}

/**
 
 给定一棵二叉树，返回所有重复的子树。对于同一类的重复子树，你只需要返回其中任意一棵的根结点即可。

 两棵树重复是指它们具有相同的结构以及相同的结点值。

 示例 1：

         1
        / \
       2   3
      /   / \
     4   2   4
        /
       4
 下面是两个重复的子树：

       2
      /
     4
 和

     4
 因此，你需要以列表的形式返回上述重复子树的根结点。
 */
var dupNodes : [TreeNode] = []
var nodeMap : [String : Int] = [:]
func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {

    guard let root = root else { return [nil] }
    _ = traverse(root)
    return dupNodes
}

func traverse(_ node : TreeNode?) -> String {

    guard let node = node else {
        return "#"
    }
    let left = traverse(node.left)
    let right = traverse(node.right)
    
    let strRes =  left + "," + right + "," + String(node.val)
    
    if let count = nodeMap[strRes] {
        nodeMap[strRes] = count + 1
    }else {
        nodeMap[strRes] = 1
    }
    if nodeMap[strRes] == 2 {
        dupNodes.append(node)
    }
    return strRes
}
