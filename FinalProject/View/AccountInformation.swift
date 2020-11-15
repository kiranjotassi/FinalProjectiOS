//
//  AccountInformation.swift
//  FinalProject
//
//  Created by Kiranjot Assi on 2020-11-13.
//

import SwiftUI

struct AccountInformation: View {
    
    @State private var selection: Int? = nil
    
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
                        //TODO: put name of user here -> temporarily set as default
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
                
                List{
                    //TODO: This is where the list of user prefererred tags will go
                    //-> will populate by default for now until we have the DB set up
                    Text("Books")
                    Text("Clothing")
                    Text("Designer")
                    Text("Food")
                    Text("Groceries")
                }//List
            }//VStack
            .navigationBarTitle("Account Info", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
        }//NavigationView
        
    }
}

struct AccountInformation_Previews: PreviewProvider {
    static var previews: some View {
            AccountInformation()
    }
}
