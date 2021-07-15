//
//  main.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/22.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
//fileprivate let nums = [1,2,2,3,2,4,7]
//fileprivate let res1 = getTheAllcombination(nums: nums, target: 7)



isIsomorphic("abab","baba")
let res1 =  constructMaximumBinaryTree(nums)
//initListNodeSolution()
// let res1 =  reverseNList(node1, 2)
//print(res1?.description)
initListNodeSolution()
let res2 = reverseKGroup(node1, 2)
print(res2?.description)

var nums : [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]


solveSudoku(&nums)


func partition(_ arr : inout [Int] ,_ low : Int ,_ high : Int) -> Int {
    let poivtIndex = 2//Int.random(in: low...high)
    let povitNum = arr[poivtIndex]
    print("povitNum===",povitNum)
    
    arr.swapAt(poivtIndex, high)
    var resIndex = low
    
    for i  in low...high {
        if arr[i] < povitNum {
            arr.swapAt(i, resIndex)
            resIndex += 1
        }
    }
    arr.swapAt(resIndex, high)
    print("arr===",arr)
    return resIndex
    
}


let str = "babad"
var sortNums = [2,0,2,1,1,0]






//let res1 = quickSort(arr: sortNums)









//let res1 = maxProfit_3([3,3,5,0,0,3,1,4])
//print(res1)


var originalTime = 0
var otherTime = 0
var  gifts = ["羊","羊","车"]
for _ in 0...1000000{
    
    let randow = arc4random_uniform(3)
    var compere : Int?//主持人选的那一扇门
    for (i ,value) in gifts.enumerated() {
        if i != randow && value == "羊" {
            compere = i
        }
    }
    
    for i in 0..<3 {
        if i != randow && i != compere! {
            if gifts[i] == "车" {
                otherTime += 1
            }
            
        }
        if i == randow {
            if gifts[i] == "车" {
                originalTime += 1
            }
            
        }
    }
    
}

print("原先的门获取的车数",originalTime)
print("另外一扇门获取的车数",otherTime)











