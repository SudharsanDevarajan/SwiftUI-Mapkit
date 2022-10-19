//
//  LocationPreview.swift
//  SwiftUIMapKit
//
//  Created by htcuser on 24/06/22.
//

import SwiftUI

struct LocationPreview: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(spacing: 16){
                imageSection
                titleSection
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            VStack(spacing: 12.0){
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
                .cornerRadius(12)
        )
    }
}

struct LocationPreview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            LocationPreview(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationViewModel())
    }
}


extension LocationPreview{
    private var imageSection: some View{
        ZStack{
            if let image = location.imageNames.first!{
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View{
        VStack (alignment: .leading,spacing: 4){
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.name)
                .font(.subheadline)
        }
    }
    
    private var learnMoreButton: some View{
        Button {
            vm.sheetShowing = location
        } label: {
            Text("Learn more")
                .fontWeight(.bold)
                .font(.title2)
                .frame(width: 125,height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View{
        Button {
            vm.nextPressed()
        } label: {
            Text("Next")
                .fontWeight(.bold)
                .font(.title2)
                .frame(width: 125,height: 35)
        }
        .buttonStyle(.bordered)
    }
}
