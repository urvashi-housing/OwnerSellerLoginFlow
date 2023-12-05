//
//  ContentView.swift
//  OwnerSellerLoginFlow
//
//  Created by Urvashi Gupta on 04/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    var body: some View {
        Group{
            if contentViewModel.userSession != nil{
                HomePage(userProfile: contentViewModel.userSession ?? User())
            }
            else{
                LandingScreen()
            }
        }
    }
}

#Preview {
    ContentView()
}
