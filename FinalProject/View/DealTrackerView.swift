//
//  DealTrackerView.swift
//  FinalProject
//
//  Created by Patrick Ouellette on 2020-11-15.
//

import SwiftUI

struct DealTrackerView: View {
    @EnvironmentObject var dealViewModel: DealViewModel
    @State private var selection: Int? = nil
    var tagArray: [String] = []
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            
            NavigationLink(destination: DealMakerView(), tag: 1, selection: $selection){}
            NavigationLink(destination: Notifications(), tag: 2, selection: $selection){}
            List{
                ForEach(self.dealViewModel.dealList, id: \.self){ (deal) in
                    HStack{
                        
                        Image(deal.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        VStack(alignment: .leading){
                            Text("Store Name: \(deal.store)")
                            Text("Promotion: \(deal.advertisedDeal)")
                            Text("Location: \(deal.dealLocation)")
                            NavigationLink(destination: StoreMapView(location: deal.dealLocation,
                                                                     lat: deal.dealLat,
                                                                     lng: deal.dealLng)){
                                Text("View Location on Map")
                                    .foregroundColor(Color.blue)
                            }
                        }//VStack
                    }//HStack
                }//For
            }//List
        }//ZStack
        .navigationBarTitle("Available Deals", displayMode: .inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button {
                    print("New Deal")
                    self.selection = 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                
            }
            ToolbarItem(placement:.navigationBarLeading){
                Button{
                    print("Go to notifications")
                    self.selection = 2
                }label:{
                    Image(systemName: "bell.badge.fill")
                }
            }
        }
        .navigationBarBackButtonHidden(false)
        .onDisappear(){
            self.dealViewModel.dealList.removeAll()
        }
        .onAppear(){
            self.dealViewModel.fetchData()
            self.dealViewModel.dealList.removeAll()
            self.dealViewModel.getDealsByTag(tagArray: ["Beauty", "Electronics"])
        }
    }
}

struct DealTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        DealTrackerView()
    }
}
