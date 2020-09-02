//
//  TreeNode.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/22.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

public class TreeNode :Equatable{
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        var lhs = lhs
        var rhs = rhs
        return equal(&lhs, &rhs)
        
    }
    
    static func equal(_ lptr: UnsafeRawPointer , _ rptr: UnsafeRawPointer) -> Bool {
        let lHeapPtr = UnsafeRawPointer(bitPattern: lptr.load(as: UInt.self))
        let rHeapPtr = UnsafeRawPointer(bitPattern: rptr.load(as: UInt.self))
        
        return lHeapPtr == rHeapPtr
        
        
    }
    
    public var val :Int
    public var count = 0
    public var left :TreeNode?
    public var right :TreeNode?
    
    
    public init(_ val : Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    
}

public class Node {
    public var val :Int
    public var children : [Node]
    
    public init(_ val :Int) {
        self.val = val
        self.children = []
    }
    
}
