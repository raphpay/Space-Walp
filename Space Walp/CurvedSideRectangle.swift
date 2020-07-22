//
//  CurvedSideRectangle.swift
//  Space Walp
//
//  Created by Raphaël Payet on 12/07/2020.
//  Copyright © 2020 Oriapy. All rights reserved.
//

import SwiftUI

struct CurvedSideRectangle: Shape {
    var myOffset: CGFloat = 150
    var animatableData: CGFloat {
        get { return myOffset }
        set { myOffset = newValue }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.midY + myOffset))
        path.closeSubpath()
        return path
    }
}

struct SwiftUIView: View {
    var body: some View {
        Image("astronaut")
            .resizable()
            .aspectRatio(contentMode: .fill)
        
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
