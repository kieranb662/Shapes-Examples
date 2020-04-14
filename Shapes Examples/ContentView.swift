//
//  ContentView.swift
//  Shapes Examples
//
//  Created by Kieran Brown on 4/14/20.
//  Copyright © 2020 BrownandSons. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Lines")) {
                    NavigationLink("To-From", destination: LineExample())
                    NavigationLink("Vertical", destination: VerticalLineExample())
                    NavigationLink("Horizontal", destination: HorizontalLineExample())
                    NavigationLink("Adaptive", destination: AdaptiveLineExample())
                }
                Section(header: Text("Grids")) {
                    NavigationLink("Cartesian", destination: CartesianGridExample())
                    NavigationLink("Polar", destination: PolarGridExample())
                    NavigationLink("Tick Marks", destination: TickMarksExample())
                }
                Section(header: Text("Common Shapes")) {
                    NavigationLink("Triangles", destination: Triangles())
                    NavigationLink("Pentagon", destination: PentagonExample())
                    NavigationLink("Polygon", destination: PolygonExample())
                }
                Section(header: Text("Misc")) {
                    NavigationLink("Arrows", destination: ArrowExample())
                    NavigationLink("Path Text", destination: PathTextExample())
                    NavigationLink("Folding Shape", destination: FoldingExample())
                }
            }
        }.colorScheme(.dark)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
