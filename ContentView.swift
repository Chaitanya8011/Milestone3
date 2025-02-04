//
//  ContentView.swift
//  chaitanyagondkar_Milestone3
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext)private var viewContext
    @FetchRequest(entity:Fit.entity(),sortDescriptors: [])
    private var  fit:FetchedResults<Fit>
    @State private var ShowAddview = false
    @State private var PostEdit:Fit?
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("enter workout").font(.title)
                }
                List(fit)
                { fit in
                    NavigationLink(destination:EditView(fit:fit))
                    {
                        HStack{
                            VStack(alignment:.leading)
                            {
                                Text("\(fit.name ??  "no fitness")")
                                Text("\(fit.duration,specifier:"%2f")")
                                Text("\(fit.calories,specifier:"%2f")")
                            }
                        }
                    }.buttonStyle(PlainButtonStyle())
                        .swipeActions{
                            Button(role:.destructive)
                            {
                                deleteTransaction(fit)
                            }label:
                            {
                                Label("delete",systemImage: "trash")
                            }
                        }
                    
                }
            }.navigationBarTitle("all fitness")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing)
                    {
                        Button(action:{
                            ShowAddview = true
                        }){
                            Image(systemName: "plus")
                        }
                    }
                    
                }.sheet(isPresented:$ShowAddview)
            {
                AddView()
            }
            
        }
    }
    private  func deleteTransaction(_ fit:Fit)
    {
        viewContext.delete(fit)
        do{
            try viewContext.save()
        }
        catch{
            print("roor in \(error)")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
