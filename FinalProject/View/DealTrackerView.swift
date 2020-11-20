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
                NavigationLink(destination: DealMakerView(), tag: 1, selection: $selection){}
                Text("Deals in your Area")
                    .padding()
                    .font(.title)
                    .frame(alignment: .leading)
                List{
                    ForEach(self.dealViewModel.dealList, id: \.self){ (deal) in
                        HStack{
                            //https://sfsymbols.com/
                            Image(systemName: "purchased.circle")
                                .padding()
                                .font(.system(size: 50))
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
                Button(action:
                        {
                            print("New Deal")
                            self.selection = 1
                        }){
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color(red: 155/255, green: 100/255, blue: 255/255))
                        .shadow(color: .green, radius: 1, x: 1, y: 1)
                }
            }//ZStack
            .navigationBarTitle("Available Deals", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .onAppear(){
                self.dealViewModel.dealList.removeAll()
                self.dealViewModel.getAllDeals()
            }
        }//NavigationView
    }
}

struct DealTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        DealTrackerView()
    }
}
