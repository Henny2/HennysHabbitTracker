//
//  ContentView.swift
//  HennysHabbitTracker
//
//  Created by Henrieke Baunack on 11/26/23.
//  Day 47 Challenge, 100 Days of SwiftUI

import SwiftUI
import Observation


// make enum available for picker
// https://sarunw.com/posts/swiftui-picker-enum/
enum Frequency: CaseIterable, Identifiable, CustomStringConvertible {
    case weekly, daily
    
    // making an id
    var id: Self { self }

    var description: String {
        switch self {
        case .daily:
            return "daily"
        case .weekly:
            return "weekly"
        }
    }
}

// this is basically the data structure for storing habbit info, thus it's a struct
struct Habbit: Hashable {
    var name: String
    var description: String
    var frequency: Frequency
}

// we want to keep track of the list of habbits and pass that around, so we track that with @Observable
@Observable class Habbits {
    var habbitList: [Habbit]
    
    // we can change the above to the following to get rid of the init() method but for that we need the add view first
    // var habbitList = [Habbit]()
    
    
    init(habbitList: [Habbit]) {
        self.habbitList = habbitList
    }
}

struct ContentView: View {
    @State var userHabbits = Habbits(habbitList: [Habbit(name: "Walk the dog", description: "Go on a walk with the dog every day", frequency: .daily), Habbit(name: "Do Laundry", description: "Do the dirty laundry", frequency: .weekly), Habbit(name: "Water Plants", description: "Water the plants", frequency: .weekly)])
    @State private var createSheetIsShown = false
//    let habbits = [Habbit(name: "Walk the dog", description: "Go on a walk with the dog every day"), Habbit(name: "Do Laundry", description: "Do the dirty laundry")]
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                Text("My daily habbits").font(.headline)
                List(userHabbits.habbitList, id: \.name ) { habbit in
                    if(habbit.frequency == .daily){
                        Text(habbit.name)
                    }
                }
                Text("My weekly habbits").font(.headline)
                List(userHabbits.habbitList, id: \.name ) { habbit in
                    if(habbit.frequency == .weekly){
                        Text(habbit.name)
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Henny's Habbit Tracker")
            .toolbar {
                Button("new habbit"){
                    print("new habbit")
                    createSheetIsShown = true 
                }
            }
            .sheet(isPresented: $createSheetIsShown, content: {
                CreateView(habbits: userHabbits)
            })
        }
    }
}

#Preview {
    ContentView()
}
