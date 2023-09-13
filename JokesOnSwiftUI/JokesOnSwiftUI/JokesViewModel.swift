//
//  JokesViewModel.swift
//  JokesOnSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 13.09.2023.
//

import Foundation
import Alamofire

// ObservableObject ile JokesVM sinifini ContentView'da Observed olarak gozlemleme imkani saglar.
class JokesViewModel : ObservableObject {
    //MARK: -Variables
    // ViewModelde @published ile bildirilen icerige ContentView'da erisme imkani saglar. (public var gibi dusunulebilir)
    @Published var jokes = [Value]()
    
    init() {
        getJokes()
    }
    
    //MARK: -Funcs
    func getJokes() {
        
        AF.request("https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json", method: .get).responseDecodable(of: Welcome.self) { response in
            
            switch response.result {
                
            case .success(let data):
                let value = data.value
                self.jokes += value
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
