//
//  Users.swift
//  FinalProject
//
//  Created by Kiranjot Assi on 2020-11-19.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct User: Codable, Hashable{
    @DocumentID var id = UUID().uuidString
    var name: String = ""
    var email: String = ""
    var password: String = ""
    var preferences: [String] = []
    
    
    init(){}
    
    init(email: String, name: String, password: String, preferences: [String]){
        self.email = email
        self.name = name
        self.password = password
        self.preferences = preferences
    }
}
