//
//  DealViewModel.swift
//  FinalProject
//
//  Created by Patrick Ouellette on 2020-11-17.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI
import os

class DealViewModel: ObservableObject{
    @Published var dealList = [Deal]()
    
    private var db = Firestore.firestore()
    private let COLLECTION_NAME = "Deals"
    
    func addDeal(newDeal: Deal){
        do{
            _ = try db.collection(COLLECTION_NAME).addDocument(from: newDeal)
        }catch let error as NSError{
            print(#function, "Error creating document : \(error.localizedDescription)")
        }
    }
    
//    func getDealsByTag(){
////    func getDealsByTag(tagArray){
////        let tagArray == an array of tags from the user preferences
////        TODO: Change once user preferences is complete
////              maybe pass the tag array as an arg
//        let tagArray = ["Book", "Food"]
//
//        db.collection(COLLECTION_NAME)
//            .whereField("tagArray", isEqualTo: tagArray as Any)
//            .order(by: "store", descending: true)
//            .addSnapshotListener({ (querySnapshot, error) in
//
//                guard let snapshot = querySnapshot else{
//                    print(#function, "Error fetching documents \(error!.localizedDescription)")
//                    return
//                }
//
//                //succesfully received documents
//                snapshot.documentChanges.forEach{(doc) in
//                    var deal = Deal()
//
//                    do{
//                        deal = try doc.document.data(as: Deal.self)!
//
//                        if doc.type == .added{
//
//                            if (!self.dealList.contains(deal)){
//                                self.dealList.append(deal)
//                            }
//                        }
//
//                        if doc.type == .modified{
//                            //TODO for updated document
//                        }
//
//                        if doc.type == .removed{
//                            //TODO for deleted document
//                            let docID = doc.document.documentID
//
//                            let index = self.dealList.firstIndex(where: {
//                                ($0.id?.elementsEqual(docID))!
//                            })
//
//                            if (index != nil){
//                                self.dealList.remove(at: index!)
//                            }
//                        }
//
//                        self.dealList.sort{ (currentObj, nextObj) in
//                            currentObj.store > nextObj.store
//                        }
//
////                        print(#function, "Deal List : ", self.dealList)
//                    }catch let error as NSError{
//                        print("Error decoding document : \(error.localizedDescription)")
//                    }
//                }
//            })
//    }

    func getAllDeals(){
        
        db.collection(COLLECTION_NAME)
            .order(by: "store", descending: true)
            .addSnapshotListener({ (querySnapshot, error) in
                
                guard let snapshot = querySnapshot else{
                    print(#function, "Error fetching documents \(error!.localizedDescription)")
                    return
                }
                
                //succesfully received documents
                snapshot.documentChanges.forEach{(doc) in
                    var deal = Deal()
                    
                    do{
                        deal = try doc.document.data(as: Deal.self)!
                        
                        if doc.type == .added{
                            
                            if (!self.dealList.contains(deal)){
                                self.dealList.append(deal)
                            }
                        }
                        
                        if doc.type == .modified{
                            //TODO for updated document
                        }
                        
                        if doc.type == .removed{
                            //TODO for deleted document
                            let docID = doc.document.documentID
                            
                            let index = self.dealList.firstIndex(where: {
                                ($0.id?.elementsEqual(docID))!
                            })
                            
                            if (index != nil){
                                self.dealList.remove(at: index!)
                            }
                        }
                        
                        self.dealList.sort{ (currentObj, nextObj) in
                            currentObj.store > nextObj.store
                        }
                        
                        //                        print(#function, "Deal List : ", self.dealList)
                    }catch let error as NSError{
                        print("Error decoding document : \(error.localizedDescription)")
                    }
                }
            })
    }
    
    func deleteDeal(index: Int){
        db.collection(COLLECTION_NAME)
            .document(self.dealList[index].id!)
            .delete{ (error) in
                
                if let error = error{
                    Logger().error("Error deleting document \(error.localizedDescription)")
                }else{
                    Logger().debug("Document successfully deleted.")
                }
                
            }
    }
    
    func updateDeal(deal: Deal, index: Int){
        
        db.collection(COLLECTION_NAME)
            .document(self.dealList[index].id!)
            .updateData(["store" : deal.store , "advertisedDeal" : deal.advertisedDeal ]){ (error) in
                if let error = error{
                    Logger().error("Error updating document \(error.localizedDescription)")
                }else{
                    Logger().debug("Document successfully updated.")
                }
            }
    }
}
