//
//  Rob.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/25.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 337. 打家劫舍 III
 在上次打劫完一条街道之后和一圈房屋后，小偷又发现了一个新的可行窃的地区。这个地区只有一个入口，我们称之为“根”。 除了“根”之外，每栋房子有且只有一个“父“房子与之相连。一番侦察之后，聪明的小偷意识到“这个地方的所有房屋的排列类似于一棵二叉树”。 如果两个直接相连的房子在同一天晚上被打劫，房屋将自动报警。

 计算在不触动警报的情况下，小偷一晚能够盗取的最高金额。

 示例 1:

 输入: [3,2,3,null,3,null,1]

      3
     / \
    2   3
     \   \
      3   1

 输出: 7
 解释: 小偷一晚能够盗取的最高金额 = 3 + 3 + 1 = 7.
 示例 2:

 输入: [3,4,5,1,3,null,1]

      3
     / \
    4   5
   / \   \
  1   3   1

 输出: 9
 解释: 小偷一晚能够盗取的最高金额 = 4 + 5 = 9.
 
 */
func rob(_ root: TreeNode?) -> Int {
     //MARK: 递归解法(效率低)
//    guard let root = root else {
//        return 0
//    }
//    var money = root.val
//
//    if root.left != nil {
//        money += rob(root.left?.left) + rob(root.left?.right)
//    }
//    if root.right != nil {
//        money +=  rob(root.right?.left) +  rob(root.right?.right)
//    }
//
//    return max(money, rob(root.left)+rob(root.right))
     //MARK: 动态规划
    let res = robInternal(root: root)
    
    return max(res.0, res.1)
}

func robInternal(root : TreeNode?) -> (Int ,Int) {

    var res = (0,0)//(.0代表不偷,.1代表的是偷)
    
    guard let root = root else {
        return res
    }
    let left = robInternal(root: root.left)
    let right = robInternal(root: root.right)
    
    res.0 = max(left.0, left.1) + max(right.0, right.1)
    res.1 = left.0 + right.0 + root.val
    
    
    
    return res
}
/**
 198. 打家劫舍
 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

 给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。

  

 示例 1：

 输入：[1,2,3,1]
 输出：4
 解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
      偷窃到的最高金额 = 1 + 3 = 4 。
 示例 2：

 输入：[2,7,9,3,1]
 输出：12
 解释：偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
      偷窃到的最高金额 = 2 + 9 + 1 = 12 。
 
 */
func rob(_ nums: [Int]) -> Int {
    let n  = nums.count
    
    if n == 0 {
        return 0
    }
    

    var dp = Array<Int>.init(repeating: 0, count: n)
    for i  in 0..<n {

        if i == 0 {
            dp[0] = nums[0]
        }else if i == 1{
            dp[1] = max(dp[0], nums[1])
        }else {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i])
        }
    }
    
    return dp[n-1]
    
}
