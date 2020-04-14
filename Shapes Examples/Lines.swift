//
//  Lines.swift
//  Shapes Examples
//
//  Created by Kieran Brown on 4/14/20.
//  Copyright © 2020 BrownandSons. All rights reserved.
//

import SwiftUI
import Shapes


struct LineExample: View {
    @State var p1: CGPoint = CGPoint(x: 100, y: 100)
    @State var p2: CGPoint = CGPoint(x: 200, y: 350)
    
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            ZStack {
                Line(from: p1, to: p2)
                    .stroke(Color.white, lineWidth: 10)
                Circle()
                    .fill(Color.blue)
                .frame(width: 30, height: 30)
                    .position(p1)
                .gesture(DragGesture().onChanged({self.p1 = $0.location}))
                
                Circle()
                .fill(Color.red)
                    .frame(width: 30, height: 30)
                .position(p2)
                    .gesture(DragGesture().onChanged({self.p2 = $0.location}))
              
            }.padding()
        }.navigationBarTitle("Line")
    }
}

// The VerticalLine Shape uses an offset value that is normalized to the containing rectangles width. This means that an offset=0 is 0 in the container while an offset=1 is the width of the rectangle.
struct VerticalLineExample: View {
    @State var offset: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            VStack {
                VerticalLine(offset: offset)
                    .stroke(Color.white, lineWidth: 10)
                .overlay(GeometryReader { proxy in
                    ZStack {
                        
                        Arrow(arrowOffset: self.offset*proxy.size.width > 100 ? 1/(2*1.414) : 0,
                              length: self.offset*proxy.size.width)
                            .stroke(Color.blue, lineWidth: 3)
                            .frame(width: 30)
                            
                            .rotationEffect(Angle(degrees: 90))
                            .position(x: self.offset*proxy.size.width/2-8, y: proxy.size.height/2)
                        .animation(.linear)
                            
                        Text("\(String(format: "%.0f", self.offset*100))%")
                            .font(.title)
                            .frame(width: 150)
                        .position(x: self.offset*proxy.size.width/2-5, y: 2*proxy.size.height/5)
                           
                    }
                })
                Slider(value: $offset)
            }.padding()
        }.navigationBarTitle("Vertical Line")
    }
}
// The HorizontalLine Shape uses an offset value that is normalized to the containing rectangles height. This means that an offset=0 is 0 in the container while an offset=1 is the height of the rectangle.
struct HorizontalLineExample: View {
    @State var offset: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            
            VStack {
                HorizontalLine(offset: self.offset)
                    .stroke(Color.white, lineWidth: 10)
                    .overlay(GeometryReader { proxy in
                        ZStack {
                            Arrow(arrowOffset: self.offset*proxy.size.height > 100 ? 1/(2*1.414) : 0,
                                  length: self.offset*proxy.size.height).stroke(Color.blue, lineWidth: 3)
                                .frame(width: 30)
                                .animation(.linear)
                                .position(x: proxy.size.width/2,y: self.offset*proxy.size.height/2-8)
                            Text("\(String(format: "%.0f", self.offset*100))%").font(.title).frame(width: 150)
                                .position(x: 2*proxy.size.width/3, y: self.offset*proxy.size.height/2-5)
                        }
                    })
                Slider(value: self.$offset)
            }.padding()
        }.navigationBarTitle("Horizontal Line")
    }
}
// The adaptive line is centered within its container and adjusts its size to fit regardless of the input angle 
struct AdaptiveLineExample: View {
    @State var angle: Double = 0.5
    
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            VStack {
                AdaptiveLine(angle: Angle(degrees: angle*360))
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                Slider(value: $angle)
            }.padding()
        }.navigationBarTitle("Adaptive Line")
    }
}




struct Lines_Previews: PreviewProvider {
    static var previews: some View {
        VerticalLineExample().colorScheme(.dark)
    }
}
