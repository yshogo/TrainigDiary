//
//  DiaryData.swift
//  DailyApplication
//
//  Created by 山田尚吾 on 2016/11/24.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import Foundation

///一つのセルに表示するデータを格納するオブジェクト
class DiaryData : NSObject {
    
    var date:Int
    var weekday:String
    var title:String
    var subTitle:String
    
    ///コンストラクタ
    init(date:Int,weekday:String,title:String,subTitle:String) {
        self.date = date
        self.weekday = weekday
        self.title = title
        self.subTitle = subTitle
    }
    
}
