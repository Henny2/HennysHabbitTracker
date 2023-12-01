//
//  CreateView.swift
//  HennysHabbitTracker
//
//  Created by Henrieke Baunack on 11/27/23.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    @State private var habbitName = ""
    @State private var habbitDescription = ""
    @State private var selectedFrequency = Frequency.daily
    let habbits: Habbits
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    Section("Habbit name"){
                        TextField("Set a habbit name", text: $habbitName)
                    }
                    Section("Habbit description"){
                        TextField("Describe the habbit", text: $habbitDescription)
                    }
                    Section("Habbit frequency"){
                        Picker("fequency", selection: $selectedFrequency) {
                            ForEach(Frequency.allCases) { frequency in
                                Text(String(describing: frequency))
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(.segmented)
                    }
                }
            }
            .navigationTitle("Add new habbit")
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel"){
                        print("Cancel")
                        dismiss()
                        // need to close the sheet, dismiss
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        print("Save")
                        // saving the new habbit
                        let newHabbit = Habbit(name: habbitName, description: habbitDescription, frequency: selectedFrequency, mostRecentCompletionDate: nil)
                        habbits.habbitList.append(newHabbit)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CreateView(habbits: Habbits())
}
