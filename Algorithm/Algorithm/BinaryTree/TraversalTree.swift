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

    var res : [Int] = []
    guard let root = root else {
        return res
    }

    var stack : [TreeNode] = [root]
    
    while stack.count != 0 {
        
        if let  node = stack.popLast(){
            res.append(root.val)
            
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

//    var res = [Int]()
//
//    guard let root = root else {
//        return res
//    }
//    var stackin = [root]
//
//    while !stackin.isEmpty {
//
//
//
//        if let node = stackin.popLast() {
//            res.append(node.val)
//            if let left = node.left {
//                stackin.append(left)
//            }
//            if let right = node.right {
//                stackin.append(right)
//            }
//
//        }
//
//    }
//
//    return res.reversed()

    var res = [Int]()
    guard let root = root else {
        return res
    }
    var call : [TreeNode?] = [root]
    while !call.isEmpty {

        if let t  = call.popLast() ,t != nil {
            call.append(t!)
           // let nullptr :TreeNode? = nil
            call.append(nil)
            
            if let right = t!.right {
                call.append(right)
            }
            if let left = t!.left {
                call.append(left)
            }
        }else{
            if let last = call.popLast() {
                res.append(last!.val)
            }
            
        }
        
    }
    return res
    
    
    
    
    
    
    
}
/**
 429. N叉树的层序遍历
 给定一个 N 叉树，返回其节点值的层序遍历。 (即从左到右，逐层遍历)。

 例如，给定一个 3叉树 :

  



  

 返回其层序遍历:

 [
      [1],
      [3,2,4],
      [5,6]
 ]
  

 说明:

 树的深度不会超过 1000。
 树的节点总数不会超过 5000。
 */
func levelOrder(_ root: Node?) -> [[Int]] {
    var res = [[Int]]()
    
    guard let root = root else {
        return res
    }
     //MARK: 使用队列的方法
//    var queue = [root]
//
//    while !queue.isEmpty {
//        let count = queue.count
//        var tmpArray = [Node]()
//        var tmpRes = [Int]()
//
//        for _ in 0..<count {
//            let item = queue.removeFirst()
//            tmpRes.append(item.val)
//            item.children.forEach { (node) in
//                tmpArray.append(node)
//            }
//
//        }
//        res.append(tmpRes)
//        queue = tmpArray
//    }
 //MARK: 使用BFS
     
    func bfs(node : Node? ,level:Int) -> Void {
   
        guard let node = node  else {
            return
        }
        if level == res.count {
            res.append([Int]())
        }
        res[level].append(node.val)
        for item in node.children {
            
            bfs(node: item, level: level+1)
        }
        
    }
    bfs(node: root, level: 0)
    return res
    
}
 //MARK: 二叉树
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var res : [[Int]] = []
    guard let root = root else {
        return res
    }
   // var queue = [root]
    func bfs(node : TreeNode? ,level :Int) -> Void {
        guard let node = node else {
            return
        }
        if res.count == level  {
            res.append([Int]())
        }
        res[level].append(node.val)
        bfs(node: node.left, level: level+1)
        bfs(node: node.right, level: level+1)
        
    }
    bfs(node: root, level: 0)
    
    
    return res
    
}
