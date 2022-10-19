//
//  LocationDetailView.swift
//  SwiftUIMapKit
//
//  Created by htcuser on 24/06/22.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    var location: Location
    
    var body: some View {
        ScrollView{
            VStack{
                imageView
                    .shadow(color: Color.black.opacity(0.3), radius: 10,x: 0,y: 5)
                
                VStack(alignment: .leading, spacing: 16.0){
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapSection
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            }
        }
        
        .ignoresSafeArea()
        .overlay(closeButton, alignment: .topLeading)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}


extension LocationDetailView{
    private var imageView: some View{
        TabView {
            ForEach(location.imageNames,id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading,spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        
    }
    
    private var descriptionSection: some View{
        VStack(alignment: .leading,spacing: 16){
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link){
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var mapSection: some View{
        Map(coordinateRegion: .constant(
            MKCoordinateRegion(
                center: location.coordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                MapMarkView()
            }
        }
            .allowsTightening(false)
            .aspectRatio(1,contentMode: .fit)
            .cornerRadius(30)
    }
    
    private var closeButton: some View{
        Button {
            vm.sheetShowing = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding()
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }

    }
}
