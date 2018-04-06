//
//  Transaction.swift
//  NoobChain
//
//  Created by 박성원 on 2018. 3. 29..
//  Copyright © 2018년 chain. All rights reserved.
//

import Foundation
import LocalAuthentication

class Transaction: NSObject {
    var transactionId: String = ""
    var sender: Any?
    var reciepient: Any?
    var value: Float = 0.0
    var signature: Any?
    
    var inputs = [TransactionInput]()
    var outputs = [TransactionOutput]()
    
    private static var sequence = 0
    
    init(from: Any, to: Any, value: Float, inputs: [TransactionInput]) {
        self.sender = from
        self.reciepient = to
        self.value = value
        self.inputs = inputs
    }
    
    private func calculateHash() -> String {
        Transaction.sequence += 1
        return "\(sender!)\(reciepient!)\(value + Float(Transaction.sequence))".sha256()
    }
    
}

