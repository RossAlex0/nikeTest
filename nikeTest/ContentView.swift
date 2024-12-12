//
//  ContentView.swift
//  nikeTest
//
//  Created by Alex Rossignol on 12/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var userBool: Bool = true

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image(userBool ? "nikeleg" : "nikewhite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300.0, height: 300.0)
                    .opacity(0.8)
                    .cornerRadius(32)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 1.0), value: userBool)
                    
                Text(userBool ? "Old Nike - 120.20$" : "New Nike - 78.30$")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Button("See other shoes") {
                    userBool = !userBool
                }
                .padding(.all)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color(red: 220/255, green: 220/255, blue: 240/255))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
