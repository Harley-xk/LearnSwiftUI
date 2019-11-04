//
//  ContentView.swift
//  Calculator
//
//  Created by Harley-xk on 2019/11/1.
//  Copyright © 2019 Harley. All rights reserved.
//

import SwiftUI
import Combine

let scale: CGFloat = UIScreen.main.bounds.width / 375

struct ContentView: View {
    
    @ObservedObject private var model = CalculatorModel()
    
    var body: some View {
        VStack(spacing: 12 * scale) {
            Button("操作履历: \(model.history.count)") {
                print(self.model.historyDetail)
            }
            HStack {
                Spacer()
                Text(model.brain.output)
                    .foregroundColor(.primary)
                    .font(.system(size: 76))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal, 16 * scale)
            }
            CalculatorButtonPad(model: self.model).padding(.bottom)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct CalculatorButton: View {
    
    let fontSize: CGFloat = 30
    let title: String
    let size: CGSize
    let foregroundColor: Color
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize * scale))
                .foregroundColor(foregroundColor)
                .frame(width: size.width * scale, height: size.height * scale)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width  * scale / 2)
        }
    }
}

struct CalculatorButtonRow: View {
    
    var model: CalculatorModel
    
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title,
                                 size: item.size,
                                 foregroundColor: item.foregroundColor,
                                 backgroundColorName: item.backgroundColorName) {
                                    self.model.applyItem(item)
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    
    var model: CalculatorModel
    
    let pad: [[CalculatorButtonItem]] = [
        [
            .command(.clear), .command(.flip),
            .command(.percent), .op(.divide)
        ],[
            .digit(7), .digit(8), .digit(9), .op(.multiply)
        ], [
            .digit(4), .digit(5), .digit(6), .op(.minus)
        ], [
            .digit(1), .digit(2), .digit(3), .op(.plus)
        ], [
            .digit(0), .dot, .op(.equal)
        ],
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(model: self.model, row: row)
            }
        }
    }
}
