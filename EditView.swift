//
//  EditView.swift
//  chaitanyagondkar_Milestone3
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct EditView: View {
    @Environment(\.managedObjectContext)private var viewContext
    @Environment(\.dismiss)private var dismiss
    @ObservedObject var fit:Fit
    @State private var name = ""
    @State private var duration = ""
    @State private var calories = ""
    var body: some View {
        NavigationView {
            Form{
                Section(header:Text("Edit ur work out")){
                    TextField("enyer ur workout",text:$name)
                    TextField("enyer ur calories",text:$calories).keyboardType(.decimalPad)
                    TextField("enyer ur duration",text:$duration).keyboardType(.decimalPad)
                }
                
            }.navigationBarTitle("add new fitness",displayMode:.inline)
                .navigationBarItems(leading:Button("cancel")
                                    {
                    dismiss()
                },trailing: Button("save")
                                    {
                    fit.name = name
                    fit.calories = Double(calories) ?? 0.0
                    fit.duration = Double(duration) ?? 0.0
                    SaveContext()
                    dismiss()
                }.disabled(name.isEmpty||calories.isEmpty||duration.isEmpty)).onAppear{
                    calories = String(format:"%2f",fit.calories)
                    duration = String(format:"%2f",fit.duration)
                }
        }
    }
    func SaveContext()
    {
        do{
            try viewContext.save()
        }catch{
            print("error in \(error)")
        }
    }
}


