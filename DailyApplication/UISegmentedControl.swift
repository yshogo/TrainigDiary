//
//  UISegmentedControl.swift
//  DailyApplication
//
//  Created by 山田尚吾 on 2016/11/19.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import UIKit

class UISegmentedControl : UIView{
    
    
    //成功時のコンストラクタ
    override init(frame: CGRect){
        super.init(frame: frame)

        //表示するタブの種類
        let items = ["Entrys","Calender","Dairy"]
        let sc = UISegmentedControl(items:items)
        
        
        
    }
    
    //エラー時のファイル
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
