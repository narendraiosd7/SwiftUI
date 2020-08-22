//
//  Memorize.swift
//  LoginPage
//
//  Created by Vadde Narendra on 8/15/20.
//  Copyright © 2020 Narendra Vadde. All rights reserved.
//

import SwiftUI

struct Memorize: View {
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                CardView(isFaceUp: true)
            }
        }
        .padding()
//        .font(Font.largeTitle)
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke()
                Text("👻")
            } else  {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}
