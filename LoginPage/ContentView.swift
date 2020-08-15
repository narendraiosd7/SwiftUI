//
//  ContentView.swift
//  LoginPage UI
//
//  Created by Vadde Narendra on 8/15/20.
//  Copyright © 2020 Narendra Vadde. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = ""
    @State private var password: String = ""
    
    var verticalPadingForForm = 40.0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.green, .white, .orange]), center: .center, startRadius: 100, endRadius: 470)
            VStack {
                Text("Welcome !").foregroundColor(Color.white)
                    .bold()
                    .padding()
                    .font(.headline)
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.white)
                    TextField("Enter your name", text: $name)
                    .foregroundColor(Color.black)
                }.padding()
                .multilineTextAlignment(.leading)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Image(systemName: "lock")
                    .foregroundColor(.white)
                    SecureField("Enter password", text: $password)
                    .foregroundColor(Color.black)
                }.padding()
                .multilineTextAlignment(.leading)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Forgot Password?")
                }.padding()
                    .foregroundColor(.white)
                
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Log In")
                    }.foregroundColor(Color.black)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Sign Up")
                    }.foregroundColor(Color.black)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                }.padding(.horizontal, CGFloat(50))
                
            }.padding(.horizontal, CGFloat(verticalPadingForForm))
            
        }
    }
}
