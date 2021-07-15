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
    
    func helper(_ tmp: [Int],_ index: Int) {
        if index == nums.count {
            res.append(tmp)
            return
        }
        helper(tmp, index + 1)
        var tmp = tmp
        tmp.append(index)
        helper(tmp, index + 1)
        
    }
    
    
    helper([Int](), 0)
    
    
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
    
    var res = [[Int]]()
    var nums = nums
    func help(_ first : Int) {
        if first == nums.count {
            res.append(nums)
            return
        }
        for i  in first..<nums.count {
            nums.swapAt(i, first)
            help(first + 1)
            nums.swapAt(i, first)
        }
    }
    help(0)
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
/**
 22. 括号生成
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 
 
 
 示例：
 
 输入：n = 3
 输出：[
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 
 */
private var allBracket = [String]()
func generateParenthesis(_ n: Int) -> [String] {
    
    genHelp(0, 0, n, "")
    return allBracket
}

private func genHelp(_ left : Int ,_ right: Int , _ n : Int , _ result:  String) {
    if left == n && right == n {
        allBracket.append(result)
    }
    
    if left < n {
        
        genHelp(left + 1, right, n, result + "(")
    }
    if left > right && right < n {
        genHelp(left, right + 1, n, result + ")")
    }
}
/**
 37. 解数独
 编写一个程序，通过填充空格来解决数独问题。
 
 一个数独的解法需遵循如下规则：
 
 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 空白格用 '.' 表示。
 
 
 
 一个数独。
 
 
 
 答案被标成红色。
 
 提示：
 
 给定的数独序列只包含数字 1-9 和字符 '.' 。
 你可以假设给定的数独只有唯一解。
 给定数独永远是 9x9 形式的。
 通过次数63,309提交次数94,762
 
 */

func isvalid( _ value : Int ,_ row :Int ,_ column : Int ,_ board :  [[Int]]) -> Bool {

    for i in 0..<9 {
        if board[row][i] == value || board[i][column] == value {
            return false
        }
        if board[(row/3)*3 + i/3][(column/3)*3 + i%3] == value {
            return false
        }
    }

    return true
}
func solveSudoku(_ board: inout [[Character]]) {
    
    var boardInt = Array<Array<Int>>.init(repeating: Array<Int>.init(repeating: 0, count: board[0].count), count: board.count)
    for (i,row) in board.enumerated() {
        for (j ,column) in row.enumerated() {
            if column != "." {
                boardInt[i][j] = Int(column.asciiValue!-48)
            }
        }
    }
   _ = backtrace(0, 0, &boardInt)
    for (i ,row) in boardInt.enumerated() {
        for (j ,column) in row.enumerated() {
            board[i][j] = Character(UnicodeScalar(column+48)!)
        }
    }

}

func backtrace(_ row :Int ,_ column : Int ,_ boardInt : inout [[Int]]) -> Bool{
    
    if row > 8  {
        return true
    }
    
    if column > 8 {
        return backtrace(row + 1, 0, &boardInt)
    }
    
    
    if boardInt[row][column] == 0 {
        for value in 1...9 {
            if isvalid(value, row, column, boardInt) {
                
                boardInt[row][column] = value

                if backtrace(row, column + 1, &boardInt) {
                    return true
                    
                }
                boardInt[row][column] = 0

            }
        }
        return false
    }else{

        return  backtrace(row, column + 1, &boardInt)
    }
    
}

