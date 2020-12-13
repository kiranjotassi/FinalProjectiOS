//
//  AccountInformation.swift
//  FinalProject
//
//  Created by Kiranjot Assi on 2020-11-13.
//

import SwiftUI

struct AccountInformation: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selection: Int? = nil
    @State private var dealLocation: String = ""
    
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var dealViewModel: DealViewModel
    
    @State var preferences: [String] = []
    @State var preference: String = ""
    
    @State private var email = ""
    
    var body: some View {
        NavigationLink(destination: Notifications(), tag: 1, selection: $selection){}
        NavigationLink(destination: DealTrackerView(), tag: 2, selection: $selection){}
            VStack{
                Section{
                    //https://sfsymbols.com/
                    Image(systemName: "person.circle")
                        .padding()
                        .font(.system(size: 100))
                }
                HStack{
                    Section{
                        Text("Name")
                            .padding()
                            .font(.headline)
                        Spacer()
                        Text("\(userViewModel.userName)")
                            .padding()
                    }
                }//Section
                Text("Shopping Preferences")
                    .padding()
                    .font(.title)
                    .frame(alignment: .leading)
                List{
                    ForEach(self.userViewModel.currentUser.preferences, id: \.self){ (preference) in
                        Text("\(preference)")
                    }
                }
            }//VStack
            .navigationBarTitle("Account Info", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .toolbar(){
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        print("Notifications")
                        self.selection = 1
                    } label: {
                        Image(systemName: "bell.badge.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        print("Deal Maker View")
                        self.selection = 2
                    } label: {
                        Image(systemName: "map.fill")
                    }
                }
            }
            .onAppear(){
                self.userViewModel.fetchData()
                
            }
            
    }
}

struct AccountInformation_Previews: PreviewProvider {
    static var previews: some View {
            AccountInformation()
    }
}
