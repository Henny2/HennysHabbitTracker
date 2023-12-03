//
//  HabbitView.swift
//  HennysHabbitTracker
//
//  Created by Henrieke Baunack on 11/28/23.
//

import SwiftUI

extension Date {
        func formatDate() -> String {
                let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMM d, HH mm ss")
            return dateFormatter.string(from: self)
        }
}

// check this for alignment: https://sarunw.com/posts/how-to-align-text-in-swiftui/

// maybe I have to make habbit a class too? So that I can pass the info around 

struct HabbitView: View {
    @State var habbit: Habbit
    @State private var editSheetIsShown = false
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
                            habbit.habbitCount = habbit.habbitCount + 1
                            habbit.mostRecentCompletionDate = Date.now
                            
                        } label: {
                            Image(systemName: "plus")
                        }
                        Text(habbit.frequency == .daily ? "\(String(habbit.habbitCount)) days" :"\(String(habbit.habbitCount)) weeks" ).padding()
                        Button{
                            if habbit.habbitCount > 0 {
                                habbit.habbitCount = habbit.habbitCount - 1
                                habbit.mostRecentCompletionDate = Date.now
                            }
                            
                        } label: {
                            Image(systemName: "minus")
                        }
                    }
                    // date formatting: https://designcode.io/swiftui-handbook-format-date
                    if let date = habbit.mostRecentCompletionDate{
                        Text("Most recent counter change: \n \(date.formatDate())")
                    }
                }
                Spacer()
            }
            .navigationTitle(habbit.name)
            .toolbar{
                Button("Edit"){
                    print("edit habbit")
                    editSheetIsShown = true 
                }
            }
            .sheet(isPresented: $editSheetIsShown, content: {
                EditView(habbit: habbit)
            })
            
                
        }
    }
}

#Preview {
    let habbit = Habbit(name: "Test", description: "This is a description of a habbit", frequency: .daily, habbitCount: 0)
    return HabbitView(habbit: habbit)
}


// todo: add an edit button to edit a habbit on the detail view
// after that move on with tutorials
