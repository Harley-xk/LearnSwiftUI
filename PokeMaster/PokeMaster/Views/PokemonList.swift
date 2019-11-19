//
//  PokemonList.swift
//  PokeMaster
//
//  Created by Harley-xk on 2019/11/18.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    
    @State var expendingIndex: Int?
    
    @State var searchingKeyword: String = ""
    
    var body: some View {
        ScrollView {
            
            HStack {
                Spacer()
                Image(systemName: "magnifyingglass")
                TextField("搜索", text: $searchingKeyword)
            }.frame(height: 44)
                .background(Color.white)
            .cornerRadius(8)
                .shadow(color: Color(hex: 0xCCCCCC), radius: 2)
//                .border(Color(hex: 0xCCCCCC), width: 0.5)
            .padding(.horizontal, 12)
            
        ForEach(PokemonViewModel.all) { pokemon in
                PokemonInfoRow(
                    model: pokemon,
                    expanded: self.expendingIndex == pokemon.id
                )
                    .onTapGesture {
                        if self.expendingIndex == pokemon.id {
                            self.expendingIndex = nil
                        } else {
                            self.expendingIndex = pokemon.id
                        }
                }
            }
        }.overlay(
            VStack {
                Spacer()
                PokemonInfoPanel(model: .sample(id: 1))
            }.edgesIgnoringSafeArea(.bottom)
        )
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
