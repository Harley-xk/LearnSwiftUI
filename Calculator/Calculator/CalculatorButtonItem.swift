//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by Harley-xk on 2019/11/1.
//  Copyright © 2019 Harley. All rights reserved.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem {
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem {
    
    var title: String {
        switch self {
        case .digit(let value): return String(value)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 80 * 2 + 8, height: 80)
        }
        return CGSize(width: 80, height: 80)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot: return "digit.background"
        case .op: return "operator.background"
        case .command: return "command.background"
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .digit, .dot, .op: return .white
        case .command: return Color("command.foreground")
        }
    }
}

extension CalculatorButtonItem: Hashable { }
