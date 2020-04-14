//
//  PathTextExample.swift
//  Shapes Examples
//
//  Created by Kieran Brown on 4/14/20.
//  Copyright © 2020 BrownandSons. All rights reserved.
//

import SwiftUI
import Shapes

struct PathTextExample: View {
    @State var dash: [CGFloat] =  [20]
    @State var dashOffset: CGFloat = 0
    
    var pathTextAnimation: some View {
        let style = StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: dash, dashPhase: dashOffset)
        let animation = Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)
        return PathText()
            .stroke(Color.blue, style: style)
            .animation(animation)
            .frame(width: 350, height: 200)
            .onAppear { self.dashOffset = 300 }
        
    }
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            pathTextAnimation
        }.navigationBarTitle("Path Text")
        
    }
}

struct PathTextExample_Previews: PreviewProvider {
    static var previews: some View {
        PathTextExample()
    }
}
