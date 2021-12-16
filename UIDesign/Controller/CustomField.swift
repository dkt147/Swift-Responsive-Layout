//
//  CustomField.swift
//  UIDesign
//
//  Created by JOEYCO-0072PK on 16/12/2021.
//

import Foundation
import UIKit

class CustomField: UITextField{
    
   
    //Just add simple bottom line of gray
    
    func setup() {
        let border = CALayer()
        let width = CGFloat(1.0)
    border.borderColor = UIColor.lightGray.cgColor
    border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
    border.borderWidth = width
    self.layer.addSublayer(border)
    self.layer.masksToBounds = true
        
        
}

override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
}
required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
}
}
