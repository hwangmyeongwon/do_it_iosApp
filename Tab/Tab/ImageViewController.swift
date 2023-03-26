//
//  ViewController.swift
//  ImageView
//
//  Created by 황명원 on 2021/12/28.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom=false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn=UIImage(named: "lamp_on.png")
        imgOff=UIImage(named: "lamp_off.png")
        
        imgView.image=imgOn
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat=2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if(isZoom){
            newWidth=imgView.frame.width/scale
            newHeight=imgView.frame.height/scale
            imgView.frame.size=CGSize(width: newWidth, height: newHeight)
            btnResize.setTitle("확대", for: .normal)
        }
        else{
            newWidth=imgView.frame.width*scale
            newHeight=imgView.frame.height*scale
            imgView.frame.size=CGSize(width: newWidth, height: newHeight)
            btnResize.setTitle("축소", for: .normal)
        }
        
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image=imgOn
        }
        else{
            imgView.image=imgOff
        }
    }
    


}

