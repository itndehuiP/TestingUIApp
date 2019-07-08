//
//  ViewController.swift
//  TestingUIApp
//
//  Created by Guerson on 7/5/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var agreementButton: UIButton!
    @IBOutlet weak var condominiumPicker: UIPickerView!
    private var condDataSource : [ FRACondominium] = [ ]
    var agreement = false
    private var condoURL = "urlservrest"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FRACondominiumPickerDataSource().getCondominiums() { (condominiumData: [FRACondominium]) in
            self.condDataSource = condominiumData
            DispatchQueue.main.async {
                self.condominiumPicker.reloadAllComponents()
            }
        }
    }


    @IBAction func checkButtonTouchUp(_ sender: UIButton) {
        agreement = !agreement
        if agreement {
            agreementButton.isSelected = true
            agreementButton.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            agreementButton.setImage(UIImage(named: "unchecked"), for: .normal)
        }
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return condDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return condDataSource[row].condominuim
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        condoURL = condDataSource[row].baseURL ?? condoURL
        print(condoURL)
    }
    
}
