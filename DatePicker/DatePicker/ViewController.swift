//
//  ViewController.swift
//  DatePicker
//
//  Created by 황명원 on 2021/12/30.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector=#selector(ViewController.updateTime)
    let interval=1.0
    var count=0
    var alarmTime="0"
    
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView=sender
        
        let formatter=DateFormatter()
        formatter.dateFormat="yyyy-MM-dd HH:mm:ss EEE"
        lblPickerTime.text="선택시간: "+formatter.string(from: datePickerView.date)
        
        formatter.dateFormat="hh:mm aaa"
        alarmTime=formatter.string(from: datePickerView.date)
        
    }
    
    @objc func updateTime(){
//        lblCurrentTime.text=String(count)
//        count=count+1
        let date=Date()
        
        let formatter=DateFormatter()
        formatter.dateFormat="yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text="현재시간: "+formatter.string(from: date)
        
        formatter.dateFormat="hh:mm aaa"
        let currentTime=formatter.string(from: date)
        
        if(alarmTime == currentTime)
        {
            view.backgroundColor=UIColor.red
        }
        else
        {
            view.backgroundColor=UIColor.white
        }
    }
}

