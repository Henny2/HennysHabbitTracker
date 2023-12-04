//
//  EditView.swift
//  HennysHabbitTracker
//
//  Created by Henrieke Baunack on 12/2/23.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var habbitName = ""
    @State private var habbitDescription = ""
    @State private var selectedFrequency = Frequency.daily
    @State var habbit: Habbit
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    Section("Habbit name"){
                        TextField(habbit.name, text: $habbitName)
                    }
                    Section("Habbit description"){
                        TextField(habbit.description, text: $habbitDescription)
                    }
                    Section("Habbit frequency"){
                        Picker("fequency", selection: $selectedFrequency) {
                            ForEach(Frequency.allCases) { frequency in
                                Text(String(describing: frequency))
                            }
                        }
                        .onAppear { selectedFrequency = habbit.frequency}
                        .labelsHidden()
                        .pickerStyle(.segmented)
                    }
                }
            }
            .navigationTitle("Edit habbit")
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
                        // making the edits to the existing habbit
                        habbit.description = habbitDescription
                        habbit.name = habbitName
                        habbit.frequency = selectedFrequency
                        print(habbit.name)
                        print(habbit.frequency)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditView(habbit: Habbit(name: "test", description: "test", frequency: .daily))
}
