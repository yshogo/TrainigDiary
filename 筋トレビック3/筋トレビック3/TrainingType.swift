//
//  TrainingType.swift
//  筋トレビック3
//
//  Created by  on 2017/01/03.
//  Copyright © 2017年 . All rights reserved.
//

import Foundation

enum TrainingTypeEnum{
    case NONE
    case BENCH_PRESS
    case SCWATTO
    case DEAD_LIFT
}

class TrainingType{
    
    
    /// トレーニングタイプを決定する
    ///
    /// - Parameter date: 選択された日付
    /// - Returns: トレーニングタイプ
    func isTraingType(date: String) -> TrainingTypeEnum{
        
        let big3Dao = Big3Dao()
        let localDataList = big3Dao.getTranscriptions()
        
        for model in localDataList{
            //日付が等しいデータの中で
            if model.date == date{
                
                switch model.big3 {
                    case "ベンチプレス":
                        return TrainingTypeEnum.BENCH_PRESS
                    case "スクワット":
                        return TrainingTypeEnum.SCWATTO
                    default:
                        return TrainingTypeEnum.DEAD_LIFT
                }
            }
        }
        
        //見つからない場合はNONEを返す
        return TrainingTypeEnum.NONE
    }
}


