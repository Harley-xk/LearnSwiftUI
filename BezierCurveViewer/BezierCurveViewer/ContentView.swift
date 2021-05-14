//
//  ContentView.swift
//  BezierCurveViewer
//
//  Created by Harley-xk on 2021/5/12.
//

import SwiftUI

struct ContentView: View {

    @State var count: Double = 20.0
    @State var begin = Point.random(role: .begin)
    @State var end = Point.random(role: .end)
    @State var control = Point.random(role: .control)

    var body: some View {
        VStack {
            HStack {
                Slider(value: $count, in: 6...81) {
                    Text("取样数量")
                }.frame(width: 500)
                Text("\(Int(count - 1))")
                Spacer()
                Button("刷新") {
                    refreshPoints()
                }
            }.padding()
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: begin.x, y: begin.y))
                    path.addLine(to: CGPoint(x: control.x, y: control.y))
                    path.addLine(to: CGPoint(x: end.x, y: end.y))
                }.stroke(Color.red, style: StrokeStyle(lineWidth: 1, dash: [5, 10]))
                ForEach(points, id: \.self) { p in
                    PointView(point: p)
                }
            }.frame(width: 800, height: 600, alignment: .center)
        }.navigationTitle("贝塞尔曲线-取样点分布")
    }

    func refreshPoints() {
        begin = Point.random(role: .begin)
        end = Point.random(role: .end)
        control = Point.random(role: .control)
    }

    var points: [Point] {
        var points = [begin, end, control]

        let segements = Int(count)
        for i in 1 ..< segements {
            let t = CGFloat(i) / CGFloat(segements)
            let x = pow(1 - t, 2) * begin.x + 2.0 * (1 - t) * t * control.x + t * t * end.x
            let y = pow(1 - t, 2) * begin.y + 2.0 * (1 - t) * t * control.y + t * t * end.y
            let p = Point(x: x, y: y)
            points.append(p)
        }
        return points
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
