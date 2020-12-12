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
            }//VStack
            .navigationBarTitle("Account Info", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            
    }
}

struct AccountInformation_Previews: PreviewProvider {
    static var previews: some View {
            AccountInformation()
    }
}
