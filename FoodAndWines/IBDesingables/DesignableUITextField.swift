//
//  DesignableUITextField.swift
//  RoadRez
//
//  Created by Abhishek Rathi on 24/06/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUITextField: UITextField {
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderStyle = .none
        updateView()
        setExtraGraphics()
    }
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
   
    func setExtraGraphics() {
        self.backgroundColor = UIColor(red: 0.27, green: 0.36, blue: 0.4, alpha: 1.0)
        self.backgroundColor = UIColor.init(hexString: "#1D1D1D")
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 1
       // self.layer.borderColor = UIColor(red: 0.17, green: 0.24, blue: 0.27, alpha: 1.0).cgColor
        self.layer.borderColor = UIColor.init(hexString: "#3A3A3A")?.cgColor
        //dropShadow()
    }
    
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize(width: 0, height: 6)
        self.layer.shadowRadius = 3
        
        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        self.layer.shouldRasterize = false
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    private var shadowLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 25).cgPath
              shadowLayer.fillColor = UIColor.init(hexString: "#1D1D1D")?.cgColor
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0, height: 2.0)
            shadowLayer.shadowOpacity = 0.06
            shadowLayer.shadowRadius = 3
            
            layer.insertSublayer(shadowLayer, at: 0)
            //layer.insertSublayer(shadowLayer, below: nil) // also works
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: 18, height: 18))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            let viewLeft: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            viewLeft.addSubview(imageView)
            leftView = viewLeft
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}
