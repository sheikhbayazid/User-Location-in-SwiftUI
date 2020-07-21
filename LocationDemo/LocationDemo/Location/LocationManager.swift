//
//  LocationManager.swift
//  CoreLocationDemo
//
//  Created by Sheikh Bayazid on 7/18/20.
//  Copyright © 2020 Sheikh Bayazid. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let manager: CLLocationManager
    @Published var lastKnownLocation: CLLocation?

    
//    var getLat: String {
//        return "\(lastKnownLocation?.coordinate.latitude)"
//    }
//    var getLon: String {
//        return "\(lastKnownLocation?.coordinate.longitude)"
//    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied{
            print("denied")
        }
        else{
            print("athorized")
            manager.requestLocation()
        }
    }
    
    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    init(manager: CLLocationManager = CLLocationManager()) {
        self.manager = manager
        super.init()
    }
    

    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    func startUpdating() {
        self.manager.delegate = self
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations)
        lastKnownLocation = locations.last

        //showLocation()
    }
    

//    func showLocation(){
//        print("From showLocation method")
//        print("Latitude: \(getLat)")
//        print("Longitude: \(getLon)")
//    }

    
    
}




