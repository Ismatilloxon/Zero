//
//  HomeVeiwModel.swift
//  Zero
//
//  Created by Ismatilla on 18/11/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
//    @Published var advertisement: HomeModel? = nil
    @Published var categories: Categories? = nil
    @Published var adv: HomeModel? = nil
    var cancellable: AnyCancellable?
    
    func fatchCategories() {
        self.cancellable = NetworkingManager.request(url: URL(string: NetworkingManager.baseUrl + "/api/doctor/categories/?limit=6")!)
            .decode(type: Categories.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (categoriesModel) in
                guard let self = self else { return }
                self.categories = categoriesModel
                
                self.cancellable?.cancel()
            })
    }
    
    
  
    func fetchAdv() {
        
        self.cancellable = NetworkingManager.request(url: URL(string: NetworkingManager.baseUrl + "/api/article/adv/")!)
            .decode(type: HomeModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (advModel) in
                guard let self = self else { return }
                self.adv = advModel
                
                self.cancellable?.cancel()
            })
    }
}


// MARK: - Welcome
struct HomeModel: Codable {
    let link: String
    let images: [String]
    
}


// MARK: - Welcome
struct Categories: Codable {
    let count: Int
    let next: String
    let results: [Value]
}

// MARK: - Result
struct Value: Codable {
    let id: Int
    let logo: String
    let title: String
}
