//
//  PokemonInfoPanel.swift
//  PokeMaster
//
//  Created by Harley-xk on 2019/11/18.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonInfoPanel: View {
    
    @State var darkBlur = false
    
    let model: PokemonViewModel
    
    var abilities: [AbilityViewModel] {
        AbilityViewModel.sample(pokemonID: model.id)
    }
    
    var topIndicator: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(width: 40, height: 6)
            .opacity(0.2)
    }
    
    var pokemonDescription: some View {
        Text(model.descriptionText)
            .font(.callout)
            .foregroundColor(Color(hex: 0x666666))
            .fixedSize(horizontal: false, vertical: true)
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button("切换模糊效果") {
                self.darkBlur.toggle()
            }
            
            topIndicator
            Header(model: model)
            pokemonDescription
            Divider()
            AbilityList(model: model, abilityModels: abilities)
        }.padding(
            EdgeInsets(
                top: 12,
                leading: 30,
                bottom: 30,
                trailing: 30
            )
        ).background(BlureView(style: self.darkBlur ? .systemMaterialDark : .systemMaterial))
        .cornerRadius(30)
    }
}

extension PokemonInfoPanel {
    struct Header: View {
        let model: PokemonViewModel
        var body: some View {
            HStack(spacing: 18) {
                pokemonIcon
                pokemonName
                Divider()
                    .frame(height: 44)
                bodyStatus
            }
        }
        
        var pokemonIcon: some View {
            Image("Pokemon-\(model.id)")
                .resizable()
                .frame(width: 68, height: 68)
        }
        
        var pokemonName: some View {
            VStack {
                Text(model.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(model.color)
                Text(model.nameEN)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(model.color)
                Spacer().frame(height: 10)
                Text(model.genus)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.gray)
            }
        }
        
        struct Property: View {
            var name: String
            var value: String
            var color: Color
            var body: some View {
                HStack {
                    Text(name)
                        .foregroundColor(.gray)
                    Text(value)
                        .foregroundColor(color)
                }
                .font(.system(size: 11))
            }
        }
        
        var bodyStatus: some View {
            VStack {
                HStack {
                    VStack {
                        Text("身高")
                        Text("体重")
                    }
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                    VStack {
                        Text(model.height)
                        Text(model.weight)
                    }
                    .font(.system(size: 11))
                    .foregroundColor(model.color)
                }
                Spacer().frame(height: 12)
                typesInfo
            }
        }
        
        var typesInfo: some View {
            HStack {
                ForEach(model.types) {
                    Text($0.name)
                        .foregroundColor(.white)
                        .font(.system(size: 8))
                        .frame(width: 36, height: 14)
                        .background($0.color)
                        .cornerRadius(7)
                }
            }
        }
    }
}

extension PokemonInfoPanel {
    struct AbilityList: View {
        
        let model: PokemonViewModel
        var abilityModels: [AbilityViewModel]?
        
        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text("技能")
                    .font(.headline)
                    .fontWeight(.bold)
                if abilityModels != nil {
                    ForEach(abilityModels!) {
                        Text($0.name)
                            .font(.subheadline)
                            .foregroundColor(self.model.color)
                        Text($0.descriptionText)
                            .font(.footnote)
                            .foregroundColor(Color(hex: 0xAAAAAA))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
    
}


struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel(model: PokemonViewModel.sample(id: 1))
    }
}
