//
//  SwiftUIMapKitApp.swift
//  SwiftUIMapKit
//
//  Created by htcuser on 24/06/22.
//

import SwiftUI

@main
struct SwiftUIMapKitApp: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
