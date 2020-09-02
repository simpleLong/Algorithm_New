//
//  main.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/22.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation


lengthOfLIS([1,3,6,7,9,4,10,5,6])









let res1 = maxProfit_3([3,3,5,0,0,3,1,4])
print(res1)


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











