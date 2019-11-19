//
//  PokemonRootView.swift
//  PokeMaster
//
//  Created by Harley-xk on 2019/11/19.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonRootView: View {
    var body: some View {
        NavigationView {
            PokemonList()
                .navigationBarTitle("宝可梦列表")
        }
    }
}

struct PokemonRootView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRootView()
    }
}
