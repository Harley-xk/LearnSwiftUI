//
//  SettingView.swift
//  PokeMaster
//
//  Created by Harley-xk on 2019/11/19.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    
    @ObservedObject var settings = Settings()
    
    var body: some View {
        Form {
            accountSection
            optionSection
            actionsSection
        }
    }
    
    var accountSection: some View {
        Section(header: Text("账户")) {
            Picker(selection: $settings.accountBehavier, label: Text("")) {
                ForEach(Settings.AccountBehavier.allCases, id: \.self) {
                    Text($0.name)
                }
            }.pickerStyle(SegmentedPickerStyle())
            TextField("电子邮箱", text: $settings.email)
            SecureField("密码", text: $settings.password)
            if settings.accountBehavier == .register {
                SecureField("确认b密码", text: $settings.verifyPassword)
            }
            Button(settings.accountBehavier.name) {
                print("登录/注册")
            }
        }
    }
    
    var optionSection: some View {
        Section(header: Text("选项")) {
            Toggle(isOn: $settings.showEnglishName) { Text("显示英文名") }
            Picker(selection: $settings.sorting, label: Text("排序方式")) {
                ForEach(Settings.Sorting.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            Toggle(isOn: $settings.showFavoriteOnly) { Text("只显示收藏") }
        }
    }
    
    var actionsSection: some View {
        Section() {
            Button("清空缓存") {
                print("清空缓存")
            }.foregroundColor(.red)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
