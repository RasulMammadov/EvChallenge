//
//  ContentView.swift
//  Evenly Challenge
//
//  Created by Rasul Mammadov on 07.02.22.
//

import Foundation
import MapKit
import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var index = 0
    @State var show = false

    
    var body: some View {
        
        ZStack {
            
            //Creating menu
            
            HStack {
                
                
                VStack(alignment: .leading, spacing: 12) {
                                        
                    Text("Hi,")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    Text("Evenly user!")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        
                        self.index = 0
                        
                        //AnimationView
                        
                        withAnimation {
                            
                            self.show.toggle()
                            
                        }
                        
                    }) {
                        HStack(spacing: 25) {
                            
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(self.index == 0 ? Color(.white) : Color.white)
                            
                         Text("Home")
                                .foregroundColor(self.index == 0 ? Color(.orange) : Color.orange)
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color(.white).opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                        
                    }
                    
                    Button(action: {
                        
                        self.index = 1
                        
                        //AnimationView
                        
                        withAnimation {
                            
                            self.show.toggle()
                            
                        }
                        
                    }) {
                        HStack(spacing: 25) {
                            
                            Image(systemName: "star")
                                .foregroundColor(self.index == 1 ? Color(.white) : Color.white)
                            
                         Text("Foursquare")
                                .foregroundColor(self.index == 1 ? Color(.orange) : Color.orange)
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color(.white).opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                        
                    }
                    
                    
                    Button(action: {
                        
                        self.index = 2
                        
                        withAnimation {
                            self.show.toggle()
                        }
                        
                    }) {
                        HStack(spacing: 25) {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(self.index == 2 ? Color(.white) : Color.white)
                            
                         Text("Map")
                                .foregroundColor(self.index == 2 ? Color(.orange) : Color.orange)
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color(.white).opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                        
                    }
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.blue)
                        .padding(.vertical)
                    
                    Spacer(minLength: 0)
                    
                }
                
                .padding(.top, 25)
                .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
            }
            
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            //MainView
            
            VStack(spacing: 0) {
                
                HStack(spacing: 15) {
                    
                    Button(action: {
                        
                        withAnimation {
                            self.show.toggle()
                        }
                        
                    }) {
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                    
                    Text(self.index == 0 ? "Home" : (self.index == 1 ? "Foursquare" : "Map"))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    Spacer(minLength: 0)
                    
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader {_ in
                    
                    
                    VStack {
                        
                        if self.index == 0 {
                            
                            MainPage()
                            
                        } else if self.index == 1 {
                            getFoursquare()
                        } else if self.index == 2 {
                            mapView()
                        }
                        
                    }
                    
                }
                
                
                Spacer(minLength: 0)
            }
            .background(Color.white)
            .cornerRadius(self.show ? 30 : 0)
            //shrinking and moving
            
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            //rotation
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
            
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}
