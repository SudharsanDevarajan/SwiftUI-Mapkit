//
//  LocationListView.swift
//  SwiftUIMapKit
//
//  Created by htcuser on 24/06/22.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(locaton: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationViewModel())
    }
}

extension LocationListView{
    private func listRowView(location: Location) -> some View{
        HStack{
            if let image = location.imageNames.first{
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45,height: 45)
                    .cornerRadius(12)
            }
            
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
}
