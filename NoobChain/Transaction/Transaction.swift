//
//  Transaction.swift
//  NoobChain
//
//  Created by 박성원 on 2018. 3. 29..
//  Copyright © 2018년 chain. All rights reserved.
//

import Foundation
import LocalAuthentication

enum SignatureError: Error {
    case FailEncrypt
    case FailDecrypt
}

class Transaction: NSObject {
    var transactionId: String = ""
    var sender: String?
    var reciepient: String?
    var value: Float = 0.0

    var inputs = [TransactionInput]()
    var outputs = [TransactionOutput]()
    
    private static var sequence = 0
    
    let rsa = RSA.sharedInstance()
    var signature: String?
    
    init(from: String, to: String, value: Float, inputs: [TransactionInput]) {
        self.sender = from
        self.reciepient = to
        self.value = value
        self.inputs = inputs
    }
    
    private func calculateHash() -> String {
        Transaction.sequence += 1
        return "\(sender!)\(reciepient!)\(value + Float(Transaction.sequence))".sha256()
    }
    
    public func generateSignature() throws -> String? {
        if let data = "\(sender!)\(reciepient!)\(value + Float(Transaction.sequence))".sha256().data(using: String.Encoding.utf8) {
            return rsa?.encryptUsingPublicKey(with: data)
        }
        else {
            throw SignatureError.FailEncrypt
        }
    }
    
    public func verifySignature() throws -> String? {
        if let data = signature?.data(using: String.Encoding.utf8) {
            return rsa?.decryptUsingPrivateKey(with: data)
        }
        else {
            throw SignatureError.FailDecrypt
        }
    }
    
}

