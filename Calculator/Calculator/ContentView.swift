//
//  ContentView.swift
//  Calculator
//
//  Created by Harley-xk on 2019/11/1.
//  Copyright © 2019 Harley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let scale: CGFloat = UIScreen.main.bounds.width / 375
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Spacer()
                Text("12345679088")
                    .foregroundColor(.primary)
                    .font(.system(size: 76))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .padding(8)
            }
            CalculatorButtonPad()
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalculatorButton: View {
    
    let fontSize: CGFloat = 18
    let title: String
    let size: CGSize
    let foregroundColor: Color
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(foregroundColor)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        }
    }
}

struct CalculatorButtonRow: View {
    
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title,
                                 size: item.size,
                                 foregroundColor: item.foregroundColor,
                                 backgroundColorName: item.backgroundColorName) {
                                    print("Button: \(item.title)")
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    
    let pad: [[CalculatorButtonItem]] = [
        [
            .command(.clear), .command(.flip),
            .command(.percent), .op(.divide)
        ],[
            .digit(7), .digit(8), .digit(9), .op(.multply)
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
                CalculatorButtonRow(row: row)
            }
        }
    }
}
