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
    
    var appDelegate:AppDelegate
    var manageContext:NSManagedObjectContext
    var fetchRequest:NSFetchRequest<NSFetchRequestResult>
    
    
    /// コンストラクタ
    init() {
        /* Get ManagedObjectContext from AppDelegate */
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        manageContext = appDelegate.managedObjectContext
        
        /* Set search conditions */
        fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Big3Entity")
    }
    
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
        
        var big3DataModelList = Array<Big3DataModel>()
        
        /* Get result array from ManagedObjectContext */
        do {
            let fetchResults = try manageContext.fetch(fetchRequest)
            
            for var row in fetchResults as! [NSManagedObject]{
                let model = Big3DataModel()
                model.date = row.value(forKey: "date") as! String
                model.big3 = row.value(forKey: "big3") as! String
                model.maxweight = row.value(forKey: "maxweight") as! String
                
                big3DataModelList.append(model)
            }
            
        } catch {
            print("想定外のエラー")
        }
        
        return big3DataModelList
    }
    
    
    /// 同じ日付の要素のデータを削除する
    ///
    /// - Parameter model: <#model description#>
    public func deleteBig3DataModel(model: Big3DataModel){
        
        do {
            let fetchResults = try manageContext.fetch(fetchRequest)
            
            for var row in fetchResults {
                
                if (row as AnyObject).value(forKey: "date") as! String == model.date{
                    
                    //データを削除する
                    let recode = row as! NSManagedObject
                    manageContext.delete(recode)
                }
                
                //削除後データを登録し直す
                try manageContext.save()
            }
            
            print("削除完了")
            
        } catch {
            
            print("削除に失敗したよ")
        }
        
    }
    
    
    /// 日付からオブジェクトを返す
    ///
    /// - Parameter date: 検索したいオブジェクト
    /// - Returns: データオブジェクト(データが見つからない場合はからのデータオブジェクトを返す)
    func getBig3DataModdel(date : String) -> Big3DataModel {
        
        
        let model = Big3DataModel()
        
        /* Get result array from ManagedObjectContext */
        do {
            let fetchResults = try manageContext.fetch(fetchRequest)
            
            for var row in fetchResults {
                
                if (row as AnyObject).value(forKey: "date") as! String == date{
                    
                    model.date = (row as AnyObject).value(forKey: "date") as! String
                    model.big3 = (row as AnyObject).value(forKey: "big3") as! String
                    model.maxweight = (row as AnyObject).value(forKey: "maxweight") as! String
                }
            }
            
            //見つからない場合はnilを返す
            return model
            
        } catch {
            print("想定外のエラー")
            return model
        }
    }
}

