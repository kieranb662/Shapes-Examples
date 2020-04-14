//
//  Polygon.swift
//  Shapes Examples
//
//  Created by Kieran Brown on 4/14/20.
//  Copyright © 2020 BrownandSons. All rights reserved.
//

import SwiftUI
import Shapes

struct MyButton: View {
    let label: String
    var font: Font = .title
    var textColor: Color = .white
    let action: () -> ()
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(label)
                .font(font)
                .padding(10)
                .frame(width: 70)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).shadow(radius: 2))
                .foregroundColor(textColor)
            
        })
    }
}
//https://swiftui-lab.com/swiftui-animations-part1/
struct PolygonExample: View {
    @State private var sides: Double = 4
    @State private var duration: Double = 1.0
    @State private var scale: Double = 1.0
    
    var body: some View {
        VStack {
            Polygon(sides: sides, scale: scale)
                .stroke(Color.purple, lineWidth: 5)
                .padding(20)
                .animation(.easeInOut(duration: duration))
                .layoutPriority(1)
            
            Text("\(Int(sides)) sides, \(String(format: "%.2f", scale as Double)) scale")
            
            HStack(spacing: 20) {
                MyButton(label: "1") {
                    self.sides = 1.0
                    self.scale = 1.0
                }
                
                MyButton(label: "3") {
                    self.sides = 3.0
                    self.scale = 0.7
                }
                
                MyButton(label: "7") {
                    self.sides = 7.0
                    self.scale = 0.4
                }
                
                MyButton(label: "30") {
                    self.sides = 30.0
                    self.scale = 1.0
                }
                
            }
        }.navigationBarTitle("Polygon").padding(.bottom, 50)
    }
}

struct Polygon_Previews: PreviewProvider {
    static var previews: some View {
        PolygonExample()
    }
}
