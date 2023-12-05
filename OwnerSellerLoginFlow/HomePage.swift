//
//  HomePage.swift
//  OwnerSellerLoginFlow
//
//  Created by Urvashi Gupta on 04/12/23.
//

import SwiftUI

struct HomePage: View {
    var userProfile : User
    var body: some View {
        VStack{
            Text("Email: \(userProfile.email ?? "")")
            Text("Name: \(userProfile.name ?? "")")
            Text("phone Number: \(userProfile.phoneNumber ?? "")")
            Text("ProfileType: \(userProfile.profileTypes?.description ?? "")")
            
            Button(action: {
                AuthService.shared.logout()
            }, label: {
               Text("Logout")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360,height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            })
        }
        
    }
}

#Preview {
    HomePage(userProfile: User())
}
