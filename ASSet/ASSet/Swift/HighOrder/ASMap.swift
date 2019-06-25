//
//  ASMap.swift
//  ASSet
//
//  Created by zhoupanpan on 2019/6/25.
//  Copyright © 2019 zhoupanpan. All rights reserved.
//

import Foundation

//TODO: sorted,forEach

/// map 方法接受一个闭包作为参数， 然后它会遍历整个数组，并对数组中每一个元素执行闭包中定义的操作。 相当于对数组中的所有元素做了一个映射。


/// 在序列上使用并且具有返回可选值的转换，请使用 compactMap。如果没有，map或flatMap应该为您提供所需的结果
struct ASMap {
    
}
extension ASMap{
    public static func mapSimpleTraverse00(){
        let numbers = [1,2,3,4]
        
        let result = numbers.map { (element) -> Int in
            return element + 2
        }
        print(result)
    }
    public static func mapSimpleTraverse01(){
        let numbers = [1,2,3,4]
        
        let result = numbers.map { $0 + 2 }
        print(result)
    }
    public static func mapSimpleTraverse02(){
        let numbers = [1,2,3,4]
        
        let result = numbers.map { "element:\($0)" }
        print(result)
    }
}
