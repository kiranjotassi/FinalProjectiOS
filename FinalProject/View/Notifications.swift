//
//  Notifications.swift
//  FinalProject
//
//  Created by Kiranjot Assi on 2020-11-15.
//

import SwiftUI

struct Notifications: View {
    var body: some View {
        NavigationView{
                List{
                    //NOTIFICATIONS WILL BE ADDED AUTOMATICALLY ONCE THE DB IS IMPLEMENTED -> populated by default for now
                    Text("There is a new deal in the area. Check the map for more information.")
                    Text("Congrats! You have successfully reserved your item.")
                    Text("Your item has successfully been shipped. Check back soon for your tracking details!.")
                }
            .navigationBarTitle("Notifications", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            
        }//NavigationView
        
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
