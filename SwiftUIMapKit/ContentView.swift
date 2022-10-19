//
//  ContentView.swift
//  SwiftUIMapKit
//
//  Created by htcuser on 24/06/22.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                Text(location.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
