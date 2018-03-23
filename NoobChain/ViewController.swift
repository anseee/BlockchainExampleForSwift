//
//  ViewController.swift
//  NoobChain
//
//  Created by 박성원 on 2018. 3. 23..
//  Copyright © 2018년 chain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let genesisBlock = Block.init(data: "Hi i'm first block", previousHash: "0")
        print("genesisBlock hash: \(genesisBlock.thisHash)")
        
        let secondBlock = Block.init(data: "Yo im the second block", previousHash: genesisBlock.thisHash)
        print("secondBlock hash: \(secondBlock.thisHash)")
        
        let thirdBlock = Block.init(data: "Hi i'm third block", previousHash: secondBlock.thisHash)
        print("thirdBlock hash: \(thirdBlock.thisHash)")
    }
}

