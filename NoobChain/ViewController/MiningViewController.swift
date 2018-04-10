//
//  MiningViewController.swift
//  NoobChain
//
//  Created by 박성원 on 2018. 4. 10..
//  Copyright © 2018년 chain. All rights reserved.
//

import UIKit

class MiningViewController: UIViewController {

    var blockchain = [Block]()
    let difficulty = 4
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressBar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startMiningAction(_ sender: UIButton) {
        do {
            let imageData = try Data.init(contentsOf: Bundle.main.url(forResource: "dogeMining", withExtension: "gif")!)
            let progressBarImageData = try Data.init(contentsOf: Bundle.main.url(forResource: "progressbar", withExtension: "gif")!)
            let gif = UIImage.gifImageWithData(imageData)
            let progressBarGif = UIImage.gifImageWithData(progressBarImageData)
            imageView.image = gif
            progressBar.image = progressBarGif
            progressBar.isHidden = false
            sender.setTitle("채굴 중..", for: .normal)
            sender.isEnabled = false
            
            DispatchQueue.global().async {
                self.blockchain.append(Block.init(data: "Hi i'm \(self.blockchain.count + 1)st block", previousHash: self.blockchain.count == 0 ? "0" : self.blockchain[self.blockchain.count - 1].thisHash))
                print("Trying to mine block \(self.blockchain.count)...")
                self.blockchain[self.blockchain.count - 1].mineBlock(difficulty: self.difficulty, completed: { completed in
                    if completed {
                        DispatchQueue.main.sync {
                            let message = "채굴 완료!!\n💰💰💰💰💰💰💰💰\n💰💰💰💰💰💰💰💰"
                            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                            self.present(alert, animated: true)
                            
                            let duration: Double = 1.5
                            
                            self.imageView.image = #imageLiteral(resourceName: "dogecoin-300")
                            self.progressBar.isHidden = true
                            sender.setTitle("채굴 시작", for: .normal)
                            sender.isEnabled = true
                            
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                                alert.dismiss(animated: true)
                            }
                        }
                    }
                })
            }
        }
        catch {
            
        }
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
