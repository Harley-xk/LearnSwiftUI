//
//  PointView.swift
//  BezierCurveViewer
//
//  Created by Harley-xk on 2021/5/12.
//

import SwiftUI

struct PointView: View {

    var point: Point

    var body: some View {
        ZStack {
            Circle().frame(width: point.role.size, height: point.role.size, alignment: .center)
                .foregroundColor(point.role.color)
            Text(point.role.name).font(.footnote)
        }.position(x: point.x, y: point.y)
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView(point: .random())
    }
}
