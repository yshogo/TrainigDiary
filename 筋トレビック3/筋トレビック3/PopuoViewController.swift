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
        
        //その要素を削除する
        let dao = Big3Dao()
        dao.deleteBig3DataModel(model: model!)
    }
    
    /// 編集ボタンのクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func editButton(_ sender: Any) {
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
