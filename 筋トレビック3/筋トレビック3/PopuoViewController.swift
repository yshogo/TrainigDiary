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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// 閉じるボタンのクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func tappedClose(_ sender: Any) {
    }
}


// MARK: - 画面にpopupの表示
extension PopuoViewController {
    class func show(presentintViewController vc: UIViewController) {
        guard let alert = UIStoryboard(name: "Popup", bundle: nil).instantiateInitialViewController() as? PopuoViewController else { return }
        vc.present(alert, animated: false, completion: nil)
    }
}
