//
//  DateManager.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2017/01/01.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit


/// 日付を操作するクラス
class DateManager : NSObject{
    
    /// 選択された日
    var selectDay = Date()
    
    /// 月始め
    var biginDay = Date()
    
    /// 月終わり
    var endDay = Date()
    
    /// 現在のカレンダーを取得
    let calendar = Calendar.current
    
    /// 月カレンダーの始点になる日を求める
    ///
    /// - Returns: 最初の日
    func BeginOfMonthCalender() -> Date{
        
        //日付の要素を1日にする
        var components = calendar.dateComponents([.year,.month,.day], from: selectDay)
        components.day = 1
        let firstOfMonth = Calendar.current.date(from: components)
        
        //曜日を調べて、その要素数だけ戻ったものがカレンダーの左上(日曜日=1 土曜日=7　なので1足した状態で戻る)
        let dayOfWeek = calendar.component(.weekday,from:firstOfMonth!)
        
        return calendar.date(byAdding: .day, value: 1-dayOfWeek, to: firstOfMonth!)!
    }
    
    /// 月カレンダーの終点になる日を求める
    ///
    /// - Returns: 最後の日
    func EndOfMonthCalendar() ->Date{
        
        //次の月初めを取得
        let nextmonth = calendar.nextDate(after: selectDay, matching: DateComponents(day:1), matchingPolicy: Calendar.MatchingPolicy.nextTime)
        
        //曜日を調べて、その要素数だけ進んだものが右下(次の月の初めで計算している事に注意)
        let dayOfWeek = calendar.component(.weekday,from: nextmonth!)
        
        return calendar.date(byAdding: .day, value: 7-dayOfWeek, to: nextmonth!)!
    }
    
    /// 月ごとのセルの数を出すメソッド
    ///
    /// - Returns:月ごとのセルの数
    func daysAcquisition() -> Int{
        
        //始まりの日と終わりの日を取得
        biginDay = BeginOfMonthCalender()
        endDay = EndOfMonthCalendar()
        
        //始点から終点の日数
        return calendar.dateComponents([.day], from:biginDay ,to:endDay).day! + 1
    }
    
    /// カレンダーの始点から指定した日数を加算した日付を返す
    ///
    /// - Parameter index: 指定した日数
    /// - Returns: 日付
    func conversionDateFormat(index: Int)->String{
        
        let currentday = calendar.date(byAdding: .day, value: index, to: biginDay)
        
        return calendar.component(.day, from: currentday!).description
    }
    
}
