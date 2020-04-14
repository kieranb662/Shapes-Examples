//
//  Grids.swift
//  Shapes Examples
//
//  Created by Kieran Brown on 4/14/20.
//  Copyright © 2020 BrownandSons. All rights reserved.
//

import SwiftUI
import Shapes

struct CartesianGridExample: View {
    @State var xCount: Int = 4
    @State var yCount: Int = 5
    
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            VStack {
                CartesianGrid(xCount: xCount, yCount: yCount)
                    .stroke(Color.white, lineWidth: 1)
                    .border(Color.white)
                Stepper("number of vertical lines", value: $xCount)
                Stepper("number of horizontal lines", value: $yCount)
            }.padding()
        }.navigationBarTitle("Cartesian")
    }
}

// Has some issues, that i believe come from degeneracy of the thetaCount and where the lines would be placed
struct PolarGridExample: View {
    @State var rCount: Int = 4
    @State var thetaCount: Int = 5
    
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            VStack {
                PolarGrid(rCount: rCount, thetaCount: thetaCount)
                    .stroke(Color.white, lineWidth: 1)
                    .clipped()
                Stepper("number of circles", value: $rCount)
                Stepper("number of lines", value: $thetaCount)
            }.padding()
        }.navigationBarTitle("Polar")
    }
}


