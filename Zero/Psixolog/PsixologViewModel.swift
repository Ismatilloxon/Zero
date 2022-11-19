//
//  PsixologViewModel.swift
//  Zero
//
//  Created by Ismatilla on 19/11/22.
//

import Foundation
import Combine

// https://8130-84-54-83-231.eu.ngrok.io/api/doctor/doctors/

class PsixologViewModel: ObservableObject {
    
    //    @Published var advertisement: HomeModel? = nil
    @Published var doctors: DoctorModel? = nil
    
    var cancellable: AnyCancellable?
    
    func fatchDoctors() {
        self.cancellable = NetworkingManager.request(url: URL(string: NetworkingManager.baseUrl + "/api/doctor/doctors/")!)
            .decode(type: DoctorModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (doctorssModel) in                guard let self = self else { return }
                self.doctors = doctorssModel
                
                self.cancellable?.cancel()
            })
    }
    
    
    
}

struct DoctorModel: Codable {
    let count: Int
    let results: [Doctor]
}


struct Doctor: Codable {
    let id: Int
    let category: Category
    let specializations: [Specialization]
    let avg_rating, total_rating: Int
    let about: String
//    let youtube_link: String
    let hour_price, created_at: String
    let user: Int
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let logo: String
    let title: String
}

// MARK: - Specialization
struct Specialization: Codable {
    let id: Int
    let title: String
}
