//
//  LocationViewModel.swift
//  SwiftUIMapKit
//
//  Created by htcuser on 24/06/22.
//

import SwiftUI
import MapKit

class LocationViewModel: ObservableObject{
    
    @Published var locations: [Location]
    
    @Published var mapLocation: Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationList: Bool = false
    
    @Published var sheetShowing: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        
        self.mapLocation = locations.first!
        
        updateMapRegion(location: locations.first!)
    }
    
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationList(){
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(locaton: Location){
        withAnimation(.easeInOut){
            mapLocation = locaton
            showLocationList = false
        }
    }
    
    func nextPressed(){
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation} )else{
            return
        }
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else{
            guard let firstLocation = locations.first else { return }
            showNextLocation(locaton: firstLocation)
            return
        }
        
        showNextLocation(locaton: locations[nextIndex])
    }
}
