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
    let url = URL(fileURLWithPath: "https://vignette.wikia.nocookie.net/progressivepartyofnoobs/images/0/07/NA_icon_292x225-584x450.jpg/revision/latest?cb=20180204041337")
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom){
                
                NavigationLink(destination: DealMakerView(), tag: 1, selection: $selection){}
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
                
                Button(action:
                        {
                            print("New Deal")
                            self.selection = 1
                        }){
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color(.black))
                        .shadow(color: .green, radius: 1, x: 1, y: 1)
                }
            }//ZStack
            .navigationBarTitle("Available Deals", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .onAppear(){
                self.dealViewModel.dealList.removeAll()
                self.dealViewModel.fetchData()
                self.dealViewModel.getDealsByTag(tagArray: ["Beauty", "Electronics"])
            }
        }//NavigationView
    }
}

struct DealTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        DealTrackerView()
    }
}
