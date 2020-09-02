//
//  ListNode.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/26.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

public class ListNode : Equatable{
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
     
        var lhs = lhs
        var rhs = rhs
        return equal(&lhs, &rhs)
    }
    
    
    public var val :Int
    public var next :ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static func equal(_ lptr: UnsafeRawPointer , _ rptr: UnsafeRawPointer) -> Bool {
        let lHeapPtr = UnsafeRawPointer(bitPattern: lptr.load(as: UInt.self))
        let rHeapPtr = UnsafeRawPointer(bitPattern: rptr.load(as: UInt.self))
        
        return lHeapPtr == rHeapPtr
        
        
    }
}
let node1  =  ListNode.init(1)
let node2  =  ListNode.init(2)
let node3  =  ListNode.init(3)
let node4  =  ListNode.init(4)
let node5  =  ListNode.init(5)


