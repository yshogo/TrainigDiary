//
//  CalenderViewControler.swift
//  DailyApplication
//
//  Created by 山田尚吾 on 2016/11/26.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import UIKit

class CalenderViewControler : UIViewController{
    
    //最初に呼ばれるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedControl(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0://「Entry」が押されたとき
            let calendarViewControler = self.storyboard!.instantiateViewController( withIdentifier: "EntriesViewControler") as! ViewController
            self.present(calendarViewControler,animated: false,completion: nil)
            
        case 1://「Calendar」が押されたとき
            
            let calendarViewControler = self.storyboard!.instantiateViewController( withIdentifier: "CalenderViewControler") as! CalenderViewControler
            self.present(calendarViewControler,animated: false,completion: nil)
            
        case 2://「」が押されたとき
            
            let calendarViewControler = self.storyboard!.instantiateViewController( withIdentifier: "DairyViewControler") as! DairyViewControler
            self.present(calendarViewControler,animated: false,completion: nil)
            
        default:
            print("該当なし")
        }
    }
    
}
