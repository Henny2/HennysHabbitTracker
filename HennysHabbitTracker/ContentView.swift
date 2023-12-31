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
@Observable 
class Habbit: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var frequency: Frequency
    var habbitCount = 0
    var mostRecentCompletionDate: Date?
    
    init(id: UUID = UUID(), name: String, description: String, frequency: Frequency, habbitCount: Int = 0, mostRecentCompletionDate: Date? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.frequency = frequency
        self.habbitCount = habbitCount
        self.mostRecentCompletionDate = mostRecentCompletionDate
    }
}

// we want to keep track of the list of habbits and pass that around, so we track that with
@Observable 
class Habbits {
    var habbitList = [Habbit]()
    
    init() {
        self.habbitList = []
    }
}

struct ContentView: View {
    @State private var userHabbits = Habbits()
    @State private var createSheetIsShown = false

    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                Text("My daily habbits").font(.headline)
                List(userHabbits.habbitList, id: \.name ) { habbit in
                    if(habbit.frequency == .daily){
                        NavigationLink(habbit.name){
                            HabbitView(habbit: habbit)
                        }
                    }
                }.scrollContentBackground(.hidden)
                Text("My weekly habbits").font(.headline)
                List(userHabbits.habbitList, id: \.name ) { habbit in
                    if(habbit.frequency == .weekly){
                        NavigationLink(habbit.name){
                            HabbitView(habbit: habbit)
                        }
                    }
                }.scrollContentBackground(.hidden)
            }
            .padding(.horizontal)
            .navigationTitle("Henny's Habbit Tracker")
            .toolbar {
                Button("Create new habbit", systemImage: "plus"){
                    print("new habbit")
                    createSheetIsShown = true 
                }
            }
//            .background(Color.gray)
            .sheet(isPresented: $createSheetIsShown, content: {
                CreateView(habbits: userHabbits)
            })
        }
    }
}

#Preview {
    ContentView()
}
