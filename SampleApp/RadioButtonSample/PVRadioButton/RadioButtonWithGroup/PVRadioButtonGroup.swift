//
//  RadioButtonGroup.swift
//  RadioButton
//
//  Created by Venkatesh P1 on 9/13/17.
//  Copyright © 2017 Venkatesh P1. All rights reserved.
//

import Foundation
import UIKit
protocol RadioButtonGroupDelegate {
    func radioButtonClicked(button: PVRadioButton)
}
class PVRadioButtonGroup {
    var delegate: RadioButtonGroupDelegate?
    var radioButtonsGroup = [String:[PVRadioButton]]()
        
    func appendToRadioGroup(radioButtons: [PVRadioButton]) {
        let totalGroups = radioButtonsGroup.keys.count
        let newGroupName = "group_\(totalGroups)"
        var buttonsInGroup = [PVRadioButton]()
        for button in radioButtons {
            button.addTarget(self, action: #selector(PVRadioButtonGroup.updateButtons(button:)), for:UIControlEvents.touchUpInside)
            button.radioGroupName = newGroupName
            buttonsInGroup.append(button)
        }
        buttonsInGroup = Array(Set(buttonsInGroup))
        radioButtonsGroup[newGroupName] = buttonsInGroup
    }
    
    @objc func updateButtons(button:PVRadioButton) {
        if let radioGroup = radioButtonsGroup[button.radioGroupName] {
            for lbutton in radioGroup {
                if lbutton != button {
                    lbutton.isRadioSelected = false
                } else {
                    lbutton.isRadioSelected = true
                }
            }
        }
        delegate?.radioButtonClicked(button: button)
    }
    
    func removeButtons() {
        radioButtonsGroup.removeAll()
    }
    
    
}
