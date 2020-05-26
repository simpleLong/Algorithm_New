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
public func isValidBST(_ root: TreeNode?) -> Bool {

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

/**
 235. 二叉搜索树的最近公共祖先
 给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]



  

 示例 1:

 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
 输出: 6
 解释: 节点 2 和节点 8 的最近公共祖先是 6。
 示例 2:

 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
 输出: 2
 解释: 节点 2 和节点 4 的最近公共祖先是 2, 因为根据定义最近公共祖先节点可以为节点本身。
  

 说明:

 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉搜索树中。
 
 
 */
public  func lowestCommonAncestor(root: TreeNode ,p : TreeNode ,q :TreeNode) -> TreeNode {

    
    if p.val > root.val && q.val > root.val {
        return lowestCommonAncestor(root: root.right!, p: p, q: q)
    }else if p.val < root.val  && q.val < root.val {
        return lowestCommonAncestor(root: root.left!, p: p, q: q)
    }else{
        return root
    }
    
    
}
 //MARK: 普通二叉树
/**
 算法
 (递归) O(n)O(n)

 当我们用递归去做这个题时不要被题目误导，应该要明确一点
 这个函数的功能有三个：给定两个节点 pp 和 qq

 如果 pp 和 qq 都存在，则返回它们的公共祖先；
 如果只存在一个，则返回存在的一个；
 如果 pp 和 qq 都不存在，则返回NULL
 本题说给定的两个节点都存在，那自然还是能用上面的函数来解决

 具体思路：
 （1） 如果当前结点 rootroot 等于 NULL，则直接返回 NULL
 （2） 如果 rootroot 等于 pp 或者 qq ，那这棵树一定返回 pp 或者 qq
 （3） 然后递归左右子树，因为是递归，使用函数后可认为左右子树已经算出结果，用 leftleft 和 rightright 表示
 （4） 此时若leftleft为空，那最终结果只要看 rightright；若 rightright 为空，那最终结果只要看 leftleft
 （5） 如果 leftleft 和 rightright 都非空，因为只给了 pp 和 qq 两个结点，都非空，说明一边一个，因此 rootroot 是他们的最近公共祖先
 （6） 如果 leftleft 和 rightright 都为空，则返回空（其实已经包含在前面的情况中了）

 时间复杂度是 O(n)O(n)：每个结点最多遍历一次或用主定理，空间复杂度是 O(n)O(n)：需要系统栈空间

 */
public  func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {

    guard let root = root else {
        return nil
    }
    if root.val == p?.val || root.val == q?.val {
        return root
    }
    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)
    
    if left == nil {
        return right
    }
    if right == nil {
        return left
    }
    
    if left != nil && right != nil {
        return root
    }
    
    return nil

    
}
