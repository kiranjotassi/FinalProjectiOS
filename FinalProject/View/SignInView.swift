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
    
    var body: some View {
        NavigationView{
        VStack{
            Section{
                Text("Welcome to FastTrack Deals!")
                    .padding()
                    .font(.title)
                Text("Please sign up to being saving!")
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
            NavigationLink(destination: DealTrackerView(), tag: 1, selection: $selection){}
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
    
    func addNewUser(){
        var newUser = User()
        newUser.email = self.email
        newUser.name = self.name
        newUser.password = self.password
        userViewModel.addUser(newUser: newUser)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
