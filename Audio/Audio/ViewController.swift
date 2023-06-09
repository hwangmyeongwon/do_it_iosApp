//
//  ViewController.swift
//  Audio
//
//  Created by 황명원 on 2022/01/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {

    var audioPlayer : AVAudioPlayer!
    
    var audioFile : NSURL!
    
    let MAX_VOLUME : Float = 10.0
    
    var progressTimer : Timer!
    let timePlayerSelector:Selector=#selector(ViewController.updatePlayTime)
    
    @IBOutlet weak var pvProgressPlay: UIProgressView!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var slVolume: UISlider!
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var lblRecordTime: UILabel!
    var audioRecorder : AVAudioRecorder!
    var isRecordMode=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectAudioFile()
        initPlay()
    }
    
    func selectAudioFile(){
        if !isRecordMode{
            audioFile=Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3") as NSURL?
        } else {
            
        }
    }
    
    func initPlay(){
        do{
            audioPlayer=try AVAudioPlayer(contentsOf: audioFile as URL)
        } catch let error as NSError {
            print("Error-initPlay : \(error)")
        }
        slVolume.maximumValue=MAX_VOLUME
        slVolume.value=1.0
        pvProgressPlay.progress=0
        
        audioPlayer.delegate=self
        audioPlayer.prepareToPlay()
        audioPlayer.volume=slVolume.value
        
        lblEndTime.text=convertNSTimeInterval2String(time: audioPlayer.duration)
        lblCurrentTime.text=convertNSTimeInterval2String(time: 0)
        setPlayButtons(play: true, pause: false, stop: false)
    }
    
    func setPlayButtons(play:Bool , pause:Bool , stop:Bool){
        btnPlay.isEnabled=play
        btnPause.isEnabled=pause
        btnStop.isEnabled=stop
    }
    
    func convertNSTimeInterval2String(time:TimeInterval) -> String{
        let min=Int(time/60)
        let sec=Int(time.truncatingRemainder(dividingBy: 60))
        let strTime=String(format: "%02d:%02d",min,sec)
        return strTime
    }


    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(play: false, pause: true, stop: true)
        progressTimer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    @objc func updatePlayTime(){
        lblCurrentTime.text=convertNSTimeInterval2String(time: audioPlayer.currentTime)
        pvProgressPlay.progress=Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(play: true, pause: false, stop: true)
    }
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime=0
        lblCurrentTime.text=convertNSTimeInterval2String(time: 0)
        setPlayButtons(play: true, pause: false, stop: false)
        progressTimer.invalidate()
    }
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume=slVolume.value
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(play: true, pause: false, stop: false)
    }
    @IBAction func swRecordMode(_ sender: UISwitch) {
    }
    @IBAction func btnRecord(_ sender: UIButton) {
    }
}

