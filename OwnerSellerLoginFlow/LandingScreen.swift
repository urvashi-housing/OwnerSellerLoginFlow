//
//  LandingScreen.swift
//  OwnerSellerLoginFlow
//
//  Created by Urvashi Gupta on 04/12/23.
//

import SwiftUI

struct LandingScreen: View {
    var body: some View {
        NavigationStack{
            NavigationLink(value: PostProperty.postPropertyBtnTapped) {
              
                    Label("Post Property", systemImage: "house.fill" )
                        .padding()
                
                .border(.purple, width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .navigationDestination(for: PostProperty.self) { postProperty in
                switch postProperty{
                case .postPropertyBtnTapped:
                   ChooseUserType()
                }
            }
            .navigationDestination(for: UserType.self) { user in
                switch user{
                case .Owner:
                    LoginPage()
                case .Broker:
                    LoginPage()
                case .Builder:
                    LoginPage()
                }
            }
        }

    }
}

#Preview {
    LandingScreen()
}
