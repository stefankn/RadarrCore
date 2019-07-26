//
//  RCService.swift
//  
//
//  Created by Stefan Klein Nulent on 12/07/2019.
//

import Foundation

public final class RCService {

    // MARK: - Types
    
    public typealias ResultCallback<Value> = (Result<Value, Error>) -> Void
    
    
    
    // MARK: - Private Properties
    
    private let server: RCServer
    private let session = URLSession(configuration: .default)
    
    
    
    // MARK: - Construction
    
    public init?(server: RCServer?) {
        if let server = server {
            self.server = server
        } else {
            return nil
        }
    }
    
    
    
    // MARK: - Functions
    
    public func send<T: RCRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) {
        guard let url = endpoint(for: request) else {
            fatalError("Invalid URL: \(server.host), endpoint: \(request.endpoint)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        
        if request.httpMethod == .post {
            urlRequest.httpBody = body(for: request)
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue(server.apikey, forHTTPHeaderField: "X-Api-Key")

        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(T.Response.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    
    
    // MARK: - Private Functions
    
    private func endpoint<T: RCRequest>(for request: T) -> URL? {
        guard let url = URL(string: request.endpoint, relativeTo: server.url) else {
            fatalError("Invalid URL: \(server.host), endpoint: \(request.endpoint)")
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        if request.httpMethod == .get, let queryItems = try? RCURLQueryItemEncoder.encode(request), !queryItems.isEmpty {
            components?.queryItems = queryItems
        }
        
        return components?.url
    }
    
    private func body<T: RCRequest>(for request: T) -> Data? {
        do {
            let data = try JSONEncoder().encode(request)
            return !data.isEmpty ? data : nil
        } catch {
            fatalError("Invalid parameters: \(error)")
        }
    }
}
