//
//  Extensions.swift
//  TestCached_iOS_v2
//
//  Created by Lam Nguyen on 27/07/2021.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)!.first as! T
    }
    
    class func loadFullScreenFromNib<T: UIView>(rootView: UIView) -> T {
        let loadedView: T = .fromNib()
        loadedView.frame = CGRect(x: 0, y: 0, width: rootView.frame.width, height: rootView.frame.height)
        return loadedView;
    }
}

//extension 
