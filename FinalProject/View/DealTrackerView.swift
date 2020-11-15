//
//  DealTrackerView.swift
//  FinalProject
//
//  Created by Patrick Ouellette on 2020-11-15.
//

import SwiftUI

struct DealTrackerView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Deals in your Area")
                    .padding()
                    .font(.title)
                    .frame(alignment: .leading)
                
                List{
                    HStack{
                        //https://sfsymbols.com/
                        Image(systemName: "purchased.circle")
                            .padding()
                            .font(.system(size: 50))
                        VStack(alignment: .leading){
                            Text("Store Name: (name)")
                            Text("Deal Item & Price or if Store wide sale")
                            Text("Location: (insert location)")
                            Button(action: {
                                print("Location Clicked")
                            }){
                                Text("View Location on Map")
                                    .foregroundColor(Color.blue)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    
                    HStack{
                        //https://sfsymbols.com/
                        Image(systemName: "purchased.circle")
                            .padding()
                            .font(.system(size: 50))
                        VStack(alignment: .leading){
                            Text("Store Name: (name)")
                            Text("Deal Item & Price or if Store wide sale")
                            Text("Location: (insert location)")
                            Button(action: {
                                print("Location Clicked")
                            }){
                                Text("View Location on Map")
                                    .foregroundColor(Color.blue)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    
                }//List
            }//VStack
            .navigationBarTitle("Available Deals", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
        }//NavigationView
    }
}

struct DealTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        DealTrackerView()
    }
}
