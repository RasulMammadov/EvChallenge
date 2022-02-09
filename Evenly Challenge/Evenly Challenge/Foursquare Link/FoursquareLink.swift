//
//  FoursquareLink.swift
//  Evenly Challenge
//
//  Created by Rasul Mammadov on 09.02.22.
//

import SwiftUI

// Opening a foursquare page on Safari

struct getFoursquare : View {
    
    var body: some View {
        
        VStack {
            
            Link("Check our Foursquare page", destination: URL(string: "https://foursquare.com/v/evenly-hq/560d09a0498e04e7a4318441")!) //creating a clickable link
            
        }
        .padding(.horizontal, 150)
    }
}

