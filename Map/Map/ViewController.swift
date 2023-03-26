//
//  ViewController.swift
//  Map
//
//  Created by 황명원 on 2022/01/07.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager=CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text=""
        lblLocationInfo2.text=""
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation=true
    }

    func goLocation(latitude latitudeValue: CLLocationDegrees, longitude longitudeVale : CLLocationDegrees, delta span: Double)->CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeVale)
        let spanValue=MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion=MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String) {
        let annotation=MKPointAnnotation()
        annotation.coordinate=goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span)
        annotation.title=strTitle
        annotation.subtitle=strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation=locations.last
        goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks,error)->Void in
            let pm=placemarks!.first
            let country=pm!.country
            var address:String=country!
            if pm!.locality != nil{
                address+=" "
                address+=pm!.locality!
            }
            if (pm!.thoroughfare != nil) {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text="현재 위치"
            self.lblLocationInfo2.text=address
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==0 {
        
            setAnnotation(latitude: 37.49443324349769, longitude: 126.75710171458796, delta: 1, title: "현재위치", subtitle: "대한민국 경기도 부천시 장말로137 사랑마을")
            self.lblLocationInfo1.text="보고 계신 위치"
            self.lblLocationInfo2.text="현재위치"
        }
        else if sender.selectedSegmentIndex==1{
            setAnnotation(latitude: 37.1408211, longitude: 127.64977750000003, delta: 1, title: "강동대학교", subtitle: "충북 음성군 감곡면 대학길 278")
            self.lblLocationInfo1.text="보고 계신 위치"
            self.lblLocationInfo2.text="강동대학교"
        }
        else if sender.selectedSegmentIndex==2{
            setAnnotation(latitude: 37.5037871, longitude: 126.8981, delta: 0.1, title: "이지스퍼블리싱 출판사", subtitle: "서울시 영등포구 당산로 41길 11")
            self.lblLocationInfo1.text="보고 계신 위치"
            self.lblLocationInfo2.text="이지스퍼블리싱 출판사"
        }
    }
}

