//
//  AstronautView.swift
//  Moonshot
//
//  Created by Batuhan Akdemir on 4.12.2023.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    var body: some View {
      
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
                
            }
        }
        
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.darkBackground, for: .navigationBar)
    }
}
