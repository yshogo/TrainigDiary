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
    
    @IBAction func touchSegmentedControl(_ sender: Any) {
        
        let segmentedTouchUtil = SegmentedTouchUtil()
        segmentedTouchUtil.touchUtil(sender)
    }
    
}
