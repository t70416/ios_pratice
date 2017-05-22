//
//  ViewController.swift
//  Time
//
//  Created by 湯惟任 on 2017/1/26.
//  Copyright © 2017年 湯惟任. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer?
    var sec:Int = 0;
    var countTime  = 0;
    
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var clock: UIDatePicker!
    @IBOutlet weak var timeUp: UILabel!
    @IBOutlet weak var secText: UILabel!
    @IBOutlet weak var zeroText: UILabel!
    
    
    
    @IBAction func start(_ sender: UIButton) {
        startBtn.isEnabled = false;
        stopBtn.isEnabled = true;
        timeUp.text = "";
        zeroText.isHidden = true;
        stepper.isEnabled = false;
        sec = Int(stepper.value);
        countTime  = Int(clock.countDownDuration)+sec;
        clock.isEnabled  = false ;
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: ("countDown"), userInfo: nil, repeats: true)
        
    }
    
    func countDown(){
        sec-=1;
        countTime-=1;
        if(sec == -1){
            if (countTime <= 0) {
                timeUp.isHidden  = false;
                timeUp.text  = "時間到";
                stop();
            }else{
                sec = 59;
                secText.text = "\(sec)"
                clock.countDownDuration = TimeInterval(countTime);
                if(countTime<60){
                    zeroText.isHidden  = false;
                    zeroText.text  = "0分鐘"
                }
            }
        }else{
            secText.text = "\(sec)";
        }
    }
    
    func stop() -> Void {
        stopBtn.isEnabled = false;
        startBtn.isEnabled = true;
        clock.isEnabled = true;
        stepper.isEnabled  = true;
        timer!.invalidate();
        timer = nil;
    }
    @IBAction func stop(_ sender: UIButton) {
        stop();
    }
    @IBAction func stepperClick(_ sender: UIStepper) {
        secText.text = "\(Int(stepper.value))"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        clock.datePickerMode = UIDatePickerMode.countDownTimer;
        stepper.maximumValue = 59;
        stepper.minimumValue = 0;
        //zeroText.text  = "0分鐘";
        secText.text = "0";
        stopBtn.isEnabled = false;
        timeUp.isHidden = true;
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

