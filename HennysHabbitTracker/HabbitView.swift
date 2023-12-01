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
    let formatter1 = DateFormatter()
//    formatter1.dateStyle = .short
    var body: some View {
        NavigationStack{
            VStack{
                VStack(alignment: .leading){
                    Text("Description").font(.headline)
                    Text(habbit.description).padding()
                    Text("How often do I want to do this?").font(.headline)
                    Text(String(describing: habbit.frequency)).padding()
                    
                    
//                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                Spacer()
                Spacer()
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
                        Text(habbit.frequency == .daily ? "\(String(habbit.habbitCount)) days" :"\(String(habbit.habbitCount)) weeks" ).padding()
                        Button{
                            print("subtract one")
                            
                            if let date = habbit.mostRecentCompletionDate{
                                print(date)
                                print(formatter1.string(from: date))
                                
                            }
                            if habbit.habbitCount > 0 {
                                habbit.habbitCount = habbit.habbitCount - 1
                            }
                        } label: {
                            Image(systemName: "minus")
                        }
                    }
                    // date formatting: https://designcode.io/swiftui-handbook-format-date
                    if let date = habbit.mostRecentCompletionDate{
                        Text("Most recent completion: \(date.formatted(.iso8601.year().month().day()))").font(.headline)
                    }
                }
                Spacer()
            }
            .navigationTitle(habbit.name)
            
                
        }
    }
}

#Preview {
    let habbit = Habbit(name: "Test", description: "This is a description of a habbit", frequency: .daily, habbitCount: 0, mostRecentCompletionDate: Date.now)
    return HabbitView(habbit: habbit)
}
