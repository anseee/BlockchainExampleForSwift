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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let genesisBlock = Block.init(data: "Hi i'm first block", previousHash: "0")
        print("genesisBlock hash: \(genesisBlock.thisHash)")
        
        let secondBlock = Block.init(data: "Yo im the second block", previousHash: genesisBlock.thisHash)
        print("secondBlock hash: \(secondBlock.thisHash)")
        
        let thirdBlock = Block.init(data: "Hi i'm third block", previousHash: secondBlock.thisHash)
        print("thirdBlock hash: \(thirdBlock.thisHash)")
        
        blockchain.append(genesisBlock)
        blockchain.append(secondBlock)
        blockchain.append(thirdBlock)
        
        print(isChainValid())
    }
    
    func isChainValid() -> Bool {
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
        }
        print("equals")
        return true
    }
}

