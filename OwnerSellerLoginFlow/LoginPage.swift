//
//  LoginPage.swift
//  OwnerSellerLoginFlow
//
//  Created by Urvashi Gupta on 04/12/23.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginViewModel = LoginViewModel()
    var body: some View {
            VStack{

                //LOGO IMAGE
                Image("Housing_Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 150)
                    .padding()
                //TEXT FIELDS
                
                VStack{
                    
                    TextField("Enter your mobile number", text: $loginViewModel.mobileNumber)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    SecureField("Enter your password", text: $loginViewModel.password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                }
                //FORGOT PASSWORD
                
                Button{
                    print("Forgot Password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,28)
                    
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                //LOGIN BUTTON
                
                Button {
                    Task{
                        try await loginViewModel.login()
                    }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360,height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)
            }
        }
    
}

#Preview {
    LoginPage()
}
