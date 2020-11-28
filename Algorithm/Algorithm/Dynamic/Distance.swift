//
//  Distance.swift
//  Algorithm
//
//  Created by longxd on 2020/11/23.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 
 72. 编辑距离
 给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。

 你可以对一个单词进行如下三种操作：

 插入一个字符
 删除一个字符
 替换一个字符
  

 示例 1：

 输入：word1 = "horse", word2 = "ros"
 输出：3
 解释：
 horse -> rorse (将 'h' 替换为 'r')
 rorse -> rose (删除 'r')
 rose -> ros (删除 'e')
 示例 2：

 输入：word1 = "intention", word2 = "execution"
 输出：5
 解释：
 intention -> inention (删除 't')
 inention -> enention (将 'i' 替换为 'e')
 enention -> exention (将 'n' 替换为 'x')
 exention -> exection (将 'n' 替换为 'c')
 exection -> execution (插入 'u')
  

 提示：

 0 <= word1.length, word2.length <= 500
 word1 和 word2 由小写英文字母组成
 
 */

func minDistance(_ word1: String, _ word2: String) -> Int {

    var cache = [[Int]].init(repeating: [Int].init(repeating: -1, count: word2.count), count: word1.count)
    
    return dp(0, Array(word1), 0, Array(word2), &cache)
}

private  func dp(_ i :Int , _ word1 :[Character] ,_ j :Int ,_ word2 :[Character] ,_ cache :inout [[Int]]) -> Int {
    
    if i == word1.count {
        return word2.count - j
    }
    if j == word2.count {
        return word1.count - i
    }
    
    if cache[i][j] != -1 {
        return  cache[i][j]
    }
    
    if word1[i] == word2[j] {
        cache[i][j] = dp(i+1, word1, j+1, word2, &cache)
    }else{
        let insert = dp(i, word1, j+1, word2, &cache)
        let remove = dp(i+1, word1, j, word2, &cache)
        let replace = dp(i+1, word1, j+1, word2, &cache)
        cache[i][j] = min(min(insert, remove), replace) + 1
        
        
        
    }
    return cache[i][j]
}

//class Solution {
//public:
//    int calculateMinimumHP(vector<vector<int>>& dungeon) {
//        int n = dungeon.size(), m = dungeon[0].size();
//        vector<vector<int>> dp(n + 1, vector<int>(m + 1, INT_MAX));
//        dp[n][m - 1] = dp[n - 1][m] = 1;
//        for (int i = n - 1; i >= 0; --i) {
//            for (int j = m - 1; j >= 0; --j) {
//                int minn = min(dp[i + 1][j], dp[i][j + 1]);
//                dp[i][j] = max(minn - dungeon[i][j], 1);
//            }
//        }
//        return dp[0][0];
//    }
//};



