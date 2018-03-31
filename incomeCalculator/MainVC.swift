//
//  ViewController.swift
//  incomeCalculator
//
//  Created by Andrew Tuzson on 3/31/18.
//  Copyright © 2018 Andrew Tuzson. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var monthlyIncomeLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    var stringWage = ""
    var hourlyWage = 0.0
    var monthlyIncome = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCalcButton()
        monthlyIncomeLabel.isHidden = true
        incomeLabel.isHidden = true
    }

    @IBAction func clearCalcButtonPressed(_ sender: Any) {
        textField.text = ""
        monthlyIncomeLabel.isHidden = true
        incomeLabel.isHidden = true
    }
    
    func setCalcButton() {
        let calcButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width
            , height: 50))
        calcButton.backgroundColor = #colorLiteral(red: 0.9363400936, green: 0.5400078297, blue: 0.014057789, alpha: 1)
        calcButton.setTitle("Calculate", for: .normal)
        calcButton.addTarget(self, action: #selector(calculateIncome), for: .touchUpInside)
        textField.inputAccessoryView = calcButton
    }
    
    @objc func calculateIncome() {
        stringWage = textField.text!
        hourlyWage = Double(stringWage)!
        monthlyIncome = (hourlyWage * 40) * 4.3
        monthlyIncomeLabel.isHidden = false
        incomeLabel.isHidden = false
        incomeLabel.text = String(monthlyIncome)
        textField.text = ""
        self.view.endEditing(true)
    }
    

}

