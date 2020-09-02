//
//  BinarySearchTree.swift
//  Algorithm
//
//  Created by longxd on 2020/8/16.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
 class SearchTreeNode<T:Comparable> {
    
    var val : T
    var left : SearchTreeNode?
    var right :SearchTreeNode?
    var count = 0
    
    init(_ val :T) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func insertSearchNode<T :Comparable>(root: SearchTreeNode<T>? ,node: SearchTreeNode<T> ,ret: inout [Int] ,i :Int) -> SearchTreeNode<T> {
    
    guard let root = root  else {
        return node
    }
    if node.val <= root.val {
        root.count += 1
        root.left = insertSearchNode(root: root.left, node: node, ret: &ret, i: i)
    }else{
               ret[i] += root.count + 1
         root.right = insertSearchNode(root: root.right, node: node, ret: &ret, i: i)
    }
    return root


}

//func countSmaller(_ nums: [Int]) -> [Int] {
//    var res = [Int].init(repeating: 0, count: nums.count)
//    guard let last = nums.last else {
//        return [0]
//    }
//
//    
//    let root = SearchTreeNode.init(last)
//    
//
//    
//    return res
//    
//}
