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
    @State private var sheetShowing = false
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var preferences: [String] = []
    @State var tags: [String] = ["Beauty", "Electronics", "Outdoor", "Clothing", "Food"]
    @State private var email = ""
    
    var body: some View {
        NavigationView{
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
                        Text("John Doe")
                            .padding()
                    }
                }//Section
                HStack{
                    Section{
                        Text("Last Location")
                            .padding()
                            .font(.headline)
                        Spacer()
                        Text("Toronto Premium Outlet")
                            .padding()
                    }
                }
                HStack{
                    Section{
                        Text("Number of Deals Used")
                            .padding()
                            .font(.headline)
                        Spacer()
                        Text("5")
                            .padding()
                    }
                }
                
                Text("Shopping Preferences")
                    .padding()
                    .font(.title)
                    .frame(alignment: .leading)
                
                Button(action:{
                    self.sheetShowing = true
                }){
                    Text("Add Preference")
                }
                
                List {
                    ForEach(self.tags, id: \.self) { tag in
                        PreferenceSelectionRow(title: tag, isSelected: self.preferences.contains(tag)) {
                            if self.preferences.contains(tag) {
                                self.preferences.removeAll(where: { $0 == tag })
                            }
                            else {
                                self.preferences.append(tag)
                            }
                        }
                    }
                }
            }//VStack
            .navigationBarTitle("Account Info", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
        }//NavigationView
    }
    //supposed to add the new preference
    private func addPreference(){
        var newPreference = User()
        newPreference.email = email
        print(#function, "New Preference : \(newPreference)")
        userViewModel.addPreferences(newPreference: newPreference)
        self.userViewModel.fetchData()
        self.presentationMode.wrappedValue.dismiss()
    }
    
    struct preferenceSelectionRow:View{
        var title: String
        var isSelected: Bool
        var action: () -> Void
        
        var body: some View {
            Button(action: self.action) {
                HStack {
                    Text(self.title)
                    if self.isSelected {
                        Spacer()
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}

struct AccountInformation_Previews: PreviewProvider {
    static var previews: some View {
            AccountInformation()
    }
}
