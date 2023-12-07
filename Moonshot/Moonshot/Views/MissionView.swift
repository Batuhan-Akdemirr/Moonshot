//
//  MissionView.swift
//  Moonshot
//
//  Created by Batuhan Akdemir on 4.12.2023.
//

import SwiftUI


struct MissionView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
       
        ScrollView {
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width , axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                
                Label(mission.launchDate?.formatted(date: .complete , time: .omitted) ?? "N/A", systemImage: "calendar" )
                    .font(.caption)
                    .opacity(0.7)
                    .padding(.top)
           
                VStack(alignment: .leading) {
                    
                   CustomDivider()
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom , 5)
                    
                    Text(mission.description)
                    CustomDivider()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                CrewView(crew: crew)
                
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayname)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .toolbarBackground(.darkBackground, for: .navigationBar)
    }
    
    init(mission: Mission , astronauts: [String: Astronaut]){
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

