//
//  ViewController.swift
//  RadioButton
//
//  Created by Venkatesh P1 on 9/13/17.
//  Copyright © 2017 Venkatesh P1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RadioButtonGroupDelegate, RadioButtonViewDelegate {

    @IBOutlet weak var button1: PVRadioButton!
    @IBOutlet weak var button2: PVRadioButton!
    @IBOutlet weak var button3: PVRadioButton!
    @IBOutlet weak var button4: PVRadioButton!
    var radioButtonGroup: PVRadioButtonGroup!
    @IBOutlet weak var radioView: PVRadioButtonView!
    @IBOutlet weak var unScrollableRadioview: PVRadioButtonView!
    override func viewDidLoad() {
        super.viewDidLoad()
          //To add independent buttons to single Group
        radioButtonGroup = PVRadioButtonGroup()
        radioButtonGroup.delegate = self
        radioButtonGroup.appendToRadioGroup(radioButtons: [button1,button2])
        radioButtonGroup.appendToRadioGroup(radioButtons: [button3,button4])
        
        // To Create, add buttons and add to Group buttons
        radioView.addButtons(radioButtonTitles: ["India","Usa","China","Japan","Argentina","Armenia"])
        unScrollableRadioview.addButtons(radioButtonTitles:  ["India","Usa","China","Japan","Argentina","Armenia"])
        radioView.delegate = self
        unScrollableRadioview.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func radioButtonClicked(button: PVRadioButton) {
        print(button.titleLabel?.text ?? "")
    }
    
    func radioButtonClickedInView(button: PVRadioButton) {
        print(button.titleLabel?.text ?? "")
    }
}

