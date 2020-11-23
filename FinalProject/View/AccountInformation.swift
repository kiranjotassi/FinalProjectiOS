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
    
    @State private var preference = ""
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
                
                List{
                    ForEach(self.userViewModel.preferenceList, id: \.self){(preference) in
                        Text("\(preference.preferences)")
                    }
                    Text("Books")
                    Text("Clothing")
                    Text("Designer")
                    Text("Food")
                    Text("Groceries")
                }//List
            }//VStack
            .navigationBarTitle("Account Info", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            //adding a new preference
            //open sheet
            .sheet(isPresented: $sheetShowing){
                TextField("Enter a deal you would like to watch.", text: $preference)
                Button(action:{
                    if preference == "" || preference == " " {
                    }else{
                        //go to method
                        self.addPreference()
                    }
                    //reset values
                    preference = ""
                    sheetShowing = false
                }){
                    Text("Add Preference")
                }
            }
        }//NavigationView
    }
    //supposed to add the new preference
    private func addPreference(){
        var newPreference = User()
        newPreference.preferences = self.preference
        
        print(#function, "New Preference : \(newPreference)")
        //AAAAAAAAA this adds the new preference in...hopefully
        userViewModel.addPreferences(newPreference: newPreference)
    }
}

struct AccountInformation_Previews: PreviewProvider {
    static var previews: some View {
            AccountInformation()
    }
}
