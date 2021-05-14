//
//  Point.swift
//  BezierCurveViewer
//
//  Created by Harley-xk on 2021/5/12.
//

import Foundation
import SwiftUI

struct Point: Hashable {
    enum Role {
        case normal
        case begin
        case end
        case control
    }

    var x: CGFloat
    var y: CGFloat
    var role = Role.normal

    static func random(role: Role = .normal) -> Point {
        let x = Int.random(in: 20 ... 780)
        let y = Int.random(in: 20 ... 580)
        return Point(x: CGFloat(x), y: CGFloat(y), role: role)
    }
}


extension Point.Role {

    var color: Color {
        switch self {
        case .normal: return .blue.opacity(0.8)
        case .begin: return .orange
        case .end: return .red
        case .control: return .purple
        }
    }

    var name: String {
        switch self {
        case .normal: return ""
        case .begin: return "起"
        case .end: return "终"
        case .control: return "控"
        }
    }

    var size: CGFloat {
        switch self {
        case .normal: return 5
        default: return 20
        }
    }
}
