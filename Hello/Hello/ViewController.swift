//
//  ViewController.swift
//  Hello
//
//  Created by 湯惟任 on 2017/1/21.
//  Copyright © 2017年 湯惟任. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lab_msg: UILabel!
    @IBOutlet weak var lab_phoneNumber: UILabel!
    @IBAction func number_btn(_ sender: UIButton) {
        lab_phoneNumber.text = lab_phoneNumber.text! + sender.currentTitle!;
        
    }
    @IBAction func sure(_ sender: UIButton) {
        if(lab_phoneNumber.text?.lengthOfBytes(using: String.Encoding.utf8) == 10){
            lab_msg.text = "撥打電話："+lab_phoneNumber.text!;
        }else{
            lab_msg.text = "請輸入電話號碼";
        }
        
    }
    @IBAction func clear(_ sender: UIButton) {
        lab_phoneNumber.text = "";
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

