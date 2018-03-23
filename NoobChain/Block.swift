//
//  Block.swift
//  NoobChain
//
//  Created by 박성원 on 2018. 3. 23..
//  Copyright © 2018년 chain. All rights reserved.
//

import UIKit

struct Block {
    var thisHash = ""
    var previousHash = ""
    private var data = ""
    private var timeStamp: Date!
    
    init(data: String, previousHash: String) {
        self.data = data
        self.previousHash = previousHash
        self.timeStamp = Date()
        self.thisHash = calculateHash()
    }
    
    func calculateHash() -> String {
        return "\(previousHash)\(timeStamp!.date()!)\(data)".sha256()
    }

}

