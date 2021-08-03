//
//  UIImageView+Extension.swift
//  MoMoPlatform
//
//  Created by Lam Nguyen on 30/07/2021.
//

import UIKit

extension UIImageView{
    public func stickToBottom(){
        let SCREEN_SIZE = UIScreen.main.bounds
        let imageRatio = CGFloat(812) / CGFloat(375)    //standard fullscreen img defined by designer
        let scaledHeight = SCREEN_SIZE.width * imageRatio
        let ratio = 1 - CGFloat(SCREEN_SIZE.height) / CGFloat(scaledHeight)
        
        self.contentMode = .scaleAspectFill
        self.layer.contentsRect = CGRect(x: 0,y: ratio/2,width: 1,height: 1)
    }
}
