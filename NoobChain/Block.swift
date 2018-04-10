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
    private var nonce = 0
    
    init(data: String, previousHash: String) {
        self.data = data
        self.previousHash = previousHash
        self.timeStamp = Date()
        self.thisHash = calculateHash()
    }
    
    func calculateHash() -> String {
        return "\(previousHash)\(timeStamp)\(nonce)\(data)".sha256()
    }

    mutating func mineBlock(difficulty: Int, completed: (Bool) -> ()) {
        var target = ""
        
        for _ in 0..<difficulty {
            target.append("0")
        }
        
        let idx = thisHash.index(thisHash.startIndex, offsetBy: difficulty)
        while thisHash[..<idx] != target {
            nonce += 1
            thisHash = calculateHash()
        }
        
        print("block was mined: \(self.thisHash) rotate: \(nonce)")
        completed(true)
    }
}

