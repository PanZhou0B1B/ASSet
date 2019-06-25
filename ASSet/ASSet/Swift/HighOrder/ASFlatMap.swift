//
//  ASFlatMap.swift
//  ASSet
//
//  Created by zhoupanpan on 2019/6/25.
//  Copyright © 2019 zhoupanpan. All rights reserved.
//

import Foundation

/// 当每个元素生成序列或集合时，使用此方法接收单层级集合。
struct ASFlatMap {
    
}
extension ASFlatMap{
    public static func flatMapSimpleTraverse00(){
        let numbersCompound = [
                               [1,2,3],
                               [4,5,6]
                              ]
        
        let result00 = numbersCompound.map {
            $0.map{ $0 + 2 }
        }
        let result01 = numbersCompound.flatMap {
            $0.map{ $0 + 2}
        }
        print(result00)
        /*
        [
        [1,2,3],
        [4,5,6]
        ]
         实际上是遍历了这里两个数组元素 [1,2,3] 和 [4,5,6]。 因为这两个元素依然是数组，所以我们可以对他们再次调用 map 函数。
         */
        print(result01)
        /*
         [3, 4, 5, 6, 7, 8]
         
         flatMap 依然会遍历数组的元素，并对这些元素执行闭包中定义的操作。 但唯一不同的是，它对最终的结果进行了所谓的 "降维" 操作。 本来原始数组是一个二维的， 但经过 flatMap 之后，它变成一维的了。
        */
    }
    public static func flatMapSimpleTraverse01(){
        let scoresByName = ["Henk": [0, 5, 8], "John": [2, 5, 8]]
        
        let mapped = scoresByName.map { $0.value }
        let flatMapped = scoresByName.flatMap { $0.value }
        
        print(mapped)//[[2, 5, 8], [0, 5, 8]]
        print(flatMapped)// [2, 5, 8, 0, 5, 8]
    }
}
