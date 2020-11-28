//
//  Deal.swift
//  FinalProject
//
//  Created by Patrick Ouellette on 2020-11-17.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Deal : Codable, Hashable {
    @DocumentID var id = UUID().uuidString
    var store: String = ""
    var image: String = ""
    var advertisedDeal: String = ""
    var dealLocation: String = ""
    var tagArray: [String] = []
    var dealLat: Double = 0.0
    var dealLng: Double = 0.0
    
    init(){}
    
    init(store: String, image: String, advertisedDeal: String, dealLocation: String, tagArray: [String]){
        
        self.store = store
        self.image = image
        self.advertisedDeal = advertisedDeal
        self.dealLocation = dealLocation
        self.tagArray = tagArray
    }
}
