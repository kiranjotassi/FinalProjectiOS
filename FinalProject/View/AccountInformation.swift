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
    @State private var name: String = ""
    @State private var dealLocation: String = ""
    
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var dealViewModel: DealViewModel
    
    @State var preferences: [String] = []
    @State var preference: String = ""
    @State var tags: [String] = ["Beauty", "Electronics", "Outdoor", "Clothing", "Food"]
    @State private var email = ""
    
    var body: some View {
 
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
                        Text("\(name)")
                            .padding()
                    }
                }//Section
                HStack{
                    Section{
                        Text("Last Location")
                            .padding()
                            .font(.headline)
                        Spacer()
                        Text("\(dealLocation)")
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
                
                List {
                    ForEach(self.tags, id: \.self) { tag in
                        PreferenceSelectionRow(title: tag, isSelected: self.preferences.contains(tag)) {
                            if self.preferences.contains(tag) {
                                preferences.insert(contentsOf: tags, at: 0)
                                print(preferences[0])
                            }
                            else {
                                self.preferences.append(tag)
                                
                            }
                        }
                    }
                }
                Button(action:{
                    self.addPreference()
                    sheetShowing = true
                }){
                    Text("Add Preference")
                        .accentColor(Color.white)
                        .padding()
                        .background(Color(UIColor.darkGray))
                        .cornerRadius(5.0)
                }
            }//VStack
            .navigationBarTitle("Account Info", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            
    }
    //supposed to add the new preference
    private func addPreference(){
        var newUser = User()
        newUser.email = email
        newUser.name = name
        //adds in the user preferences
        newUser.preferences = preferences
        print(#function, "New Preference : \(newUser)")
        userViewModel.addPreferences(newPreference: newUser)
        self.userViewModel.fetchData()
        self.presentationMode.wrappedValue.dismiss()
        userViewModel.preferenceList = preferences
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
