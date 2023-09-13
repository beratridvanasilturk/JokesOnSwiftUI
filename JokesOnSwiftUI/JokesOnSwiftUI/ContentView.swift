//
//  ContentView.swift
//  JokesOnSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 13.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    var body: some View {
        
        NavigationView{
            
            List(jokesVM.jokes) { element in
                
                Text(element.joke)
                
            }.navigationBarTitle(Text("JokeSON"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
