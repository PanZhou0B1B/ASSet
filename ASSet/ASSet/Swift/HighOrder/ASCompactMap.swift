//
//  ASCompactMap.swift
//  ASSet
//
//  Created by zhoupanpan on 2019/6/25.
//  Copyright © 2019 zhoupanpan. All rights reserved.
//

import Foundation

/// 当转换生成可选值时，使用此方法接收一组非可选值。即过滤 nil 值
struct ASCompactMap {
    
}
extension ASCompactMap{
    
    /// 过滤 nil
    public static func simpleTraverse00(){
        let optionals: [String?] = ["A",nil,"B","C"]
        
        let result = optionals.compactMap { return $0 }
        print(result)//["A", "B", "C"]
    }
    public static func simpleTraverse000(){
        let scores = ["1", "2", "three", "four", "5"]
        
        let mapped: [Int?] = scores.map { str in Int(str) }
        let compactMapped: [Int] = scores.compactMap { str in Int(str) }
        
        print(mapped)//[Optional(1), Optional(2), nil, nil, Optional(5)]
        print(compactMapped)//[1, 2, 5]
    }
    
    /// 类型转换
    public static func simpleTraverse01(){
        let numbers = [1,2,3,4]
        
        let result = numbers.compactMap { return "\($0)" }
        print(result)//["1", "2", "3", "4"]
    }
    
    /// 数据筛选 取余2  偶数
    public static func simpleTraverse02(){
        let numbers = [1,2,3,4]
        
        let result = numbers.compactMap { (element) -> Int? in
            if element % 2 == 0{
                return element
            }
            return nil
        }
        print(result)//[2, 4]
    }
    
}
