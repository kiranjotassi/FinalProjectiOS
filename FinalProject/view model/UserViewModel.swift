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
import FirebaseFirestore

public class UserViewModel: ObservableObject{
    @Published var preferenceList = [String]()
    @Published var userInfo = [User]()
    @Published var userName = String()
    @Published var currentUser = User()
    
    private var db = Firestore.firestore()
    private let COLLECTION_NAME = "Users"
    var documentid = UUID().uuidString
    
    
    func addUser(newUser: User){
        do{
            _ = try db.collection("Users").addDocument(from: newUser)
        }catch let error as NSError{
            print(#function, "error creating document: \(error.localizedDescription)")
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
                            self.userInfo.append(user)
                        }
                        
                    }catch let error as NSError{
                        print("Error decoding document : \(error.localizedDescription)")
                    }
                }
            })
        
        print(#function, "Preference List : ", self.userInfo)
    }
    //this needs to be rewritten -> it needs to be re written so that it will actually work
    func fetchData(){
        db.collection(COLLECTION_NAME)
            .whereField("name", isEqualTo: userName)
            .order(by: "name", descending: true)
            .addSnapshotListener({ (querySnapshot, error) in

                guard let snapshot = querySnapshot else{
                    print(#function, "Error fetching documents \(error!.localizedDescription)")
                    return
                }

                //succesfully received documents
                snapshot.documentChanges.forEach{(doc) in

                    do{
                        self.currentUser = try doc.document.data(as: User.self)!
                        
                        
                    }catch let error as NSError{
                        print("Error decoding document : \(error.localizedDescription)")
                    }
                }
            })
    }
}
