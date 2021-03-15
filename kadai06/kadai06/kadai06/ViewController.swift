//
//  ViewController.swift
//  kadai06
//
//  Created by Kaoru Matarai on 2020/08/18.
//  Copyright © 2020 shinonome, inc. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://qiita.com/api/v2/items?page=1&per_page=20").responseJSON {
            res in
            if res.result.isSuccess {
                if let returnValue = res.result.value {
                    print(JSON(returnValue))
                }
            } else {
                print("Error!")
            }
        }
    }
}
