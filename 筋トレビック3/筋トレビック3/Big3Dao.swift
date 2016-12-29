//
//  Big3Dao.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2016/12/29.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Big3Dao{
    
    
    /// データを保存する
    ///
    /// - Parameter big3DataModel: 保存するデータを格納したデータモデル
    func saveData(big3DataModel:Big3DataModel){
        
        let context = getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Big3Entity", in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        transc.setValue(big3DataModel.date, forKey: "date")
        transc.setValue(big3DataModel.big3, forKey: "big3")
        transc.setValue(big3DataModel.maxweight, forKey: "maxweight")
        transc.setValue(big3DataModel.lepNum, forKey: "lepNum")
        
        //save the object
        do {
            try context.save()
            print("保存されたよー!")
        } catch let error as NSError  {
            print("保存に失敗しました \(error), \(error.userInfo)")
        } catch {
            print("想定外のエラー")
        }
    }
    
    
    /// COntextを取得する
    ///
    /// - Returns:コンテキスト
    private func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
