//
//  CustomCell.swift
//  DailyApplication
//
//  Created by 山田尚吾 on 2016/11/24.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell{
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weeklyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    //ラベルにデータをセットするテキスト
    func setCell(diaryData:DiaryData){
        dateLabel.text = String(diaryData.date)
        weeklyLabel.text = diaryData.weekday
        titleLabel.text = diaryData.title
        subTitleLabel.text = diaryData.subTitle
    }
    
}
