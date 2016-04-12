//
//  ChatListViewController.swift
//  WhatchaIphone
//
//  Created by 조창현 010 2075 0197 on 2016. 4. 12..
//  Copyright © 2016년 indrajch. All rights reserved.
//

import UIKit

class ChatListViewController : UITableViewController{
    var chatRoomList: [[String:String]] = [[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChatRoomListCustomCell", forIndexPath: <#T##NSIndexPath#>) as! ChatRoomListCell
        
//        cell.roomTitleImage.image = UIImage(named:"")!
//        cell.roomTitle.text = ""
        
    }
    
    
}
