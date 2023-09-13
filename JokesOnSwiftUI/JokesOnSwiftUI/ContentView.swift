//
//  ContentView.swift
//  JokesOnSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 13.09.2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: -Variables
    @ObservedObject var jokesVM = JokesViewModel()
    //MARK: -Body
    var body: some View {
        
        NavigationView{
            
            List(jokesVM.jokes) { element in
                
                Text(element.joke)
                
            }
            .navigationBarTitle(Text("JokeSON"))
            // Bar Button eklemek icin kullanilir
            .toolbar {
                Button(action: addJoke) {
                    Text("Add New Joke")
                }
            }
        }
    }
        // API duzgun calisirsa listeye yeni joke ekler
        func addJoke() {
            jokesVM.getJokes()
    }
}

//MARK: -Preview Provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
