//
//  PostViewController.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2016/12/24.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import UIKit
import CoreData


/// データ投稿画面
class PostViewController: UIViewController ,UITextFieldDelegate , UIPickerViewDelegate , UIPickerViewDataSource{
    
    //日付のテキストフィールド
    @IBOutlet weak var datePickerField: UITextField!
    /// 筋トレ種目ラベル
    @IBOutlet weak var big3Label: UILabel!
    /// 筋トレ種目ボタン
    @IBOutlet weak var benchPressButton: UIButton!
    @IBOutlet weak var scwattoButton: UIButton!
    @IBOutlet weak var deadLiftButton: UIButton!
    /// 最大重量ボタン
    @IBOutlet weak var maxWeightField: UITextField!
    
    
    /// 日付を扱うために使用する変数
    var myDatePicker:UIDatePicker!
    var toolBar:UIToolbar!
    
    //最大重量のPicker
    var numberPicker:UIPickerView = UIPickerView()
    var numberToolbar:UIToolbar = UIToolbar()
    var salarymanArr = ["1","2","3","4","5","6","7","8","9","0"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Returnキーを押したときにキーボードを閉じる設定
        datePickerField.delegate = self
        maxWeightField.delegate = self
        
        //テキストをDate型に変換してViewに追加する記述
        datePickerField.placeholder = DateToStringUtil.dateToString(date: NSDate())
        datePickerField.text = DateToStringUtil.dateToString(date: NSDate())
        self.view.addSubview(datePickerField)
        
        //datepikerの生成
        createDatePicker()
        //toolbarの生成
        createToober()
        
        //最大重量のPickerを生成
        numberPicker.delegate = self
        numberPicker.dataSource = self
        createNumPicker()
        createNumberToolbar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 最大重量のPickerを生成する
    func createNumPicker(){
        //Pickerの生成
        numberPicker.frame = CGRect(x:0,y:0,width:self.view.bounds.width,height:250.0)
        maxWeightField.inputView = numberPicker
    }
    
    /// 最大重量のTollbarを生成する
    func createNumberToolbar(){
        //Toolbarの生成
        numberToolbar = UIToolbar(frame: CGRect(x:0,y:self.view.frame.size.height/6,width:self.view.frame.size.width,height:40.0))
        numberToolbar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        numberToolbar.backgroundColor = UIColor.black
        numberToolbar.barStyle = UIBarStyle.black
        numberToolbar.tintColor = UIColor.white
        
        //ToolBarを閉じるボタンを追加
        let myToolBarButton = UIBarButtonItem(title: "完了", style: .bordered, target: self, action: #selector(PostViewController.tappedToolBarBtn))
        myToolBarButton.tag = 1
        numberToolbar.items = [myToolBarButton]
        
        maxWeightField.inputAccessoryView = numberToolbar
        
        
    }
    
    /// pickerの表示列
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /// pickerの表示個数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return salarymanArr.count
    }
    
    /// pickerの表示内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return salarymanArr[row] as String
    }
    
    /// pickerの選択時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        maxWeightField.text = salarymanArr[row]
    }
    
    /// DatePickerを生成
    private func createDatePicker(){
        
        myDatePicker = UIDatePicker()
        //DatePickerにクリックイベントを付与する
        myDatePicker.addTarget(self, action: #selector(PostViewController.changedDateEvent), for: UIControlEvents.valueChanged)
        //datePickerの種類をセット(時間なども設定可能)
        myDatePicker.datePickerMode = UIDatePickerMode.date
        //テキストフィールドに追加
        datePickerField.inputView = myDatePicker
    }
    
    
    ///DatePickerスライドイベント
    ///
    /// - Parameter sender: <#sender description#>
    func changedDateEvent(sender: AnyObject?){
        datePickerField.text = DateToStringUtil.dateToString(date: myDatePicker.date as NSDate)
    }
    
    /// Toolbarを生成
    private func createToober(){
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = .blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        
        //ツールバーにボタンを追加
        let compToolBarBtn = UIBarButtonItem(title: "完了", style: .bordered, target: self, action: #selector(PostViewController.tappedToolBarBtn))
        compToolBarBtn.tag = 1
        toolBar.items = [compToolBarBtn]
        
        datePickerField.inputAccessoryView = toolBar
    }
    
    /// 「完了」ボタンのクリックイベント(閉じるだけ。。。)
    ///
    /// - Parameter sender: <#sender description#>
    func tappedToolBarBtn(sender: AnyObject?) {
        datePickerField.resignFirstResponder()
        maxWeightField.resignFirstResponder()

    }
    
    /// テキストフィールドでRetrunキーを押したときのキーボードを閉じるメソッド
    ///
    /// - Parameter textField: テキストフィールド
    /// - Returns: true or false
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    
    /// 「投稿」ボタンクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func submid(_ sender: Any) {
        
        ///テキストフィールドのテキストを一旦変数に格納
        let date = datePickerField.text
        let big3 = big3Label.text
        let maxweight = maxWeightField.text
        
        let model = Big3DataModel()
        model.date = date!
        model.big3 = big3!
        model.maxweight = maxweight!

        let dao = Big3Dao()
        dao.saveData(big3DataModel: model)
    }
    
    
    
    /// segmentationタブクリックイベント
    ///
    /// - Parameter sender:
    @IBAction func chengeView(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegmentIndex {
            
        case 0:
            let calendarViewControler = self.storyboard!.instantiateViewController( withIdentifier: "ViewController") as! ViewController
            self.present(calendarViewControler,animated: false,completion: nil)
            
        default :
            
            let calendarViewControler = self.storyboard!.instantiateViewController( withIdentifier: "PostViewController") as! PostViewController
            self.present(calendarViewControler,animated: false,completion: nil)
        }

    }
    
    /// ビック3のラベルのテキストを変える
    ///
    /// - Parameter text: ラベルを変更する文字列
    private func chengeBig3Label(text:String){
        big3Label.text = text
    }

    /// ベンチプレスボタンクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func benchPressButton(_ sender: Any) {
        //ラベルの変更
        chengeBig3Label(text: self.benchPressButton.currentTitle!)
    }
    
    /// スクワットボタンクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func sucwattoButton(_ sender: Any) {
        //ラベルの変更
        chengeBig3Label(text: self.scwattoButton.currentTitle!)
    }

    /// デットリフトボタンクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func deadLiftButton(_ sender: Any) {
        //ラベルの変更
        chengeBig3Label(text: self.deadLiftButton.currentTitle!)
    }
}
