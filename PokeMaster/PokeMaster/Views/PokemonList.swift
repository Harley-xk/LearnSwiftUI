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
    
    var body: some View {
        ScrollView {
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
