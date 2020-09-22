//
//  DesignableLabel.swift
//  cambridgewines
//
//  Created by Poonam More on 01/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

//
//  roundedview.swift
//  communitysocail
//
//  Created by abhi on 25/09/17.
//  Copyright © 2017 abhi. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableLabelView: UILabel {
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 5.0
    @IBInspectable var rightInset: CGFloat = 5.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    @IBInspectable override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
    @IBInspectable var viewBGColor: UIColor = UIColor.white {
        didSet {
           // refreshColor(_color: viewBGColor)
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
