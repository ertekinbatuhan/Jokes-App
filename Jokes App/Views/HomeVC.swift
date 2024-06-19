//
//  ContentView.swift
//  Jokes App
//
//  Created by Batuhan Berk Ertekin on 19.06.2024.
//

import SwiftUI

struct HomeVC: View {
    
    @ObservedObject var jokesViewModel = JokesViewModel()
    
    @State private var searchText = ""
    @State private var filteredJokes = [Jokes]()
    
    var body: some View {
        NavigationStack{
            
            List(jokesViewModel.jokes) { element in
            
                Text(element.value)
                
            }.navigationTitle("Jokes").toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        jokesViewModel.addNewJokes()
                    }
                      label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }.searchable(text: $searchText).onChange(of: searchText) { searchJokes  in
           
            print(searchJokes)
            
        }
    }
    
}

#Preview {
    HomeVC()
}
