//
//  Queue.swift
//  Algorithm
//
//  Created by longxd on 2020/8/17.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

/**
 239. 滑动窗口最大值
 给定一个数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回滑动窗口中的最大值。

  

 进阶：

 你能在线性时间复杂度内解决此题吗？

  

 示例:

 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 输出: [3,3,5,5,6,7]
 解释:

   滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
  

 提示：

 1 <= nums.length <= 10^5
 -10^4 <= nums[i] <= 10^4
 1 <= k <= nums.length
 通过次数91,066提交次数185,666
 */

class MonotonicQueue <T :Comparable> {
    var data = [T]()
    
    func max() -> T? {
        guard let first = data.first else {
            return nil
        }
        return first
    }
    
    func push(_ n: T) {
        while !self.data.isEmpty && self.data.last! < n {
           _ = self.data.popLast()
        }
        
        self.data.append(n)
    }
    
    func pop(_ n: T) {
        if self.data.first == n {
            self.data.remove(at: 0)
        }
    }
    
    
}
// MARK: -解题思路使用一个单调递减的队列,顶部为最大值
public  func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

    var res = [Int]()
    let queue = MonotonicQueue<Int>.init()
    
    for i  in 0..<nums.count {
        if i < k - 1 {
            queue.push(nums[i])
        }else{
            queue.push(nums[i])
            res.append(queue.max()!)
            queue.pop(nums[i - (k - 1)])
        }
    }
    
    return res
 }
