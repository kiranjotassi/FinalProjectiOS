//
//  DealMakerView.swift
//  FinalProject
//
//  Created by Patrick Ouellette on 2020-11-19.
//

import SwiftUI

struct DealMakerView: View {
    @ObservedObject var locationManager = LocationManager()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dealViewModel: DealViewModel
    
    @State private var store: String = ""
    @State private var image: String = ""
    @State private var advertisedDeal: String = ""
    @State private var tagArray: Array<String> = []
    @State private var tag: String = ""
    @State private var dealLocation: String = ""
    @State private var dealLat: Double = 0.0
    @State private var dealLng: Double = 0.0
    
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("Store Name", text: $store).autocapitalization(.words)
                    TextField("Image Link", text: $image)
                    TextField("Advertised Deal", text: $advertisedDeal)
//  TODO turn tag into a multiSelect then append all tags to tag array
                    TextField("Category Tag", text: $tag).autocapitalization(.words)
                    Text("Store wide sale at some X% off               Item name with price or X% off")
                }
                
                Section{
                    HStack{
                        TextField("Parking Location", text:$dealLocation)
                        Button(action: {
                            self.getLocation()
                        }){
                            Image(systemName: "location")
                        }
                    }
                }
            }//form
            
            Button(action:{
                self.addDeal()
            }){
                Text("Add Deal")
                    .accentColor(Color.white)
                    .padding()
                    .background(Color(UIColor.darkGray))
                    .cornerRadius(5.0)
            }
        }
    }
    
    private func addDeal(){
        var newDeal = Deal()
        tagArray.append(tag)
        newDeal.store = self.store
        newDeal.image = self.image
        newDeal.tagArray = self.tagArray
        newDeal.advertisedDeal = self.advertisedDeal
        newDeal.dealLocation = self.dealLocation
        newDeal.dealLat = self.dealLat
        newDeal.dealLng = self.dealLng
        
        print(#function, "New Deal : \(newDeal)")
        
        dealViewModel.addDeal(newDeal: newDeal)
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private func getLocation(){
        print(#function, "Getting Location")
        
        self.locationManager.start()
        
        print(#function, "Address : \(self.locationManager.address)")
        print(#function, "Lat : \(self.locationManager.lat)")
        print(#function, "Lng : \(self.locationManager.lng)")
        
        self.dealLocation = self.locationManager.address
        self.dealLat = self.locationManager.lat + (Double.random(in: -0.06...0.06))
        self.dealLng = self.locationManager.lng + (Double.random(in: -0.06...0.06))
    }
}

struct DealMakerView_Previews: PreviewProvider {
    static var previews: some View {
        DealMakerView()
    }
}
