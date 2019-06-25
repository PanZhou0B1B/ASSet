//
//  ASReduce.swift
//  ASSet
//
//  Created by zhoupanpan on 2019/6/25.
//  Copyright © 2019 zhoupanpan. All rights reserved.
//

import Foundation


/// 计算，可以对元素进行计算

/// reduce 第一个参数是初始值
struct ASReduce {
    
}
extension ASReduce{
    public static func simpleTraverse00(){
        let lans = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
        
        let result01 = lans.reduce("") { (result, string) -> String in
            return result == "" ? string : result + "、" + string
        }
        let result02 = lans.reduce("") {
            append($0, with: $1)
        }
        print(result01)
        print(result02)
        //Objective-C、Swift、HTML、CSS、JavaScript
    }
}
extension ASReduce{
    
    /// 拼接字符串
    private static func append(_ string1: String, with string2: String) -> String {
        return string1 == "" ? string2 : string1 + "、" + string2
    }
}
