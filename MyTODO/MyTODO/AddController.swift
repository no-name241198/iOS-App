//
//  AddController.swift
//  MyTODO
//
//  Created by Ryota on 2020/07/10.
//

//  AddController.swift
import UIKit

//変数の設置
var TodoKobetsunonakami = [String]()

class AddController: UIViewController {

    //テキストフィールドの設定
    @IBOutlet weak var TodoTextField: UITextField!
    
    @IBAction func TodoReturnButton(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }

    //追加ボタンの設定
    @IBAction func TodoAddButten(_ sender: Any) {
        //変数に入力内容を入れる
        TodoKobetsunonakami.append(TodoTextField.text!)
        //追加ボタンを押したらフィールドを空にする
        TodoTextField.text = ""
        //変数の中身をUDに追加
        UserDefaults.standard.set( TodoKobetsunonakami, forKey: "TodoList" )
        self.dismiss(animated: true, completion: nil)
    }
    
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

