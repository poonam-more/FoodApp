//
//  customview.swift
//  RoadRez
//
//  Created by Abhishek Rathi on 25/06/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit
@IBDesignable
class customview: UIView {
    
    let view = UIView()
    
    override var backgroundColor: UIColor? {
        didSet {
            print("here: "); // break point 1
        }
    }
    
    func setup() {
        self.backgroundColor = UIColor.init(hexString: "#324750") // break point 2
        view.backgroundColor = UIColor.init(hexString: "#324750")
        view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        addSubview(view)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)  // break point 3
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)  // break point 4
        setup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        backgroundColor = UIColor.init(hexString: "#324750")

    }
}
