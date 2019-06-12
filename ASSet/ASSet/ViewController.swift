//
//  ViewController.swift
//  ASSet
//
//  Created by zhoupanpan on 2019/6/12.
//  Copyright © 2019 zhoupanpan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}


// MARK: - ASPriorityQueueViaHeap
extension ViewController{
    private func queueOperate(){
        let queue = ASPriorityQueueViaHeap<Int>()
        queue.add(2)
        queue.add(8)
        queue.add(12)
        queue.add(1)
        queue.add(56)
        print(queue)
        
        let _ = queue.dequeue()
        let _ = queue.dequeue()
        
        print(queue)
    }
}
