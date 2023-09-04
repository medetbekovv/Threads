//
//  BorderedTextField.swift
//  Threads
//
//  Created by Sultan on 18/8/23.
//

import UIKit
import SnapKit


class BorderedTextField : UITextField {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.sublayers?.forEach { if $0.name == "bottomLine" { $0.removeFromSuperlayer() } }
        
        font = R.font.sfProDisplayRegular(size: 15)
        
        let bottomLine = CALayer()
        bottomLine.name = "bottomLine"
        bottomLine.frame = CGRect(x: 0, y: bounds.height - 1, width: bounds.width, height: 1)
//        bottomLine.backgroundColor = UIColor(named: "GreyButtonBorder")?.cgColor
        bottomLine.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        layer.addSublayer(bottomLine)
    }
    
}
