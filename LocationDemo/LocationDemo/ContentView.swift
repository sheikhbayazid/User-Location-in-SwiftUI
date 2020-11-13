//
//  ContentView.swift
//  LocationDemo
//
//  Created by Sheikh Bayazid on 7/19/20.
//  Copyright © 2020 Sheikh Bayazid. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @ObservedObject var location = LocationManager()

    
    var lat: String{
        return "\(location.lastKnownLocation?.coordinate.latitude ?? 0.0)"
    }
    
    var lon: String{
        return "\(location.lastKnownLocation?.coordinate.longitude ?? 0.0)"
    }
    
    init() {
        self.location.startUpdating()
    }
    
    var symbol = "bolt.heart.fill"
    
    
    
    var body: some View {
        ZStack{
            Color(red: 224/255, green: 229/255, blue: 236/255)
            VStack {
                Text("Location breakdown")
                Text("Latitude: \(lat)")
                Text("Longitude: \(lon)")
            }
            .padding()
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
        }.edgesIgnoringSafeArea(.all)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



