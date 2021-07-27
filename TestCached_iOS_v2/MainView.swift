//
//  MainView.swift
//  TestCached_iOS_v2
//
//  Created by Lam Nguyen on 27/07/2021.
//

import UIKit
import Lottie

class MainView: UIViewController{
    @IBOutlet weak var logo: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad();
        
        logo.animationSpeed = 1;
        logo.loopMode = .loop;
        logo.play();
    }
}
