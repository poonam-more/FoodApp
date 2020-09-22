//
//  RoundTextField.swift
//  IBTuts
//
//  Created by Jatin Soni on 19/06/2019.
//  Copyright © 2019 Apollo Solutions Ltd. All rights reserved.
//

import UIKit

@IBDesignable
class RoundTextField: UITextField {
    
    @IBInspectable var image: UIImage? {
        didSet {
            setupImageView()
        }
    }
    
    var imageView: UIImageView = UIImageView()
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += 25
        return textRect
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderStyle = .none
        setupImageView()
        setExtraGraphics()
    }
    
    func roundedCornders(corners:UIRectCorner, radius:CGFloat) {
        let bounds = self.bounds
        
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        
        self.layer.mask = maskLayer
        
        let frameLayer = CAShapeLayer()
        frameLayer.frame = bounds
        frameLayer.path = maskPath.cgPath
        frameLayer.strokeColor = UIColor.darkGray.cgColor
        frameLayer.fillColor = UIColor.init(red: 247, green: 247, blue: 247, alpha: 0).cgColor
        
        self.layer.addSublayer(frameLayer)
    }
    
    func setupImageView() {
        
        imageView = UIImageView(frame: CGRect(x:26,y:0,width:18,height:18))
        imageView.image = image;
        imageView.contentMode = .scaleAspectFit
        
        let viewLeft: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
        viewLeft.addSubview(imageView)
        
        self.leftView = viewLeft
        self.leftViewMode = .always
        
    }
    
    func setExtraGraphics() {
        self.backgroundColor = UIColor(red: 0.27, green: 0.36, blue: 0.4, alpha: 1.0)
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.17, green: 0.24, blue: 0.27, alpha: 1.0).cgColor
        
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
            shadowLayer.fillColor = UIColor(red: 0.27, green: 0.36, blue: 0.4, alpha: 1.0).cgColor
            
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0, height: 2.0)
            shadowLayer.shadowOpacity = 0.06
            shadowLayer.shadowRadius = 3
            
            layer.insertSublayer(shadowLayer, at: 0)
            //layer.insertSublayer(shadowLayer, below: nil) // also works
        }
    }


//    @IBInspectable var cornerRadius: CGFloat = 25 {
//        didSet {
//            self.layer.cornerRadius = cornerRadius
//        }
//    }

//    @IBInspectable var borderWidth: CGFloat = 0.0 {
//        didSet {
//            self.layer.borderWidth = borderWidth
//        }
//    }

}
