//
//  HabbitView.swift
//  HennysHabbitTracker
//
//  Created by Henrieke Baunack on 11/28/23.
//

import SwiftUI

// check this for alignment: https://sarunw.com/posts/how-to-align-text-in-swiftui/

struct HabbitView: View {
    @State var habbit: Habbit
    var body: some View {
        NavigationStack{
            VStack{
                VStack(alignment: .leading){
                    Text("Description").font(.headline)
                    Text(habbit.description).padding()
                    Text("How often do I want to do this?").font(.headline)
                    Text(String(describing: habbit.frequency)).padding()
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // add a plus and minus button on both sides?
                VStack{
                    Text("Habbit counter").font(.headline)
                    HStack{
                        Button{
                            print("add one")
                            habbit.habbitCount = habbit.habbitCount + 1
                        } label: {
                            Image(systemName: "plus")
                        }
                        Text("\(String(habbit.habbitCount)) days").padding()
                        Button{
                            print("subtract one")
                            habbit.habbitCount = habbit.habbitCount - 1
                        } label: {
                            Image(systemName: "minus")
                        }
                    }
                }
            }
            .navigationTitle(habbit.name)
            
                
        }
    }
}

#Preview {
    let habbit = Habbit(name: "Test", description: "This is a description of a habbit", frequency: .daily, habbitCount: 0)
    return HabbitView(habbit: habbit)
}
