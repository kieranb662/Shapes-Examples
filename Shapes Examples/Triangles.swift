//
//  Triangles.swift
//  Shapes Examples
//
//  Created by Kieran Brown on 4/14/20.
//  Copyright © 2020 BrownandSons. All rights reserved.
//

import SwiftUI
import Shapes

struct Triangles: View {
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Triangle").font(.title)
                Triangle()
                    .stroke(Color.white, lineWidth: 2)
                Divider()
                Text("Open Triangle").font(.title)
                OpenTriangle()
                .stroke(Color.white, lineWidth: 2)
                Text("Right Triangle").font(.title)
                RightTriangle()
                .stroke(Color.white, lineWidth: 2)
                
            }.padding()
        }.navigationBarTitle("Triangles")
    }
}

struct Triangles_Previews: PreviewProvider {
    static var previews: some View {
        Triangles().colorScheme(.dark)
    }
}
