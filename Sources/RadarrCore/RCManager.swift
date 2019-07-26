//
//  RCManager.swift
//  
//
//  Created by Stefan Klein Nulent on 19/07/2019.
//

import Foundation
import Combine

public final class RCManager {
    
    // MARK: - Constants
    
    public static let shared = RCManager()
    private static let serverDefaultsKey = "RadarrCore.Server"
    
    
    
    // MARK: - Private Properties

    private var rootFolders: [RCRootFolder] = []
    private var serverSubscription: Cancellable?
    
    
    
    // MARK: - Properties
    
    public let server = CurrentValueSubject<RCServer?, Never>(nil)
    public var profiles: [RCProfile] = []
    public var rootFolder: RCRootFolder? { rootFolders.first }
    
    
    
    // MARK: - Construction
    
    private init() {
        serverSubscription = server.sink { [weak self] server in
            self?.update()
        }
        
        if let data = UserDefaults.standard.data(forKey: RCManager.serverDefaultsKey) {
            let server = try? JSONDecoder().decode(RCServer.self, from: data)
            self.server.send(server)
        }
    }
    
    
    
    // MARK: - Functions
    
    public func updateServer(host: String, apikey: String) {
        let server = RCServer(host: host, apikey: apikey)
        self.server.send(server)
        
        if let data = try? JSONEncoder().encode(server) {
            UserDefaults.standard.set(data, forKey: RCManager.serverDefaultsKey)
        }
    }
    
    public func profile(for id: Int) -> RCProfile? {
        return profiles.filter{ $0.id == id }.first
    }

    
    
    // MARK: - Private Functions
    
    private func update() {
        fetchProfiles()
        fetchRootFolders()
    }
        
    private func fetchProfiles() {
        guard let server = server.value else {
            profiles = []
            return
        }
        
        RCService(server: server)?.send(RCGetProfiles()) { [weak self] result in
            switch result {
            case .success(let profiles):
                self?.profiles = profiles
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchRootFolders() {
        guard let server = server.value else {
            rootFolders = []
            return
        }
        
        RCService(server: server)?.send(RCGetRootFolder()) { [weak self] result in
            switch result {
            case .success(let rootFolders):
                self?.rootFolders = rootFolders
            case .failure(let error):
                print(error)
            }
        }
    }
}
