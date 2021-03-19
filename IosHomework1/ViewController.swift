//
//  ViewController.swift
//  IosHomework1
//
//  Created by Gushchin Ilya on 16.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFieldKelvin: UITextField!
    @IBOutlet var textFieldCelsius: UITextField!
    @IBOutlet var textFieldFahrenheit: UITextField!
    
    let kelvinDifference: Double = 273.15
    let fahrenheitCofficient: Double = 9 / 5
    let fahrenheitCofficientReversed: Double = 5 / 9
    let fahrenheitDifference: Double = 32
    let twoNumbersLeft: Double = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func celsiusEditChanged(_ sender: Any) {
        
        guard textFieldCelsius.hasText else {
            textFieldFahrenheit.text = ""
            textFieldKelvin.text = ""
            return
        }
        
        guard let celsiusText = textFieldCelsius.text else {
            return
        }
    
        
        let kelvin: Double = Double(celsiusText)! - kelvinDifference
        let kelvinRounded = Double(round(twoNumbersLeft*kelvin)/twoNumbersLeft)
        textFieldKelvin.text = String(kelvinRounded)
        
        // textFieldKelvin.text = String(format: "%.2f", kelvin)
        
        let far: Double = (Double(celsiusText)! - kelvinDifference) * fahrenheitCofficient + fahrenheitDifference
        textFieldFahrenheit.text = String(format: "%.2f", far)
    }
    
    
    
    
    @IBAction func kelvinEditChanged(_ sender: Any) {
        if (textFieldKelvin.hasText){
            let cel: Double = Double(textFieldKelvin.text!)! - kelvinDifference
            textFieldCelsius.text = String(cel)
            
            //(0 K − 273,15) × 9/5 + 32 = -459,7 °F
            let far: Double = (Double(textFieldKelvin.text!)! - kelvinDifference) * fahrenheitCofficient + fahrenheitDifference
                   textFieldFahrenheit.text = String(far)
        } else {
            textFieldCelsius.text = ""
            textFieldFahrenheit.text = ""
        }
    }
    
    
    @IBAction func fahrenheitEditChanged(_ sender: Any) {
        if (textFieldFahrenheit.hasText){
           // (32 °F − 32) × 5/9 = 0 °C
            let cel: Double = (Double(textFieldFahrenheit.text!)! - fahrenheitDifference) * fahrenheitCofficientReversed
            textFieldCelsius.text = String(format: "%.2f", cel)
            
            //(32 °F − 32) × 5/9 + 273,15 = 273,15 K
            let kelvin: Double = (Double(textFieldFahrenheit.text!)! - fahrenheitDifference) * fahrenheitCofficientReversed + kelvinDifference
            textFieldKelvin.text = String(format: "%.2f", kelvin)
        } else {
            textFieldCelsius.text = ""
            textFieldKelvin.text = ""
        }
    }
}

