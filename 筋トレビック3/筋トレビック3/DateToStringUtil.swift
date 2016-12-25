//
//  DateToStringUtil.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2016/12/25.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import Foundation


/// Date型をString型に変換
class DateToStringUtil{
    
    
    /// Date型をyyyy年MM月dd日の形にして返す
    ///
    /// - Parameter date: Date型
    /// - Returns: yyyy年MM月dd日形式の文字列
    static func dateToString(date: NSDate) -> String{
        
        let date_formatter: DateFormatter = DateFormatter()
        
        date_formatter.locale     = NSLocale(localeIdentifier: "ja") as Locale!
        date_formatter.dateFormat = "yyyy年MM月dd日 "
        
        return date_formatter.string(from: date as Date)
    }
}
