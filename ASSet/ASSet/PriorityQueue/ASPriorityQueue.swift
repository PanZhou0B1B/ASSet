//
//  ASPriorityQueue.swift
//  ASSet
//
//  Created by zhoupanpan on 2019/6/12.
//  Copyright © 2019 zhoupanpan. All rights reserved.
//

import Foundation

/*
 基于堆的优先级队列实现:https://swift.gg/2019/05/06/implementing-a-heap-based-priority-queue-using-swift/
 
 数学：https://en.wikipedia.org/wiki/Heap_%28data_structure%29#Implementation
 
 优先级队列:可以对具有相对优先级的对象进行高效排序的数据结构.(根据队列中每个对象的优先级，一个个将队列中的对象进行排序)
 
 使用场景：一系列任务并准备在将来的某个时间点运行它们，利用优先级队列就可以让这些任务按照你预期执行
 
 堆：每个节点最多只有两个子节点的树，但与树不同的是，向堆中添加新节点时要尽可能往顶层左侧放置
 
    最小堆:每一个节点比其子节点都要小。最大堆则正好相反
 
 堆插入值：当我们插入一个新节点时，先将它放在树的顶层左侧开始的第一个空余可用的位置上。如果在放置后最小堆的性质不成立，则将此节点与它的父节点交换，直到最小堆性质成立为止。
 堆删除值：当要把一个对象移出队列时，需限制只从队列的某一端进行操作。在这里我们将通过限定只能删除根节点的方式来实现。当根节点被移除时，会被顶层最右边的节点替代。由于新节点成为根节点后有很大概率会过大，我们将把它向下移动，把它与最小的子节点交换，直到我们恢复最小堆。
 */

enum ASPriorityQueueError: Error{
    case emptyQueue(String)
}
/// 基于堆的优先级队列实现
protocol ASPriorityQueue {
    associatedtype DataType: Comparable
    
    
    /// 添加元素至队列中
    ///
    /// - Parameter item: 待添加元素
    /// - Returns: 是否插入成功
    @discardableResult func add(_ item: DataType) -> Bool
    
    /// 移除首个元素
    ///
    /// - Returns: 被移除的元素
    /// - Throws: 抛出的错误
    @discardableResult func remove() throws -> DataType
    
    /// 获取到队列中首个元素，并将其移出队列
    ///
    /// - Returns: 首个元素可选值
    func dequeue() -> DataType?
    
    /// 获取首个元素，但不将其移出队列
    ///
    /// - Returns: 首个元素可选值
    func peek() -> DataType?
    
    /// 清空队列
    func clear()
}
