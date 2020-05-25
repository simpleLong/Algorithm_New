//
//  Symmetric.swift
//  Algorithm
//
//  Created by longxd on 2020/5/23.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

func compereRoot(_ leftRoot : TreeNode? ,_ rightRoot :TreeNode?) -> Bool {
    
    guard let left = leftRoot ,let right = rightRoot ,left.val == right.val  else {
        return rightRoot == nil && leftRoot == nil
    }
    
    
    return compereRoot(left.left, right.right) && compereRoot(left.right, right.left)
    
}



func isSymmetric(_ root: TreeNode?) -> Bool {
    
    guard let root = root else {
        return true
    }
    return compereRoot(root.left, root.right)

}
