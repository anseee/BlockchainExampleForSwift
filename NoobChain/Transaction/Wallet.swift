//
//  Wallet.swift
//  NoobChain
//
//  Created by 박성원 on 2018. 3. 29..
//  Copyright © 2018년 chain. All rights reserved.
//

import Foundation

class Wallet: NSObject {
    
    static var instance = Wallet()
    
    var publicKey: String?
    var privateKey: String?
    
    override init() {
        
    }
}
