//
//  ViewController.swift
//  Myapp05
//
//  Created by 江宗益 on 2017/9/18.
//  Copyright © 2017年 江宗益. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var btnNumber1: UIButton!
    
    
    @IBOutlet weak var pickView: UIPickerView!

    private let city = ["台北市", "台中市", "彰化縣", "台南縣"]
    private var area:[[String]] = []
    
    
    @IBAction func clickNumber(_ sender: Any) {
        btnNumber1.isEnabled = false
        showDialog()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var ret = 0;
        if component == 0 {
            ret = city.count
        }else if(component == 1){
            ret = area[pickView.selectedRow(inComponent: 0)].count
        }
        return ret
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var ret = ""
        if component == 0 {
            ret = city[row]
        }else if component == 1 {
            ret = area[pickView.selectedRow(inComponent: 0)][row]
        }
        return ret
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
            inComponent component: Int){
        if component == 0 {
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            print("City:\(city[row])")
        }else if component == 1{
            print("Area:\(area[pickView.selectedRow(inComponent: 0)][row])")
        }
    }
    
    
    func initView(){
        area += [["中山區","萬華區", "士林區", "北投區", "大安區"]]
        area += [["西屯區","南屯區", "北屯區", "中區", "和平區", "太平區"]]
        area += [["鹿港鎮","和美鎮", "彰化市", "花壇區", "伸港區"]]
        area += [["安平區","永康區", "新營區","玉井區"]]
        
        
//        var i = pickView.selectedRow(inComponent: 0)
        
            }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
      print("viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool){
        showDialog()
        print("viewDidAppear")
    }
    
    private func showDialog(){
        let alert = UIAlertController(title: "welcome", message: "World", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default){
            (aAction) in
            let account = alert.textFields![0].text
            let passwd = alert.textFields![1].text
            print("\(account!):\(passwd!)")
        }
        alert.addAction(action)
        
        alert.addTextField{ (aTextField) in
            aTextField.placeholder = "輸入帳號"
        }
        alert.addTextField{ (aTextField) in aTextField.placeholder = "輸入密碼"
            aTextField.isSecureTextEntry = true
        }
        
        show(alert, sender: self)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

