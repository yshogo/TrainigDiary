//
//  SegmentedTouchUtil.swift
//  DailyApplication
//
//  Created by 山田尚吾 on 2016/11/24.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import UIKit

class SegmentedTouchUtil : UIViewController{
    
    //ヘッダーのクリックイベントを拾うメソッド
    func touchUtil(_ sender: Any){
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            print("0が押されました")
        case 1:
            print("1が押されました")
        case 2:
            print("2が押されました")
        default:
            print("該当なし")
        }

    }
}
