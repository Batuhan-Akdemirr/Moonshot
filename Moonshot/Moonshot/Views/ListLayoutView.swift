//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Batuhan Akdemir on 4.12.2023.
//

import SwiftUI

struct ListLayoutView: View {
    
    let astronauts  : [String : Astronaut ]
    let missions : [Mission]
    
    var body: some View {
        
        List {
            ForEach(missions) { mission in
               
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50 , height: 50)
                            .padding(8)
                            .padding(.horizontal)
                          
                       
                        VStack {
                            Text(mission.displayname)
                                .font(.title3)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .opacity(0.5)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.lightBackground)
                        .foregroundColor(.white)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                     .overlay(
                      RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                    )
                }
                .listRowBackground(Color.darkBackground)
            }
        }
        .listStyle(.plain)
      
    }
}


