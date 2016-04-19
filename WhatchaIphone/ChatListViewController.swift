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
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChatRoomListCustomCell", forIndexPath: indexPath) as! ChatRoomListCell
        
        cell.backgroundColor = UIColor.clearColor()
    
        cell.roomTitle.text = "Test Chat Room"
        cell.roomLastChatter.text = "아무개:"
        cell.roomLastChatContent.text = "대화 내용 블라블라 블라블라 ..."
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var initialCount = 0
        let pageSize = 50
        
        var dataSource: FakeDataSource!
        if segue.identifier == "list0" {
            initialCount = 0
        } else {
            assert(false, "segue not handled!")
        }
        
        let chatController = segue.destinationViewController as! WhatchaChatViewController
        if dataSource == nil {
            dataSource = FakeDataSource(count: initialCount, pageSize: pageSize)
        }
        chatController.dataSource = dataSource
        chatController.messageSender = dataSource.messageSender
    }
    
    
}
