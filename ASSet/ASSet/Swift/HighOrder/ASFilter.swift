//
//  ASFilter.swift
//  ASSet
//
//  Created by zhoupanpan on 2019/6/25.
//  Copyright © 2019 zhoupanpan. All rights reserved.
//

import Foundation


/// 将元素按照某种规则进行一次过滤
struct ASFilter {
    
}
extension ASFilter{
    
    public static func simpleTraverse00(){
        let lans = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
        let result01 = lans.filter { (name) -> Bool in
            return name.count < 10
        }
        let result02 = lans.filter {
            return $0.count < 10
        }
        let result03 = lans.filter(lengthLess10(for:))
        
        print(result01)
        print(result02)
        print(result03)
        //["Swift", "HTML", "CSS"]
    }
    /// find student of 0 score
    public static func simpleTraverse01(){
        let scoresByName = ["Henk": [0, 5, 8], "John": [2, 5, 8]]
        let result = scoresByName.filter { (key, value) -> Bool in
            let zeroValues: [Int] = value.compactMap{
                if $0 == 0{
                    return $0
                }
                return nil
            }
            print(zeroValues)
            //[]
            //[0]
            return zeroValues.count > 0
        }
        print(result)
    }
}
extension ASFilter{
    private static func lengthLess10(for name: String) -> Bool{
        return name.count < 10
    }
}
