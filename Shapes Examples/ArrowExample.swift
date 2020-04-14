//
//  ArrowExample.swift
//  Shapes Examples
//
//  Created by Kieran Brown on 4/14/20.
//  Copyright © 2020 BrownandSons. All rights reserved.
//

import SwiftUI
import Shapes

struct ArrowExample: View {
    @State var val: Double = 10
    
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            VStack {
                HStack(spacing: 0) {
                    ForEach(1..<9) { (i)  in
                        Arrow(arrowOffset: self.val > 100 ? 1/(2*1.414) : 0, length: CGFloat(self.val))
                            .stroke(Color.blue).animation(.easeIn(duration: Double(i)/4.0))
                            .frame(width: 40)
                    }
                }
                Slider(value: $val, in: 1...300).padding()
                
            }
        }.navigationBarTitle("Arrows")
    }
}

struct ArrowExample_Previews: PreviewProvider {
    static var previews: some View {
        ArrowExample()
    }
}
