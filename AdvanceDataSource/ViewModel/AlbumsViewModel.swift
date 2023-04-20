//
//  AlbumsViewModel.swift
//  AdvanceDataSource
//
//  Created by Phincon on 20/04/23.
//

import Foundation

class AlbumsViewModel{
    func fetchData(completion: @escaping(([Album]) -> Void)){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("An unknown error occured: \(error.localizedDescription)")
            }
            
            if let data = data, let albums = try? JSONDecoder().decode([Album].self, from: data){
                completion(albums)
            }
        }.resume()
    }
}
