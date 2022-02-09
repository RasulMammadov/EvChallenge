//
//  HomePageView.swift
//  Evenly Challenge
//
//  Created by Rasul Mammadov on 09.02.22.
//

import SwiftUI

struct MainPage: View {
    
    var body: some View {
        
        //Home page where we show the logo and information.
        
        VStack {
            
            ZStack(alignment: .bottomTrailing) {
                
                VStack(spacing: 12) {
                    
                    Image("evenlylogo") //logo
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .cornerRadius(50)
                    
                    Text("Welcome to Evenly!") // maintext
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("Quality is important for us.") //secondarytext
                        .foregroundColor(.gray)
                    
                    
                }
                .padding(.leading, 50)
            
        }
    }
    
}

}
