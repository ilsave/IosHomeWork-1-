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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func celsiusEditChanged(_ sender: Any) {
        if (textFieldCelsius.hasText){
            let kelvin: Double = Double(textFieldCelsius.text!)! - 273.15
            textFieldKelvin.text = String(format: "%.2f", kelvin)
            
            let far: Double = (Double(textFieldCelsius.text!)! - 273.15) * 9 / 2 + 32
                   textFieldFahrenheit.text = String(format: "%.2f", far)
        } else {
            textFieldFahrenheit.text = ""
            textFieldKelvin.text = ""
        }
    }
    
    
    @IBAction func kelvinEditChanged(_ sender: Any) {
        if (textFieldKelvin.hasText){
            let cel: Int = Int(textFieldKelvin.text!)! - 273
            textFieldCelsius.text = String(cel)
            
            //(0 K − 273,15) × 9/5 + 32 = -459,7 °F
            let far: Double = (Double(textFieldKelvin.text!)! - 273.15) * 9 / 2 + 32
                   textFieldFahrenheit.text = String(far)
        } else {
            textFieldCelsius.text = ""
            textFieldFahrenheit.text = ""
        }
    }
    
    
    @IBAction func fahrenheitEditChanged(_ sender: Any) {
        if (textFieldFahrenheit.hasText){
           // (32 °F − 32) × 5/9 = 0 °C
            let cel: Double = (Double(textFieldFahrenheit.text!)! - 32) * 5 / 9
            textFieldCelsius.text = String(format: "%.2f", cel)
            
            //(32 °F − 32) × 5/9 + 273,15 = 273,15 K
            let kelvin: Double = (Double(textFieldFahrenheit.text!)! - 32) * 5 / 9 + 273.15
            textFieldKelvin.text = String(format: "%.2f", kelvin)
        } else {
            textFieldCelsius.text = ""
            textFieldKelvin.text = ""
        }
    }
    
    

}
extension UIViewController: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        return true
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
