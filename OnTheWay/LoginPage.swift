//
//  LoginPage.swift
//  LoginPage
//
//  Created by Vadde Narendra on 8/21/20.
//  Copyright © 2020 Narendra Vadde. All rights reserved.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue, Color.red]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        }
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
