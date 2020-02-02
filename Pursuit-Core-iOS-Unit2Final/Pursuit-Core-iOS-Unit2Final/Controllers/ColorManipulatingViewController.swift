//
//  ColorManipulatingViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Liana Norman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorManipulatingViewController: UIViewController {
    
    var color: Crayon!
    var originalColor: Crayon!
    
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var resetColorButton: UIButton!
    @IBOutlet weak var liveRedSliderValue: UILabel!
    @IBOutlet weak var liveGreenSliderValue: UILabel!
    @IBOutlet weak var liveBlueSliderValue: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBAction func resetColorsButton(_ sender: Any) {
        setUpViews()
        print(alphaStepper.value)
    }
    
    
    @IBAction func alphaStepperChanged(_ sender: Any) {
        updateBackgroundColor()
        alphaValueLabel.text = "This is the ALPHA value: \(alphaStepper.value)"
    }
    
    @IBAction func sliderColorChange(_ sender: UISlider) {
        switch sender.tag {
        case 0:
           updateBackgroundColor()
            liveRedSliderValue.text = "This is the RED value: \(String(sender.value))"
        case 1:
            updateBackgroundColor()
            liveGreenSliderValue.text = "This is the GREEN value: \(String(sender.value))"
        case 2:
            updateBackgroundColor()
            liveBlueSliderValue.text = "This is the BLUE value: \(String(sender.value))"
        default:
            print("Something happened")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    
    func updateBackgroundColor() {
        self.view.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepper.value))
    }
    
    func setUpViews() {
        colorName.text = color.name
        redSlider.value = Float(color.convertHexToCGFloatNumber(color: color.red))
        greenSlider.value = Float(color.convertHexToCGFloatNumber(color: color.green))
        blueSlider.value = Float(color.convertHexToCGFloatNumber(color: color.blue))
        view.backgroundColor = UIColor(red: color.convertHexToCGFloatNumber(color: color.red), green: color.convertHexToCGFloatNumber(color: color.green), blue: color.convertHexToCGFloatNumber(color: color.blue), alpha: 1.0)
        liveRedSliderValue.text = "This is the RED value: \(color.convertHexToCGFloatNumber(color: color.red))"
        liveGreenSliderValue.text = "This is the GREEN value: \(color.convertHexToCGFloatNumber(color: color.green))"
        liveBlueSliderValue.text = "This is the BLUE value: \(color.convertHexToCGFloatNumber(color: color.blue).description)"
        alphaValueLabel.text = "This is the ALPHA value: \(alphaStepper.value)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
