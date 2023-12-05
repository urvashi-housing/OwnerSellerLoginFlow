//
//  User.swift
//  OwnerSellerLoginFlow
//
//  Created by Urvashi Gupta on 04/12/23.
//

import Foundation
enum CodingKeys : String,CodingKey{
    case email,name,phoneNumber,profileTypes,loginAuthToken
}

class User: Codable {
    var email: String?
    var name: String?
    var phoneNumber: String?
    var profileTypes : [String]?
    var loginAuthToken : String?
    init() {
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decode(String.self, forKey: .email)
        name = try values.decode(String.self, forKey: .name)
        phoneNumber = try values.decode(String.self, forKey: .phoneNumber)
        profileTypes = try values.decode([String].self, forKey: .profileTypes)
        loginAuthToken = try values.decode(String.self, forKey: .loginAuthToken)
    }
  
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encodeIfPresent(self.profileTypes, forKey: .profileTypes)
        try container.encodeIfPresent(self.loginAuthToken, forKey: .loginAuthToken)
    }
}

struct LoginData: Codable {
    var data : User
}

struct LogoutData : Codable{
    var message : String
}
