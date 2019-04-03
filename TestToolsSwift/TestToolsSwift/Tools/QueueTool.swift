//  
//
//  QueueTool.swift
//  MKTV
//
//  Created by TangYanQiong Corporation on 16/8/19.
//  Copyright © 2016Year . All rights reserved.
//

class QueueTool: NSObject {
    class func execDealDataSourceQueue(_ queue: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).async(execute: queue)
    }

    class func execMainQueue(_ queue: @escaping () -> Void) {
        DispatchQueue.main.async(execute: queue)
    }
}
