//
//  ViewController.swift
//  BasicTest
//
//  Created by 湯惟任 on 2017/1/23.
//  Copyright © 2017年 湯惟任. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var image = ["11846541_1210125715679582_1262683766879127458_n","11953341_1125251757499988_8751467492206780834_o","12307944_1652788414990892_4715961764271645748_o","237299"];
    var imageN:Array<UIImage> = [];
    //var p:Int = 0;
    var count:Int = 0;
    
    
    @IBOutlet weak var showImage: UIImageView!
    
    
    @IBAction func start(_ sender: UIButton) {
        showImage.startAnimating();
        
    }
    
    @IBAction func stop(_ sender: UIButton) {
        showImage.stopAnimating();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        count = image.count;
        for  i in 0 ..< count{
            imageN.append(UIImage(named : image[i])!);
        }
        showImage.animationImages = imageN;//選擇播放來源
        showImage.animationDuration = TimeInterval(count * 2);//每張圖播放時間
        showImage.layer.borderColor = UIColor.brown.cgColor;//設定編筐
        showImage.layer.borderWidth = 4;//編筐大小
        showImage.layer.cornerRadius = 30;//圓角角度
        showImage.layer.masksToBounds = true;//圖層遮罩
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

