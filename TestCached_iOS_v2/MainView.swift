//
//  MainView.swift
//  TestCached_iOS_v2
//
//  Created by Lam Nguyen on 27/07/2021.
//

import UIKit
import Lottie

@objc
class MainView: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //        let splash = DefaultSplash();
        
        let splash = UINib(nibName: "DefaultSplash", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView
        
        view.addSubview(splash)
    }
}
