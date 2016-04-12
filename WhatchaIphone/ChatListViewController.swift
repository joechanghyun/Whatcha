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
    
//        var itemList = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let item1=["name":"사과","image":"apple.jpeg","amount":"6","value":"3000원"]
//        let item2=["name":"블루베리","image":"blueberry.jpg","amount":"10","value":"30000원"]
//        let item3=["name":"당근","image":"carrot.jpg","amount":"13","value":"5000원"]
//        let item4=["name":"체리","image":"cherry.png","amount":"1","value":"2000원"]
//        let item5=["name":"포도","image":"grape.jpg","amount":"13","value":"1000원"]
//        let item6=["name":"키위","image":"kiwi.png","amount":"2","value":"15000원"]
//        let item7=["name":"레몬","image":"lemon.png","amount":"3","value":"6000원"]
//        let item8=["name":"라임","image":"lime.jpg","amount":"4","value":"4000원"]
//        let item9=["name":"고기","image":"meat.jpg","amount":"5","value":"2000원"]
//        let item10=["name":"딸기","image":"strawberry.jpg","amount":"7","value":"8000원"]
//        let item11=["name":"토마토","image":"tomato.png","amount":"30","value":"3000원"]
//        let item12=["name":"야채","image":"vegetable.jpg","amount":"40","value":"7000원"]
//        let item13=["name":"멜론","image":"watermelon.png","amount":"5","value":"10000원"]
//        itemList = [item1, item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13]
        
        
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
    
    
}
