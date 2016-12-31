//
//  Big3DataModel.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2016/12/29.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import Foundation


/// 内部DBに保存するデータオブジェクト
class Big3DataModel{
    
    var date:String
    var big3:String
    var maxweight:String
    var lepNum:String
    
    
    /// イニシャライザ
    ///
    /// - Parameters:
    ///   - date: 日付
    ///   - big3: 種類
    ///   - maxweight: 最大重量
    ///   - lepNum: レップ数
    init(date:String ,big3:String,maxweight:String,lepNum:String) {
        
        self.date = date
        self.big3 = big3
        self.maxweight = maxweight
        self.lepNum = lepNum
    }
    
    
}
