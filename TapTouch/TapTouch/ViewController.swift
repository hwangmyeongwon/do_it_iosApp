//
//  ViewController.swift
//  TapTouch
//
//  Created by 황명원 on 2022/02/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMessage: UILabel!
    @IBOutlet weak var txtTapsLevel: UILabel!
    @IBOutlet weak var txtTouchsLevel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Began"
        txtTapsLevel.text = String(touch.tapCount)
        txtTouchsLevel.text = String(touches.count)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Moved"
        txtTapsLevel.text = String(touch.tapCount)
        txtTouchsLevel.text = String(touches.count)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Ended"
        txtTapsLevel.text = String(touch.tapCount)
        txtTouchsLevel.text = String(touches.count)
    }

}

