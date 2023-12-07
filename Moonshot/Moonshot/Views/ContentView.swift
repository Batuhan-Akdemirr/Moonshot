//
//  ContentView.swift
//  Moonshot
//
//  Created by Batuhan Akdemir on 3.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts  : [String : Astronaut ] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    @AppStorage("isList") private var isList = false
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                if isList {
                    ListLayoutView(astronauts: astronauts, missions: missions)
                } else {
                    GridLayoutView(astronauts: astronauts, missions: missions)
                }
            }
         
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button{
                    isList.toggle()
                } label: {
                    if isList {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    } else {
                        Label("Show as table", systemImage: "list.dash")
                    }
                }
            }
            .toolbarBackground(.darkBackground, for: .navigationBar)
        }
    }
}

