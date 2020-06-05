//
//  Heap.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/6/5.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

public struct Heap<T> {
    var nodes = [T]()
    private var orderCriteria : (T ,T) -> Bool
    
    public init(sort : @escaping (T ,T) -> Bool){
        self.orderCriteria = sort
    }
    
    public init(array : [T] ,sort : @escaping (T ,T) -> Bool) {

        self.orderCriteria = sort
        configureHeap(from: array)
        
    }
    
    private mutating func configureHeap(from array:[T]) {
        nodes = array
        for i in stride(from: nodes.count/2-1, through: 0, by: -1) {
            shiftDown(i)
        }
        
    }
    
    var isEmpty :Bool {
        return nodes.isEmpty
    }
    
    public var count :Int {
        return nodes.count
        
    }
    
    
    public func peek() -> T? {
        return nodes.first
    }
    
    public mutating func insert(_ value :T) -> Void {
        nodes.append(value)
        shiftUp(nodes.count-1)
    }
    
    mutating func insert<S :Sequence>(_ sequence : S) where S.Iterator.Element == T {

        for value in sequence {
            insert(value)
        }
    }
    
   public mutating func replace(index i :Int , value :T) {
        guard i < nodes.count else { return }
        
        remove(at: i)
        insert(value)
        
    }
    
   public mutating func remove() -> T? {
        guard !nodes.isEmpty else {  return nil }
        if nodes.count == 1 {
            return nodes.removeLast()
        }else{
            let value = nodes[0]
            
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
  @discardableResult  mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
        

    }
    

    
    func leftChildIndex(ofIndex i :Int) -> Int {
        return 2*i + 1
    }
    
    func rightChildIndex(ofIndex i :Int) -> Int {
        return 2*i + 2
    }
    
    func parentIndex(ofIndex i :Int) -> Int {
        return (i-1)/2
    }
    
    
    mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentindex = self.parentIndex(ofIndex: index)
        
        while childIndex > 0 && orderCriteria(child ,nodes[parentindex]) {
            nodes[childIndex] = nodes[parentindex]
            childIndex = parentindex
            parentindex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
        
        
        
        
    }
    internal mutating func shiftDown(_ index :Int) {
        shiftDown(from: index, until: nodes.count)
    }
    internal mutating func shiftDown(from index: Int ,until endIndex: Int){
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex],nodes[first]) {
            first = leftChildIndex
        }
        
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex],nodes[first]) {
            first = rightChildIndex
        }
        if index == first {
            return
        }
        nodes.swapAt(first, index)
        shiftDown(from: first, until: endIndex)
        
        
    }
    
}
