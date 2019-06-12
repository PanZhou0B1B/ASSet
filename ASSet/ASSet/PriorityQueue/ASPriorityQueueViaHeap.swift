//
//  ASPriorityQueueViaHeap.swift
//  ASSet
//
//  Created by zhoupanpan on 2019/6/12.
//  Copyright © 2019 zhoupanpan. All rights reserved.
//

import Foundation


/// 基于`最小堆`数据结构的`优先级队列`实现
class ASPriorityQueueViaHeap<DataType: Comparable> {
    
    /// 数组实现树结构：插入--数组索引count-1处；移除--数组索引0
    private var queue = Array<DataType>()
    
    /// 队列长度
    public var length: Int{
        return self.queue.count
    }
    
    public init(){
        
    }
}

// MARK: - ASPriorityQueue
extension ASPriorityQueueViaHeap: ASPriorityQueue{
    
    /// 插入元素至队列。并依据插入元素上溯比较，恢复最小堆序列
    ///
    /// - Parameter item: 插入元素
    /// - Returns: 是否成功
    @discardableResult public func add(_ item: DataType) -> Bool {
        self.queue.append(item)
        self.heapifyUp(from: self.queue.count - 1)
        return true
    }
    @discardableResult func remove() throws -> DataType {
        guard self.queue.count > 0 else {
            throw ASPriorityQueueError.emptyQueue("Attempt to remove item from an empty queue.")
        }
        let removedFirstItem = self.popAndHeapifyDown()
        return removedFirstItem
    }
    public func dequeue() -> DataType? {
        guard self.queue.count > 0 else {
            return nil
        }
        let removedFirstItem = self.popAndHeapifyDown()
        return removedFirstItem
    }
    public func peek() -> DataType? {
        return self.queue.first
    }
    public func clear() {
        self.queue.removeAll()
    }
}

// MARK: - CustomStringConvertible
extension ASPriorityQueueViaHeap: CustomStringConvertible{
    public var description: String {
        return self.queue.description
    }
}
// MARK: - Private 1
extension ASPriorityQueueViaHeap{
    
    /// 1. 弹出队列首元素(删除)，并将尾元素迁移至首元素索引处
    /// 2. 恢复最小堆排序
    ///
    /// - Returns: 删除的首元素
    private func popAndHeapifyDown() -> DataType{
        let firstItem = self.queue[0]
        
        if self.queue.count == 1 {
            self.queue.remove(at: 0)
            return firstItem
        }
        
        self.queue[0] = self.queue.remove(at: self.queue.count - 1)
        self.heapifyDown()
        return firstItem
    }
}
// MARK: - Private 2
extension ASPriorityQueueViaHeap{
    
    /// 插入元素时，将 index 索引元素移至队列头部，恢复最小堆排序
    ///
    /// - Parameter index: 待移动的元素索引
    private func heapifyUp(from index: Int){
        var child = index
        var parent = child.parent
        
        while parent >= 0, self.queue[parent] > self.queue[child] {
            swap(parent, with: child)
            
            child = parent
            parent = child.parent
        }
    }
    
    /// 将根元素移向队列尾部，实现恢复最小堆排序
    private func heapifyDown(){
        var parent: Int = 0
        
        while true {
            let leftChild = parent.leftChild
            //无 左子节点
            if leftChild >= self.queue.count{
                break
            }
            let rightChild = parent.rightChild
            var minChild = leftChild
            //有右子节点 && 右子节点较小时
            if rightChild < self.queue.count, self.queue[minChild] > self.queue[rightChild]{
                minChild = rightChild
            }
            
            if self.queue[parent] > self.queue[minChild]{
                self.swap(parent, with: minChild)
                parent = minChild
            }else{
                break
            }
        }
    }
    /// 交换2处索引下的元素值
    ///
    /// - Parameters:
    ///   - firstIndex: 第一元素的索引
    ///   - secondIndex: 第二元素的索引
    private func swap(_ firstIndex: Int, with secondIndex: Int){
        let firstItem = self.queue[firstIndex]
        self.queue[firstIndex] = self.queue[secondIndex]
        self.queue[secondIndex] = firstItem
    }
}

// MARK: - 私有 Int 扩展。便于查询 Heap 节点（字节单和父节点）索引。
private extension Int{
    var leftChild: Int{
        return (2 * self) + 1
    }
    var rightChild: Int{
        return (2 * self) + 2
    }
    var parent: Int{
        return (self - 1) / 2
    }
    
}
