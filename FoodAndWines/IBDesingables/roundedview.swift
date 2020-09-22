//
//  roundedview.swift
//  communitysocail
//
//  Created by abhi on 25/09/17.
//  Copyright © 2017 abhi. All rights reserved.
//

import UIKit

@IBDesignable
class roundedview: UIView {

    @IBInspectable override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
    @IBInspectable var viewBGColor: UIColor = UIColor.init(hexString: "#324750")! {
        didSet {
            refreshColor(_color: viewBGColor)
        }
    }
    
    func refreshColor(_color: UIColor) {
        print("refreshColor(): \(_color)")
        let size: CGSize = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        _color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        clipsToBounds = true
    }
}
