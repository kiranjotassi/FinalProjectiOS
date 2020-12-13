//
//  SignInView.swift
//  FinalProject
//
//  Created by Kiranjot Assi on 2020-11-22.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var selection: Int? = nil
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State var preferences: [String] = []
    @State var preference: String = ""
    @State var tags: [String] = ["Beauty", "Electronics", "Outdoor", "Clothing", "Food"]
    
    var body: some View {
        NavigationView{
        VStack{
            Section{
                Text("Welcome to FastTrack Deals!")
                    .padding()
                    .font(.title)
                    .foregroundColor(.purple)
                Text("Please sign up to being saving!")
                    .foregroundColor(.purple)
            }
            Section{
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
            }
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
            NavigationLink(destination: AccountInformation(), tag: 1, selection: $selection){}
            Button(action:{
                print("Creating Account")
                
                if (self.validateData()){
                    self.addNewUser()
                    self.selection = 1
                }
                
            }){
                Text("Sign Me Up!")
                    .accentColor(Color.white)
                    .padding()
                    .background(Color(UIColor.darkGray))
                    .cornerRadius(5.0)
            }
            
        }
       
    }
        .navigationBarBackButtonHidden(true)
    }
    
    func validateData() -> Bool{
        if (self.password != self.confirmPassword){
            return false
        }
        
        return true
    }
    //private func addPreference(){
        //var newUser = User()
        //newUser.email = email
        //newUser.name = name
        
   // }
    
    func addNewUser(){
        var newUser = User()
        newUser.email = self.email
        newUser.name = self.name
        newUser.password = self.password
        userViewModel.userName = name
        //adds in the user preferences
        newUser.preferences = preferences
        print(#function, "New Preference : \(newUser)")
        self.presentationMode.wrappedValue.dismiss()
        userViewModel.preferenceList = preferences
        userViewModel.addUser(newUser: newUser)
        
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
