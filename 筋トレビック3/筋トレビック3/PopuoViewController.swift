//
//  PopuoViewController.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2017/01/15.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class PopuoViewController : UIViewController{
    
    @IBOutlet weak var trainingTypeLabel: UILabel!
    @IBOutlet weak var maxWeightLabel: UILabel!

    var trainingType = ""
    var maxWeight = ""
    var model:Big3DataModel? = Big3DataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        trainingTypeLabel.text = trainingType
        maxWeightLabel.text = maxWeight
    }
    
    /// 閉じるボタンのクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func tappedClose(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    
    /// 削除ボタンのクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func deleteButton(_ sender: Any){
        
        let alert:UIAlertController = UIAlertController(title: "削除確認", message: "削除してもよろしいですか", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction : UIAlertAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: {
            
            (action:UIAlertAction!) -> Void in
            
            //その要素を削除する
            let dao = Big3Dao()
            dao.deleteBig3DataModel(model: self.model!)
            
            //カレンダー画面に遷移
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let next = storyboard.instantiateInitialViewController() as? ViewController
            
            self.present(next!,animated:false, completion:nil)
        })
        
        
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            //何もしない
            print("Cancel")
        })
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert,animated: true, completion: nil)
    }
    
    /// 編集ボタンのクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func editButton(_ sender: Any) {
        
        //編集画面に画面遷移
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController
        
        next?.trasitonDate = (model?.date)!
        next?.trasitonWeight = (model?.maxweight)!
        next?.trasitionbig3Label = (model?.big3)!
        
        present(next!,animated:false, completion:nil)
    }
}


// MARK: - 画面にpopupの表示
extension PopuoViewController {
    class func show(presentintViewController vc: UIViewController, model:Big3DataModel) {
        guard let alert = UIStoryboard(name: "Popup", bundle: nil).instantiateInitialViewController() as? PopuoViewController else { return }
        
        alert.model = model
        alert.trainingType = model.big3
        alert.maxWeight = model.maxweight
        
        vc.present(alert, animated: false, completion: nil)
    }
}
