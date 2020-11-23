//
//  UserViewModel.swift
//  FinalProject
//
//  Created by Kiranjot Assi on 2020-11-19.
//

import Foundation
import SwiftUI
import UIKit
import Firebase

public class UserViewModel: ObservableObject{
    @Published var preferenceList = [User]()
    private var db = Firestore.firestore()
    
    func addPreferences(newPreference: User){
        do{
            _ = try db.collection("Users").addDocument(from: newPreference)
        }catch let error as NSError{
            print(#function, "Error creating document : \(error.localizedDescription)")
        }
    }
    func getAllPreferences(){
//        let email = userSettings.userEmail
        let email = UserDefaults.standard.string(forKey: "KEY_EMAIL")
        
        db.collection("Users")
            .whereField("email", isEqualTo: email as Any)
            .addSnapshotListener({ (querySnapshot, error) in
            
                guard let snapshot = querySnapshot else{
                    //print(#function, "Error fetching documents \(error?.localizedDescription)")
                    return
                }
                //succesfully received documents
                snapshot.documentChanges.forEach{(doc) in
                    var user = User()
                    
                    do{
                        user = try doc.document.data(as: User.self)!
                        
                        if doc.type == .added{
                            self.preferenceList.append(user)
                        }
                        
                        if doc.type == .modified{
                            //TODO for updated document
                        }
                        
                        if doc.type == .removed{
                            //TODO for deleted document
                        }
                        
                    }catch let error as NSError{
                        print("Error decoding document : \(error.localizedDescription)")
                    }
                }
            })
        
        print(#function, "Preference List : ", self.preferenceList)
    }
}
