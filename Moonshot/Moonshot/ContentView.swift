//
//  ContentView.swift
//  Moonshot
//
//  Created by Jackson Barnes on 18/01/2021.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var toggleInfo = false
    
    var body: some View {
        
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(toggleInfo ? mission.formattedLaunchDate : crewNames(actualMission: mission))
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                    Button(action: {
                    self.toggleInfo = !self.toggleInfo
                    }, label: {
                    Text(self.toggleInfo ? "Crew Members" : "Launch Date")
                })
            )
        }
    }
    
    func crewNames(actualMission: Mission) -> String {
        var temp = [String]()
        for crewName in actualMission.crew {
            temp.append(crewName.name.capitalized)
        }
        return temp.joined(separator: ", ")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

