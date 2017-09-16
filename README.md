# PVRadioButton
Radio Button and Radio Buttons View for iOS apps, Swift

This library allows you to easily add Radio Buttons to your views in two ways.

1) You can set PVRadioButton class as Custom class to your Buutton, then you can set title, color etc attributes to the button from Attributes Inspector and add those buttons to radio button group. you can have any number of groups.

2) You can just add a view and set its custom class as PVRadioButtonView, and pass array of button titles to it, it will create list of radio buttons with those titles and place in that view. you can either choose that list to be scrollable or non - scrollable from attribute inspector.

# Preview

![alt tag](https://user-images.githubusercontent.com/9430941/30505101-5542d9ac-9a90-11e7-9470-0bda5e39d7e5.png)

# Usage

You can use in two ways as I mentioned above.

First Drag and drop PVRadioButton folder into your app, then

1) for manually added buttons, You can set PVRadioButton Class as Custom class to your Button and add them to the group as below.

        var radioButtonGroup = PVRadioButtonGroup()
        radioButtonGroup.appendToRadioGroup(radioButtons: [button1,button2])
        radioButtonGroup.appendToRadioGroup(radioButtons: [button3,button4])
        
Here button1, button2 will be in one group and button3,button4 will be added to other group and ViewController has to implement RadioButtonGroupDelegate and set  RadioButtonGroupDelegate to itself as below
                
        radioButtonGroup.delegate = self
        
and implement following method

        func radioButtonClicked(button: PVRadioButton) {
          print(button.titleLabel?.text ?? "")
        }
        
  Here you will get button which is clicked.

2) You can just add a view  and set its custom class to  PVRadioButtonView and create outlet to it  and pass array of string i.e. array of button titles as below

        @IBOutlet weak var radioView: PVRadioButtonView!
        radioView.addButtons(radioButtonTitles: ["India","Usa","China","Japan","Argentina","Armenia"])
 and viewcontroller has to implement RadioButtonViewDelegate and set it to itself as below 
 
        radioView.delegate = self
        
 and implement following method
 
    func radioButtonClickedInView(button: PVRadioButton) {
        print(button.titleLabel?.text ?? "")
    }
    
 Here you will get button which is clicked.
 
If you want it to be scrollable you can set buttonHeight and isScrollable to true from attributes inspector, if you set  isScrollable to false it will adjust buttons height so that it all buttons fit in view.you can set various attributes from attributes inspector and change colors and heights according to your requirements.
