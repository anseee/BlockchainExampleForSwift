//
//  ViewController.swift
//  NoobChain
//
//  Created by 박성원 on 2018. 3. 23..
//  Copyright © 2018년 chain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var blockchain = [Block]()
    let difficulty = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        blockchain.append(Block.init(data: "Hi i'm first block", previousHash: "0"))
//        print("Trying to mine block 1...")
//        blockchain[0].mineBlock(difficulty: difficulty)
//
//        blockchain.append(Block.init(data: "Yo im the second block", previousHash: blockchain[0].thisHash))
//        print("Trying to mine block 2...")
//        blockchain[1].mineBlock(difficulty: difficulty)
//
//        blockchain.append(Block.init(data: "Hi i'm third block", previousHash: blockchain[1].thisHash))
//        print("Trying to mine block 3...")
//        blockchain[2].mineBlock(difficulty: difficulty)
        
//        print(isChainValid())
    }
    
    func isChainValid() -> Bool {
        var target = ""
        
        for _ in 0..<difficulty {
            target.append("0")
        }
        
        for index in 1..<blockchain.count {
            let currentBlock: Block = blockchain[index]
            let previousBlock: Block = blockchain[index-1]
            
            if currentBlock.thisHash != currentBlock.calculateHash() {
                print("current hashes not equal")
                return false
            }
            
            if previousBlock.thisHash != currentBlock.previousHash {
                print("previous hashes not equal")
                return false
            }
            
            let idx = currentBlock.thisHash.index(currentBlock.thisHash.startIndex, offsetBy: difficulty)
            if currentBlock.thisHash[..<idx] != target {
                print("This block hasn't been mined")
                return false
            }
            
        }
        print("equals")
        return true
    }
}

