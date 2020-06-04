//
//  Island.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/4.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

/**
 695. 岛屿的最大面积
 给定一个包含了一些 0 和 1 的非空二维数组 grid 。

 一个 岛屿 是由一些相邻的 1 (代表土地) 构成的组合，这里的「相邻」要求两个 1 必须在水平或者竖直方向上相邻。你可以假设 grid 的四个边缘都被 0（代表水）包围着。

 找到给定的二维数组中最大的岛屿面积。(如果没有岛屿，则返回面积为 0 。)

  

 示例 1:

 [[0,0,1,0,0,0,0,1,0,0,0,0,0],
  [0,0,0,0,0,0,0,1,1,1,0,0,0],
  [0,1,1,0,1,0,0,0,0,0,0,0,0],
  [0,1,0,0,1,1,0,0,1,0,1,0,0],
  [0,1,0,0,1,1,0,0,1,1,1,0,0],
  [0,0,0,0,0,0,0,0,0,0,1,0,0],
  [0,0,0,0,0,0,0,1,1,1,0,0,0],
  [0,0,0,0,0,0,0,1,1,0,0,0,0]]
 对于上面这个给定矩阵应返回 6。注意答案不应该是 11 ，因为岛屿只能包含水平或垂直的四个方向的 1 。

 示例 2:

 [[0,0,0,0,0,0,0,0]]
 对于上面这个给定的矩阵, 返回 0。
 */
func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    
    var grid = grid
    let m  = grid.count
    let n = grid[0].count
    var maxArea = 0
    
    
    for i in 0..<grid.count {
        for j  in 0..<grid[i].count {
            if grid[i][j] == 1 {
                maxArea = max(maxArea, getArea(i, j, m, n, &grid))
            }
        }
        
    }
    
    return maxArea
}


func getArea(_ i : Int ,_ j: Int ,_ m:Int ,_ n:Int ,_  grid: inout [[Int]]) -> Int {
    
    if i < 0 || j < 0 || i >= m || j >= n || grid[i][j] == 0{
        return 0
    }
    if grid[i][j] == 1 {
        grid[i][j] = 0
       return  1 + getArea(i+1, j, m, n, &grid) + getArea(i-1, j, m, n, &grid) + getArea(i, j+1, m, n, &grid) + getArea(i, j-1, m, n, &grid)
    }
    return 0
}
