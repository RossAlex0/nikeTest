//
//  ContentView.swift
//  nikeTest
//
//  Created by Alex Rossignol on 12/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var index: Int = 0
    @State public var userCart: Double
    = 0.0
    @State public var nbCart: Int = 0
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("Nike Store")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack{
                    Text("Basket: \(userCart, specifier: "%.2f")$")
                        .font(.headline)
                        .padding(.trailing, -4.0)
                        .padding(.leading, 8.0)
                    Text("(\(nbCart))")
                        .font(.footnote)
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.leading)
                        .padding([.bottom, .trailing], 12.0)
                    
                }
                
                Spacer()
                
                Image(shoes[index].picture)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300.0, height: 300.0)
                    .opacity(0.8)
                    .cornerRadius(32)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 1.0), value: index)
                    
                Text("\(shoes[index].name) - \(shoes[index].price, specifier: "%.2f")$")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
                     
                Button("Buy"){
                    userCart += shoes[index].price
                    nbCart += 1
                }
                .buttonStyle(.bordered)
                
                Spacer()
                HStack{
                    Button("Previous shoes") {
                        if index > 0 {
                            index -= 1
                        } else {
                            index = shoes.count - 1
                        }
                    }
                    Button("Next shoes") {
                        if index < shoes.count - 1 {
                            index += 1
                        } else {
                            index = 0
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.all)
                
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
