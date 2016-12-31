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


/// 内部DBに保存するクラス
class Big3Dao{
    
    /// データを保存する
    ///
    /// - Parameter big3DataModel: 保存するデータを格納したデータモデル
    func saveData(big3DataModel:Big3DataModel){
        
        /* Get ManagedObjectContext from AppDelegate */
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext: NSManagedObjectContext = appDelegate.managedObjectContext
        
        /* Create new ManagedObject */
        let entity = NSEntityDescription.entity(forEntityName: "Big3Entity", in: managedContext)
        let transc = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        //set the entity values
        transc.setValue(big3DataModel.date, forKey: "date")
        transc.setValue(big3DataModel.big3, forKey: "big3")
        transc.setValue(big3DataModel.maxweight, forKey: "maxweight")
        transc.setValue(big3DataModel.lepNum, forKey: "lepNum")
        
        //save the object
        do {
            try managedContext.save()
            print("保存されたよー!")
        } catch let error as NSError  {
            print("保存に失敗しました \(error), \(error.userInfo)")
        } catch {
            print("想定外のエラー")
        }
    }
    
    /// ビック3のデータを全件取得する
    func getTranscriptions () -> Array<Big3DataModel> {
        
        /* Get ManagedObjectContext from AppDelegate */
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.managedObjectContext
        
        /* Set search conditions */
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Big3Entity")
        
        
        var big3DataModelList = Array<Big3DataModel>()
        /* Get result array from ManagedObjectContext */
        do {
            let fetchResults = try manageContext.fetch(fetchRequest)
            print ("num of results = \(fetchResults.count)")
            
            for var row in fetchResults as! [NSManagedObject]{
                let model = Big3DataModel()
                model.date = row.value(forKey: "date") as! String
                model.big3 = row.value(forKey: "big3") as! String
                model.lepNum = row.value(forKey: "lepNum") as! String
                model.maxweight = row.value(forKey: "maxweight") as! String
                
                big3DataModelList.append(model)
            }
        } catch {
            print("想定外のエラー")
        }
        
        return big3DataModelList
    }
}

