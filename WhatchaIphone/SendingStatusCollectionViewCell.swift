//
//  SendingStatusCollectionViewCell.swift
//  WhatchaIphone
//
//  Created by 조창현 010 2075 0197 on 2016. 4. 18..
//  Copyright © 2016년 indrajch. All rights reserved.
//

import UIKit

class SendingStatusCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var label : UILabel!
    
//    @IBOutlet private weak var label: UILabel!
    
    var text: NSAttributedString? {
        didSet {
            self.label.attributedText = self.text
        }
    }
}
