//
//  ReturnContoroller.swift
//  MyTODO
//
//  Created by Ryota on 2020/07/10.
//

import UIKit

class ReturnContoroller: UIViewController {
    
    @IBAction func  TodoReturnButton(_ sender:Any){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
