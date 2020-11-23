//
//  Queue.swift
//  Algorithm
//
//  Created by longxd on 2020/8/17.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

class MonotonicQueue <T :Comparable> {
    var data = [T]()
    
    func push(_ n : T) {
        while !self.data.isEmpty && self.data.last! < n {
           _ = self.data.popLast()
        }
        self.data.append(n)
    }
    func max() -> T? {
        guard let first = self.data.first else {
            return nil
        }
        return first
    }
    func pop(_ n: T) {
        guard  self.data.first == n else {
            return
        }
        data.remove(at: 0)
    }
    
}
// MARK: -解题思路使用一个单调递减的队列,顶部为最大值
public  func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
     if k > nums.count {
         return []
     }
     
     var result = [Int]()
     
    let biDirectionalQueue = MonotonicQueue<Int>()
     
    for (i ,value) in nums.enumerated() {
         

        if i < k - 1 {
            biDirectionalQueue.push(value)
        }else{
            
            biDirectionalQueue.push(value)
            result.append(biDirectionalQueue.max()!)
            biDirectionalQueue.pop(value)
        }
     }
     
     return result
 }
