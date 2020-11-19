//
//  Preferences.swift
//  FinalProject
//
//  Created by Kiranjot Assi on 2020-11-19.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Users: Codable, Hashable{
    @DocumentID var id = UUID().uuidString
    var email: String = ""
    var preferences: String = ""
    
    
    init(){}
    
    init(email: String, preferences: String){
        self.email = email
        self.preferences = preferences
    }
}
