//
//  ChooseUserType.swift
//  OwnerSellerLoginFlow
//
//  Created by Urvashi Gupta on 04/12/23.
//

import SwiftUI

struct ChooseUserType: View {
    var body: some View {
       
            VStack(spacing: 16){
                HStack(spacing: 16){
                    NavigationLink(value : UserType.Owner ){
                        Label("Owner", systemImage: "person.circle.fill")
                            .padding(8)
                            .foregroundStyle(.white)
                            .font(.title)
                            .background(Capsule().foregroundStyle(.pink))
                            
                    }
                    NavigationLink(value : UserType.Broker ){
                        Label("Broker", systemImage: "person.circle.fill")
                            .padding(8)
                            .foregroundStyle(.white)
                            .font(.title)
                            .background(Capsule().foregroundStyle(.pink))
                    }
                    
                }
                NavigationLink(value : UserType.Builder ){
                    Label("Builder", systemImage: "person.circle.fill")
                        .padding(8)
                        .foregroundStyle(.white)
                        .font(.title)
                        .background(Capsule().foregroundStyle(.pink))
                }
            }
     
        }
    
}

#Preview {
    NavigationStack {
        ChooseUserType()
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
