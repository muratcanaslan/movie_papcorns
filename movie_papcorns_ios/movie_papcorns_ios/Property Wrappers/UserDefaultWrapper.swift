//
//  UserDefaultWrapper.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import Foundation

@propertyWrapper
public struct UserDefaultWrapper<T: Codable> {
    
    public struct Wrapper<T>: Codable where T: Codable {
        let wrapped: T
    }
    
    private let key: String
    private let defaultValue: T
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key) as? Data
                else { return defaultValue }
            let value = try? JSONDecoder().decode(Wrapper<T>.self, from: data)
            return value?.wrapped ?? defaultValue
        }
        set {
            do {
                let data = try JSONEncoder().encode(Wrapper(wrapped: newValue))
                UserDefaults.standard.set(data, forKey: key)
            } catch {
                print(error)
            }
        }
    }
}
