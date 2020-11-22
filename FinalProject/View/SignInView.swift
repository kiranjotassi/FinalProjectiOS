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
            
            Button(action:{
                print("Creating Account")
                if (self.validateData()){
                    self.addNewUser()
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
    }
    
    func validateData() -> Bool{
        //TODO for data validation - Take Home
        
        if (self.password != self.confirmPassword){
            return false
        }
        
        return true
    }
    
    func addNewUser(){
    
        
        //pop current View from the stack
        self.presentationMode.wrappedValue.dismiss()
        
    }

}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
