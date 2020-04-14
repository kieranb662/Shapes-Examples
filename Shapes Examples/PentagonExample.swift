//
//  PentagonExample.swift
//  Shapes Examples
//
//  Created by Kieran Brown on 4/14/20.
//  Copyright © 2020 BrownandSons. All rights reserved.
//

import SwiftUI
import Shapes

// A house shaped pentagon thats good for using as the thumb of sliders.
struct PentagonExample: View {
    var body: some View {
        ZStack {
            Color(white: 0.1).edgesIgnoringSafeArea(.all)
            Pentagon()
                .stroke(Color.white, lineWidth: 3)
            .frame(width: 200, height: 200)
        }.navigationBarTitle("Pentagon")
    }
}

struct PentagonExample_Previews: PreviewProvider {
    static var previews: some View {
        PentagonExample()
    }
}
