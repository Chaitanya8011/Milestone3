//
//  AddView.swift
//  chaitanyagondkar_Milestone3
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext)private var viewContext
    @Environment(\.dismiss)private var dismiss
    @State private var name = ""
    @State private var duration = ""
    @State private var calories = ""
    var body: some View {
        NavigationView {
            Form{
                Section(header:Text("enter ur work out")){
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
                    addTransaction()
                    dismiss()
                }.disabled(name.isEmpty||calories.isEmpty||duration.isEmpty))
        }
    }
    func addTransaction()
    {
        let newTransaction = Fit(context:viewContext)
        newTransaction.name = name
        
        if let calorieisDouble = Double(calories),let durationDouble = Double(duration){
            newTransaction.calories = calorieisDouble
            newTransaction.duration = durationDouble
        }
        do{
            try viewContext.save()
        }catch{
            print("error\(error)")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
