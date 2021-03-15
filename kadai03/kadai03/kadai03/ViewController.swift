//
//  ViewController.swift
//  kadai03
//
//  Created by Kaoru Matarai on 2020/08/18.
//  Copyright © 2020 shinonome, inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var leapLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func leapYear(_ sender: UIButton) {
        
        if let field = numberTextField.text,
           let numYear = Int(field) {
            if (numYear <= 0) {
                leapLabel.text = "0以下の値が入力されています"
            }
            else if (numYear%400 == 0) || (numYear%4 == 0 && numYear%100 != 0) {
                leapLabel.text = "\(numYear) is leap year"
            }
            else {
                leapLabel.text = "\(numYear) is not leap year"
            }
        } else {
            if (numberTextField.text == "") {
                leapLabel.text = "値が入力されていません"
            }
            else {
                leapLabel.text = "数字を入力してください"
            }
        }
        numberTextField.text = ""
    }
}
