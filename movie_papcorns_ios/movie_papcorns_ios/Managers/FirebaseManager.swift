//
//  FirebaseManager.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

final class FirebaseManager {
    
    private let database = Firestore.firestore()
    
    static func start() {
        FirebaseApp.configure()
    }
    
    func signInAnonymously(completion: @escaping  ((Bool) -> Void)) {
        Auth.auth().signInAnonymously { _, error in
            completion(error == nil)
        }
    }
    
    func fetchCategories(completion: @escaping (([Category]) -> Void)) {
        var categories = [Category]()
        
        database.collection("category").getDocuments { snapshot, error in
            if let error {
                print(error.localizedDescription)
            } else {
                for document in snapshot!.documents {
                    let title = document.get("title") as! String
                    let type = document.get("order") as! Int
                    let id = document.get("id") as! Int
                    let order = document.get("order") as! Int
                    
                    categories.append(.init(id: id, order: order, title: title, type: type))
                }
                
                completion(categories)
            }
        }
        
    }
    
    func fetchContent(completion: @escaping (([Content]) -> Void)) {
        var contents = [Content]()
        
        database.collection("content").getDocuments { snapshot, error in
            if let error {
                print(error.localizedDescription)
            } else {
                for document in snapshot!.documents {
                    let imageUrl = document.get("imageUrl") as! String
                    let contentName = document.get("contentName") as! String
                    let contentId = document.get("contentId") as! Int
                    let categoryId = document.get("categoryId") as! Int
                    
                    contents.append(.init(categoryId: categoryId, contentId: contentId, contentName: contentName, imageUrl: imageUrl))
                }
                
                completion(contents)
            }
        }
    }
}
