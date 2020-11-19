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
    
    var body: some View {
        NavigationView{
            ZStack{
                
//                NavigationLink(destination: StoreMapView(location: self.deal.dealLocation,
//                                                           lat: self.deal.dealLat,
//                                                           lng: self.deal.dealLng),
//                               tag: 1, selection: $selection){}
                
                Text("Deals in your Area")
                    .padding()
                    .font(.title)
                    .frame(alignment: .leading)
                
                List{
                    ForEach(self.dealViewModel.dealList, id: \.self){ (deal) in
                        //NavigationLink(destination: StoreMapView(deal: deal)){
                            
                        HStack{
                            //https://sfsymbols.com/
                            Image(systemName: "purchased.circle")
                                .padding()
                                .font(.system(size: 50))
                            VStack(alignment: .leading){
                                Text("Store Name: \(deal.store)")
                                Text("Promotion: \(deal.advertisedDeal)")
                                Text("Location: \(deal.dealLocation)")
                                Button(action: {
                                    print("Location Clicked")
                                }){
                                    Text("View Location on Map")
                                        .foregroundColor(Color.blue)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }//VStack
                        }//HStack
                    }//For
                }//List
            }//ZStack
            .navigationBarTitle("Available Deals", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
//            .onAppear(){
//                self.parkingViewModel.parkingList.removeAll()
//                self.parkingViewModel.getAllParkings()
//            }
        }//NavigationView
    }
}

struct DealTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        DealTrackerView()
    }
}
