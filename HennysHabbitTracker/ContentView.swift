//
//  ContentView.swift
//  HennysHabbitTracker
//
//  Created by Henrieke Baunack on 11/26/23.
//  Day 47 Challenge, 100 Days of SwiftUI

import SwiftUI
import Observation

enum Frequency: Hashable {
    case weekly, daily
}

struct Habbit: Hashable {
    var name: String
    var description: String
//    var frequency: Frequency
}

@Observable class Habbits {
    var habbitList: [Habbit]
    
    init(habbitList: [Habbit]) {
        self.habbitList = habbitList
    }
}

struct ContentView: View {
    @State var userHabbits = Habbits(habbitList: [Habbit(name: "Walk the dog", description: "Go on a walk with the dog every day"), Habbit(name: "Do Laundry", description: "Do the dirty laundry")])
    let habbits = [Habbit(name: "Walk the dog", description: "Go on a walk with the dog every day"), Habbit(name: "Do Laundry", description: "Do the dirty laundry")]
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                Text("My daily habbits").font(.headline)
                List(habbits, id: \.name ) { habbit in
                    Text(habbit.name)
                }
                Text("My weekly habbits").font(.headline)
                List {
                    Text(userHabbits.habbitList[1].name)
                }
            }
            .padding(.horizontal)
            .navigationTitle("Henny's Habbit Tracker")
        }
    }
}

#Preview {
    ContentView()
}
