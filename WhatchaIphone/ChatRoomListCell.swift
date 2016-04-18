//
//  ChatRoomListCell.swift
//  WhatchaIphone
//
//  Created by 조창현 010 2075 0197 on 2016. 4. 13..
//  Copyright © 2016년 indrajch. All rights reserved.
//

import UIKit

class ChatRoomListCell : UITableViewCell{
    
    @IBOutlet weak var roomTitleImage: UIImageView!
    @IBOutlet weak var roomTitle: UILabel!
    @IBOutlet weak var roomLastChatter: UILabel!
    @IBOutlet weak var roomLastChatContent: UILabel!
    @IBOutlet weak var roomLastUpdateTime: UILabel!
    
    override func awakeFromNib() {
                super.awakeFromNib()
//        roomTitleImage.layer.cornerRadius = 50.0
//        roomTitleImage.layer.masksToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
