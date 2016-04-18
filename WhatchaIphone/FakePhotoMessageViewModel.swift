//
//  FakePhotoMessageViewModel.swift
//  WhatchaIphone
//
//  Created by 조창현 010 2075 0197 on 2016. 4. 18..
//  Copyright © 2016년 indrajch. All rights reserved.
//

import Foundation
import ChattoAdditions

class FakePhotoMessageViewModel: PhotoMessageViewModel {
    
    let fakeImage: UIImage
    override init(photoMessage: PhotoMessageModelProtocol, messageViewModel: MessageViewModelProtocol) {
        self.fakeImage = photoMessage.image
        super.init(photoMessage: photoMessage, messageViewModel: messageViewModel)
        if photoMessage.isIncoming {
            self.image.value = nil
        }
    }
    
    override func willBeShown() {
        self.fakeProgress()
    }
    
    func fakeProgress() {
        if [TransferStatus.Success, TransferStatus.Failed].contains(self.transferStatus.value) {
            return
        }
        if self.transferProgress.value >= 1.0 {
            if arc4random_uniform(100) % 2 == 0 {
                self.transferStatus.value = .Success
                self.image.value = self.fakeImage
            } else {
                self.transferStatus.value = .Failed
            }
            
            return
        }
        self.transferStatus.value = .Transfering
        let delaySeconds: Double = Double(arc4random_uniform(600)) / 1000.0
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delaySeconds * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            let deltaProgress = Double(arc4random_uniform(15)) / 100.0
            self.transferProgress.value = min(self.transferProgress.value + deltaProgress, 1)
            self.fakeProgress()
        }
    }
}

public class FakePhotoMessageViewModelBuilder: ViewModelBuilderProtocol {
    
    let messageViewModelBuilder = MessageViewModelDefaultBuilder()
    
    public func createViewModel(model: PhotoMessageModel) -> PhotoMessageViewModel {
        let messageViewModel = self.messageViewModelBuilder.createMessageViewModel(model)
        let photoMessageViewModel = FakePhotoMessageViewModel(photoMessage: model, messageViewModel: messageViewModel)
        return photoMessageViewModel
    }
}
