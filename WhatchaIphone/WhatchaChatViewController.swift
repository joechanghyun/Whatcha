//
//  ChatViewController.swift
//  WhatchaIphone
//
//  Created by 조창현 010 2075 0197 on 2016. 4. 12..
//  Copyright © 2016년 indrajch. All rights reserved.
//

import UIKit
import Chatto
import ChattoAdditions

class WhatchaChatViewController: ChatViewController {
    
    @IBOutlet weak var backButtonAction: UIButton!
    
    var messageSender: FakeMessageSender!
    var dataSource: FakeDataSource! {
        didSet {
            self.chatDataSource = self.dataSource
        }
    }
    
    lazy private var baseMessageHandler: BaseMessageHandler = {
        return BaseMessageHandler(messageSender: self.messageSender)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "bubble-incoming-tail-border", inBundle: NSBundle(forClass: self.dynamicType), compatibleWithTraitCollection: nil)?.bma_tintWithColor(UIColor.blueColor())
        super.chatItemsDecorator = WhatchaChatItemsDecorator()
        let addIncomingMessageButton = UIBarButtonItem(image: image, style: .Plain, target: self, action: "addRandomIncomingMessage")
        self.navigationItem.rightBarButtonItem = addIncomingMessageButton
    }
    
    @objc
    private func addRandomIncomingMessage() {
        self.dataSource.addRandomIncomingMessage()
    }
    
    var chatInputPresenter: ChatInputBarPresenter!
    override func createChatInputView() -> UIView {
        let chatInputView = ChatInputBar.loadNib()
        self.configureChatInputBar(chatInputView)
        self.chatInputPresenter = ChatInputBarPresenter(chatInputView: chatInputView, chatInputItems: self.createChatInputItems())
        return chatInputView
    }
    
    func configureChatInputBar(chatInputBar: ChatInputBar) {
        var appearance = ChatInputBarAppearance()
        appearance.sendButtonTitle = NSLocalizedString("Send", comment: "")
        appearance.textPlaceholder = NSLocalizedString("Type a message", comment: "")
        chatInputBar.setAppearance(appearance)
    }
    
    override func createPresenterBuilders() -> [ChatItemType: [ChatItemPresenterBuilderProtocol]] {
        return [
            TextMessageModel.chatItemType: [
                TextMessagePresenterBuilder(
                    viewModelBuilder: TextMessageViewModelDefaultBuilder(),
                    interactionHandler: TextMessageHandler(baseHandler: self.baseMessageHandler)
                )
            ],
            PhotoMessageModel.chatItemType: [
                PhotoMessagePresenterBuilder(
                    viewModelBuilder: FakePhotoMessageViewModelBuilder(),
                    interactionHandler: PhotoMessageHandler(baseHandler: self.baseMessageHandler)
                )
            ],
            SendingStatusModel.chatItemType: [SendingStatusPresenterBuilder()]
        ]
    }
    
    func createChatInputItems() -> [ChatInputItemProtocol] {
        var items = [ChatInputItemProtocol]()
        items.append(self.createTextInputItem())
        items.append(self.createPhotoInputItem())
        return items
    }
    
    private func createTextInputItem() -> TextChatInputItem {
        let item = TextChatInputItem()
        item.textInputHandler = { [weak self] text in
            self?.dataSource.addTextMessage(text)
        }
        return item
    }
    
    private func createPhotoInputItem() -> PhotosChatInputItem {
        let item = PhotosChatInputItem(presentingController: self)
        item.photoInputHandler = { [weak self] image in
            self?.dataSource.addPhotoMessage(image)
        }
        return item
    }
    
    
}

