//
//  WalletMakeViewController.swift
//  NoobChain
//
//  Created by 박성원 on 2018. 4. 6..
//  Copyright © 2018년 chain. All rights reserved.
//

import UIKit

class WalletMakeViewController: UIViewController {
    @IBOutlet weak var privateKeyTextView: UITextView!
    @IBOutlet weak var publicKeyTextView: UITextView!
    private let rsa: RSA = RSA.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func createWalletAction(_ sender: UIButton) {
        rsa.generateKeyPair { [weak self] in
            self?.publicKeyTextView.text = self?.rsa.getPublicKeyAsBase64()
            self?.privateKeyTextView.text = self?.rsa.getPrivateKeyAsBase64()
        }
    }
    
    @IBAction func copyPrivateKeyAction(_ sender: Any) {
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = self.privateKeyTextView.text
    }
    
    @IBAction func copyPublicKeyAction(_ sender: Any) {
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = self.publicKeyTextView.text
    }
}
