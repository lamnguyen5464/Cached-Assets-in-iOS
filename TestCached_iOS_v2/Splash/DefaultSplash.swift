//
//  DefaultSplash.swift
//  TestCached_iOS_v2
//
//  Created by Lam Nguyen on 27/07/2021.
//

import UIKit
import Lottie

@objc
class DefaultSplash: UIView{
    
    @IBOutlet weak var logo: AnimationView!
    

    override func awakeFromNib() {
        super.awakeFromNib()

        logo.animationSpeed = 1;
        logo.loopMode = .loop;
        logo.play();
    }
}
