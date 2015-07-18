//
//  ViewController.swift
//  Where am I?
//
//  Created by Brad Gray on 7/18/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate  {
    
    @IBOutlet weak var longitude: UILabel!
    
    @IBOutlet weak var latitude: UILabel!
    
    @IBOutlet weak var altitude: UILabel!
    
    @IBOutlet weak var course: UILabel!
    
    @IBOutlet weak var speed: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    
   
 var manager: CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy - kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println(locations)
        
        var userLocation: CLLocation = locations[0] as! CLLocation
        
       self.latitude.text =  "\(userLocation.coordinate.latitude)"
        self.longitude.text =  "\(userLocation.coordinate.longitude)"
        
        self.altitude.text = "\(userLocation.altitude)"
        self.course.text = "\(userLocation.course)"
        self.speed.text = "\(userLocation.speed)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            if error != nil {
                println(error)
            } else {
                if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
                    var subToroughfare:String = ""
                    if (p.subThoroughfare != nil) {
                        
                   subToroughfare = p.subThoroughfare
                    }
                    
                    self.address.text = " \(p.subThoroughfare)\(p.thoroughfare) \n \(p.locality) \n \(p.postalCode) \n \(p.country)"
                    
                    
                    
                }
            }
        })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

}

