//
//  CalendarCellViewController.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2017/01/01.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class CalendarCellViewController : UICollectionViewCell{
    
    /// セルの中に表示するラベル
    var textLabel:UILabel!
    
    /// コンストラクタ
    ///
    /// - Parameter aDecoder: <#aDecoder description#>
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // UILabelを生成
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:self.frame.width, height:self.frame.height))
        textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        textLabel.textAlignment = NSTextAlignment.center
        // Cellに追加
        self.addSubview(textLabel!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
}
