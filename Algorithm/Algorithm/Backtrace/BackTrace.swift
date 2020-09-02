//
//  BackTrace.swift
//  Algorithm
//
//  Created by longxd on 2020/8/15.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

/**
 78. 子集
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

 说明：解集不能包含重复的子集。

 示例:

 输入: nums = [1,2,3]
 输出:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]
 */
func subsets(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    func  helper(_ index: Int , tempNum : [Int]){
        if index == nums.count{
            res.append(tempNum)
            return
        }
        helper(index+1, tempNum: tempNum)
        var tempNum = tempNum
        tempNum.append(nums[index])
        helper(index+1, tempNum: tempNum)
        
    }
    helper(0, tempNum: [Int]())
    return res
    
}
/**
 46. 全排列
 给定一个 没有重复 数字的序列，返回其所有可能的全排列。

 示例:

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]
 */
func permute(_ nums: [Int]) -> [[Int]] {
    
    var res  = [[Int]]()
    var nums = nums
    
    
    func helper( _ first : Int ) {
        if first == nums.count {
            res.append(nums)
            return
        }
        if first > nums.count {
            return
        }
        
        for  i  in first..<nums.count {
            nums.swapAt(i, first)
            helper(first+1)
            nums.swapAt(i, first)

        }
        
    }
    helper(0)
    return res
}
/**
 77. 组合
 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。

 示例:

 输入: n = 4, k = 2
 输出:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]
 
 */
var res = [[Int]]()
public func combine(_ n: Int, _ k: Int) -> [[Int]] {
    
    if n <= 0 || k <= 0 {
        return [[Int]]()
    }
    var subRes = [Int]()
    
    backtrack(n: n, k: k, start: 1, subRes: &subRes)
    return res

    
}

func backtrack(n :Int ,k :Int ,start :Int , subRes: inout [Int]) {


    if subRes.count == k  {
        res.append(subRes)
        return
    }
    if start > n {
        return
    }
    for i  in start...n {
        subRes.append(i)
        backtrack(n: n, k: k, start: i+1, subRes: &subRes)
        _ = subRes.popLast()
    }
}
/**
 N 皇后
 n 皇后问题研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。



 上图为 8 皇后问题的一种解法。

 给定一个整数 n，返回所有不同的 n 皇后问题的解决方案。

 每一种解法包含一个明确的 n 皇后问题的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。

 示例:

 输入: 4
 输出: [
  [".Q..",  // 解法 1
   "...Q",
   "Q...",
   "..Q."],

  ["..Q.",  // 解法 2
   "Q...",
   "...Q",
   ".Q.."]
 ]
 解释: 4 皇后问题存在两个不同的解法。
 
 */
var queensRes = [Int]()
var boards :Int!
var lastResult = [[String]]()

public   func solveNQueens(_ n: Int) -> [[String]] {
    
    boards = n
    queensRes = [Int].init(repeating: 0, count: n)
    nQueen(row: 0)
    
    
    
    return lastResult
    
}

func nQueen(row:Int) -> Void {
    if row >= boards {
        lastResult.append(traslateResult(intList: queensRes))
        return
    }
    for column in 0..<boards {
        if isValid(column: column, row: row) {
            queensRes[row] = column
            nQueen(row: row+1)
        }
    }
}

func isValid(column :Int ,row :Int) -> Bool {
    for i  in 0..<row {
        if queensRes[i] == column || row - i == abs(column - queensRes[i]) {
            return false
        }

    }

    return true
}
func traslateResult (intList : [Int]) -> [String] {

    var res = [String]()
    
    
    for value  in intList {

        var temp = [Character].init(repeating: ".", count: boards)
        temp[value] = "Q"
        
        res.append(String.init(temp))
    }
    
    return res
    
}
