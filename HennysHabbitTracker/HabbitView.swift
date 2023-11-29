//
//  HabbitView.swift
//  HennysHabbitTracker
//
//  Created by Henrieke Baunack on 11/28/23.
//

import SwiftUI

// check this for alignment: https://sarunw.com/posts/how-to-align-text-in-swiftui/

struct HabbitView: View {
    let habbit: Habbit
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text("Description").font(.headline)
                Text(habbit.description).padding()
                Text("How often do I want to do this?").font(.headline)
                Text(String(describing: habbit.frequency)).padding()
               
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .navigationTitle(habbit.name)
            .border(.yellow)
                
        }
    }
}

#Preview {
    let habbit = Habbit(name: "Test", description: "This is a description of a habbit", frequency: .daily)
    return HabbitView(habbit: habbit)
}
