//
//  MapMarkView.swift
//  SwiftUIMapKit
//
//  Created by htcuser on 24/06/22.
//

import SwiftUI

struct MapMarkView: View {
    var body: some View {
        VStack{
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .scaledToFit()
                .frame(width: 42,height: 42)
                .foregroundColor(.red)
                .padding(.bottom,52)
        }
    }
}

struct MapMarkView_Previews: PreviewProvider {
    static var previews: some View {
        MapMarkView()
    }
}
