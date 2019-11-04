//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Harley-xk on 2019/11/4.
//  Copyright © 2019 Harley. All rights reserved.
//

import Foundation
import Combine

class CalculatorModel: ObservableObject {
    
    @Published var brain: CalculatorBrain = .left("0")
    
    @Published var history: [CalculatorButtonItem] = []
    
    func applyItem(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
    }
    
    var historyDetail: String {
        return history.map { $0.title }.joined()
    }
}
