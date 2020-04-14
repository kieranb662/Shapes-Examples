//
//  TickMarksExample.swift
//  Shapes Examples
//
//  Created by Kieran Brown on 4/14/20.
//  Copyright © 2020 BrownandSons. All rights reserved.
//

import SwiftUI
import Shapes

struct Ruler: View {
    
    var length: CGFloat = 600
    @State private var offset: CGSize = .zero
    @State private var dragState: CGSize = .zero
    @State private var angle: Angle = Angle(degrees: -45)
    @State private var rotationState: Angle = .zero
    
    // Create the text for every 100 points
    var values: some View {
        let size = 0..<Int(1 + length/100)
        return HStack(spacing: 70) {
            ForEach(size) { (i)  in
                Text("\(i*100)").font(.system(size: 10)).frame(width: 30)
            }
        }
        
    }
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { (value) in
                self.dragState = value.translation
        }
        .onEnded { (value) in
            self.offset.width += value.translation.width
            self.offset.height += value.translation.height
            self.dragState = .zero
        }
    }
    
    var rotationGesture: some Gesture {
        RotationGesture().onChanged({ (angle) in
            self.rotationState = angle
        }).onEnded({ (angle) in
            self.rotationState = .zero
            self.angle += angle
        })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TickMarks(spacing: 10, ticks: Int(length/10))
                .stroke(Color.gray)
                .frame(height: 50)
            values
                .offset(x: -10)
        }
        .frame(width: length)
        .padding(.leading)
        .background(Color.pink.opacity(0.5))
        .rotationEffect(angle + rotationState)
        .gesture(dragGesture)
        .offset(x: offset.width + dragState.width,
                y: offset.height + dragState.height)
        .simultaneousGesture(rotationGesture)
        
        
    }
}

struct TickMarksExample: View {
    var body: some View {
        ZStack {
            Color(white: 0.1)
                .edgesIgnoringSafeArea(.all)
            Ruler()
        }.navigationBarTitle("Tick Marks")
    }
}

struct TickMarksExample_Previews: PreviewProvider {
    static var previews: some View {
        TickMarksExample().colorScheme(.dark)
    }
}
