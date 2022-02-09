//
//  MapView.swift
//  Evenly Challenge
//
//  Created by Rasul Mammadov on 09.02.22.
//

import SwiftUI
import MapKit

//creating the map

struct mapView : View {
    @State var completerResults = 0
    @State var searchCompleter = 0
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 52.500342,
            longitude: 13.425170),
        span: MKCoordinateSpan(
            latitudeDelta: 0.004,
            longitudeDelta: 0.004
        )
    )
    
    var body: some View {
        NavigationView {
        VStack {
            
            Map(coordinateRegion: $region, showsUserLocation: false)
            
                .ignoresSafeArea()
            
           }
        }
    }
}
