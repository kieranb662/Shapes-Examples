//
//  FoldableShape.swift
//  Shapes Examples
//
//  Created by Kieran Brown on 4/14/20.
//  Copyright © 2020 BrownandSons. All rights reserved.
//

import SwiftUI
import Shapes


struct FoldingExample: View {
    @State var fraction: CGFloat = 0.1
    
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            VStack(spacing: 100) {
                FoldableShape( Triangle(), fraction: fraction, mainColor: Color.pink, foldColor: Color.green).frame(width: 200, height: 200)
                FoldableShape( Pentagon(), fraction: fraction, mainColor: Color.green, foldColor: Color.pink).frame(width: 200, height: 200)
                Slider(value: $fraction, in: 0...1)
            }
        }.navigationBarTitle("Foldable Shapes")
    }
}



struct FoldableShape_Previews: PreviewProvider {
    static var previews: some View {
        FoldingExample().colorScheme(.dark)
    }
}
