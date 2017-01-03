//
//  CalendarCellViewController.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2017/01/01.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class CalendarCellViewController : UICollectionViewCell{
    
    /// 日付の表示
    var textLabel:UILabel!
    var compLabel:UILabel!
    
    
    /// コンストラクタ
    ///
    /// - Parameter aDecoder: <#aDecoder description#>
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //日付ラベルの生成
        addDateLabel()
        //コンプラベルの生成
        addCompLabel()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    /// 日付ラベル生成
    private func addDateLabel(){
        // 日付ラベル
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:self.frame.width, height:self.frame.height))
        textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        textLabel.textAlignment = NSTextAlignment.center
        self.addSubview(textLabel!)
        
    }
    
    /// コンプラベルの生成
    private func addCompLabel(){
        // コンプラベル
        compLabel = UILabel(frame: CGRect(x:0, y:15, width:self.frame.width, height:self.frame.height))
        compLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        compLabel.textAlignment = NSTextAlignment.center
        self.addSubview(compLabel!)
    }
}
