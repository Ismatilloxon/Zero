//
//  NetworkManager.swift
//  Zero
//
//  Created by Ismatilla on 18/11/22.
//

import Foundation






import Foundation
import Combine

public class NetworkingManager {
    
    @Published var error: Bool? = false
    @Published var notActiveUser = false
    static var cancellable = Set<AnyCancellable>()
    static let baseUrl = "https://e01e-84-54-83-231.eu.ngrok.io"
    let testToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcxMzgxNjA4LCJpYXQiOjE2Njg3ODk2MDgsImp0aSI6IjdiMTE1Mjk1MTY5NjRjMGQ5ZGVjZWI0ZmZmYjlkNWI2IiwidXNlcl9pZCI6Mn0.GMXaA3Io6OXoJNonSi0a_YsSQqpYla71NkWE0BFITtA"
    
    //MARK: - Refresh Token
    
    
    
    //MARK: Make Request
    class public func request(
        url: URL,
        parameters: [String : Any] = [:],
        method: RequestMethod = .GET,
        haveToToken: Bool = true,
        completionStatusCode: @escaping (Int) -> Void = {_ in}
    ) -> AnyPublisher<Data, Error>
    {
       
      
            
            func publisher(forDataTaskOutput output: URLSession.DataTaskPublisher.Output) -> AnyPublisher<Data, Error>
            {
                
                switch (output.response as? HTTPURLResponse)?.statusCode {
                                    
                case .some(200):
                    
                    DispatchQueue.main.async {
                        completionStatusCode(200)
                    }
                   
                    
                    return Result.success(output.data)
                        .publisher
                        .eraseToAnyPublisher()
                    
                default:
                    DispatchQueue.main.async {
                        completionStatusCode((output.response as? HTTPURLResponse)?.statusCode ?? 0)
                    }
                    return Fail(error: NetworkingError.status(status: Int( (output.response as? HTTPURLResponse)?.statusCode ?? 0) ))
                        .eraseToAnyPublisher()
                }
            }
            
            var request = URLRequest(url: url)
            
        var header: [String : String] = [:]
        
        header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcxMzgxNjA4LCJpYXQiOjE2Njg3ODk2MDgsImp0aSI6IjdiMTE1Mjk1MTY5NjRjMGQ5ZGVjZWI0ZmZmYjlkNWI2IiwidXNlcl9pZCI6Mn0.GMXaA3Io6OXoJNonSi0a_YsSQqpYla71NkWE0BFITtA"]
            
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header
            if !parameters.isEmpty
            {
                let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = jsonData
            }
          
            
            print("""
            
                Requset URL-> \(url)
                method: \(request.httpMethod!)
                
            
            """)
            
            return URLSession.shared.dataTaskPublisher(for: request)
                .mapError { $0 as Error }
                .flatMap(publisher(forDataTaskOutput:))
                .eraseToAnyPublisher()
         
       
    }
    
    class public func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("⚠️ ERROR = \(error)")
        }
    }
    
    
}

public enum RequestMethod: String {
    case GET, POST, PUT, DELETE
}



enum NetworkingError: LocalizedError {
    case badURLResponse(url: String)
    case status(status: Int)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
        case .status(status: let status): return "[⚠️] Status Error -> [ \(status) ]"
        case .unknown: return "[⚠️] Unknown error occured"
        }
    }
}
