//
//  SortingAlgorithm.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/30.
//  Copyright © 2020 longxd. All rights reserved.
//

import Cocoa

//MARK: 计数排序

func countSort(array: inout [Int], maxValue: Int) -> [Int] {
    
    var countArray = [Int].init(repeating: 0, count: maxValue+1)
    for value in array {
        countArray[value] += 1
    }
    
    for index in 1..<countArray.count  {
        countArray[index] = countArray[index-1] + countArray[index]
    }
    
    var sortedArray = [Int].init(repeating: 0, count: array.count)
    for element in array {
        countArray[element] -= 1//转换成对应的索引
        sortedArray[countArray[element]] = element
    }
    return sortedArray
    
}
//MARK: 插入排序

public  func insertionSort<T>(_ array: [T] , _ isorderedBefore: ((T ,T) -> Bool)) -> [T] {
    var a = array
    for i   in 0..<array.count {
        var j = i
        let temp = a[j]
        
        while j > 0 && isorderedBefore(temp,a[j-1]) {
            a[j] = a[j-1]
            j -= 1
        }
        a[j] = temp
        
    }
    return a
    
}
//MARK: 选择排序
func  selectionSort<T: Comparable>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    if array.count <= 1 {
        return array
    }
    var array = array
    
    for i  in 0..<array.count {
        var minIndex = i
        
        for  j in i+1..<array.count {
            if isOrderedBefore(array[j],array[minIndex]) {
                minIndex = j
            }
        }
        if i != minIndex {
            array.swapAt(i, minIndex)
        }
        
    }
    
    return array
    
}
// MARK: -希尔排序
//func inserSort(_ list: inout [Int] ,start) -> <#return type#> {
//    <#function body#>
//}
//
//
//func shellSort(_ list: inout [Int]) -> [Int] {
//    var gap = list.count/2
//
//    while gap > 0 {
//        <#code#>
//    }
//
//
//
//
//    return list
//
//}
public func insertSort(_ list: inout[Int], start: Int, gap: Int) {
    for i in stride(from: (start + gap), to: list.count, by: gap) {
        let currentValue = list[i]
        var pos = i
        while pos >= gap && list[pos - gap] > currentValue {
            list[pos] = list[pos - gap]
            pos -= gap
        }
        list[pos] = currentValue
    }
}

//func insertSort2<T: Comparable>(_ list : inout [T],start: Int,gap: Int ,_ isOrderedBefore: (T, T) -> Bool){
//
//    for i in stride(from: gap+start, to: list.count, by: gap) {
//
//        let currentValue = list[i]
//        var j = i
//
//
//
//        while j > start && isOrderedBefore(currentValue,list[j]) {
//            list[j] =
//        }
//    }
//}

public func shellSort(_ list: inout [Int]) {
    var sublistCount = list.count / 2
    while sublistCount > 0 {
        for pos in 0..<sublistCount {

            insertSort(&list, start: pos, gap: sublistCount)
        }
        sublistCount = sublistCount / 2
    }
    print("list=====",list)
}


