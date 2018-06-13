//
//  RadioButton.swift
//  iHF-MobileApp
//
//  Created by Venkatesh P1 on 9/13/17.
//  Copyright © 2017 venkatesh. All rights reserved.
//

import UIKit

@IBDesignable
class PVRadioButton: UIButton {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    var isRadioSelected = false {
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var radioButtoncolor: UIColor = UIColor.blue{
        didSet{
            setNeedsDisplay()
        }
    }

    @IBInspectable var buttonTitleColor: UIColor = UIColor.blue{
        didSet{
            adjustButtonTitle()
        }
    }

    @IBInspectable var spaceBetweenTextAndRadioButton:CGFloat = 10{
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var buttonTitle:String = "" {
        didSet{
            adjustButtonTitle()
        }
    }
    
    @IBInspectable var buttonTitleSize:CGFloat = 10 {
        didSet{
            adjustButtonTitle()
        }
    }



    var radioGroupName = ""
        
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x:bounds.height/2, y: bounds.height/2)
        let arcWidth: CGFloat = bounds.height > 4 ? 2 : bounds.height/8
        let circleRadius = (bounds.height/2 > 10 ? 10 : bounds.height/2)  - arcWidth
        let path = UIBezierPath(arcCenter: center, radius: circleRadius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path.lineWidth = arcWidth
        radioButtoncolor.setStroke()
        path.stroke()
        self.titleEdgeInsets.left = (center.x + circleRadius) + spaceBetweenTextAndRadioButton
        adjustButtonTitle()
        setRadioButtonStatus()
    }
    
    func setRadioButtonStatus() {
        let center = CGPoint(x:bounds.height/2, y: bounds.height/2)
        let arcWidth: CGFloat = bounds.height > 4 ? 2 : bounds.height/8
        let circleRadius = (bounds.height/2 > 10 ? 10 : bounds.height/2)  - arcWidth
        if isRadioSelected {
            let radius: CGFloat = circleRadius - (circleRadius/2)
            let path1 = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
            radioButtoncolor.setFill()
            path1.fill()
        } else {
            let radius: CGFloat = circleRadius - (circleRadius/2)
            let path1 = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
            UIColor.clear.setFill()
            path1.fill()
        }
    }
    
    func adjustButtonTitle() {
        self.setTitleColor(buttonTitleColor, for: UIControlState.normal)
        self.setTitle(buttonTitle, for: UIControlState.normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: buttonTitleSize)
        self.contentHorizontalAlignment = .left

    }

}
