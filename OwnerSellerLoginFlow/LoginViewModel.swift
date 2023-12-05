//
//  LoginViewModel.swift
//  OwnerSellerLoginFlow
//
//  Created by Urvashi Gupta on 04/12/23.
//

import Foundation


class LoginViewModel : ObservableObject{

    @Published var mobileNumber : String = ""
    @Published var password : String = ""
    @Published var userSession : User?
    let urlService = URLService<LoginData>()
    
    @MainActor
    func login() async throws{
        urlService.handleURLRequestForFetchingData(of: Constants.loginUserURL,loginModel: self) { user, error in
            if let error = error{
                print("DEBUG: Error in logging in: \(error)")
            }
            if let user = user as? LoginData{
                AuthService.shared.userSession = user.data
                do {
                   
                    let encoder = JSONEncoder()

                 
                    let data = try encoder.encode(self.userSession)

        
                    UserDefaults.standard.set(data, forKey: "user")

                } catch {
                    print("Encoding Error  (\(error))")
                }
                print("Debug: User: \(user)")
            }
        }
    }
    
  
}
