//
//  CreateView.swift
//  HennysHabbitTracker
//
//  Created by Henrieke Baunack on 11/27/23.
//

import SwiftUI

struct CreateView: View {
    @State private var test = "hi"
    @State private var selectedFrequency = Frequency.daily
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    Section("Habbit name"){
                        TextField("Put in something", text: $test)
                    }
                    Section("Habbit description"){
                        TextField("Description of the habbit", text: $test)
                    }
                    Section("Habbit frequency"){
                        Picker("fequency", selection: $selectedFrequency) {
                            ForEach(Frequency.allCases, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Add new habbit")
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel"){
                        print("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        print("Save")
                    }
                }
            }
        }
    }
}

#Preview {
    CreateView()
}
