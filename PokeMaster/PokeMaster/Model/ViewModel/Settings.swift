//
//  Settings.swift
//  PokeMaster
//
//  Created by Harley-xk on 2019/11/19.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI

class Settings: ObservableObject {
    
    enum AccountBehavier: CaseIterable {
        case register, login
    }
    
    enum Sorting: CaseIterable {
        case id, name, color, favorite
    }
    
    @Published var accountBehavier = AccountBehavier.login
    @Published var email = ""
    @Published var password = ""
    @Published var verifyPassword = ""
    
    @Published var showEnglishName = true
    @Published var sorting = Sorting.id
    @Published var showFavoriteOnly = false
}

extension Settings.Sorting {
    var text: String {
        switch self {
        case .id: return "ID"
        case .name: return "名字"
        case .color: return "颜色"
        case .favorite: return "最爱"
        }
    }
}

extension Settings.AccountBehavier {
    var name: String {
        switch self {
        case .register: return "注册"
        case .login: return "登录"
        }
    }
}
