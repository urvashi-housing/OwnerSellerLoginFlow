//
//  NetworkService.swift
//  OwnerSellerLoginFlow
//
//  Created by Urvashi Gupta on 04/12/23.
//

import Foundation


class NetworkService {

    func login(withEmail email: String,password: String) async throws {
//        do{
//            
//        }
//        catch{
//            print("DEBUG: Error in logging in : \(error.localizedDescription)")
//        }
    }
    class func fetchDataForLogin(from url : String,loginModel: LoginViewModel,completionblock: @escaping(Data?,Error?) -> Void){
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let json = [  "phone" : loginModel.mobileNumber,
                      "password" : loginModel.password,
                       "source": "ios",
                      "method":"BROKER_SIGNIN"
        ]
        let body = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        print("request body: \(request)")
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {return}
            
            if response.statusCode == 200{
                guard let data = data else {return}
                completionblock(data,nil)
            }
            else{
                print("Error : response status: \(response.statusCode)")
            }
            
        }
        dataTask.resume()
    }
    class func fetchDataForLogout(from url : String,user: User,completionblock: @escaping(Data?,Error?) -> Void){
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let json = [  "source" : "ios"
        ]
        let body = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue((user.loginAuthToken) ?? "" , forHTTPHeaderField: "login_auth_token")
        print("request body: \(request)")
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {return}
            
            if response.statusCode == 200{
                guard let data = data else {return}
                completionblock(data,nil)
            }
            else{
                print("Error : response status: \(response.statusCode)")
            }
            
        }
        dataTask.resume()
    }
}

class URLService<T:Decodable>{
    var responseHandler = ResponseHandler<T>()
    func handleURLRequestForFetchingData(of url : String,loginModel: LoginViewModel,completionBlock: @escaping(Any?,Error?) -> Void){
        NetworkService.fetchDataForLogin(from: url,loginModel: loginModel) { data, error in
            if let error = error {
                
                print("Error In Authentication  \(error.localizedDescription)")
            }
            if let data = data {
                                    
                    self.responseHandler.parseResponse(data: data) { user, error in
                        if let error = error {
                            completionBlock(nil,error)
                        }
                        if let user = user{
                            completionBlock(user,nil)
                        }
                    }
                }
        }
    }
    
    func handleURLRequestForLoggingOut(of url : String,user: User,completionBlock: @escaping(Any?,Error?) -> Void){
        NetworkService.fetchDataForLogout(from: url,user: user){ data, error in
            if let error = error {
                
                print("Error In Authentication  \(error.localizedDescription)")
            }
            if let data = data {
                                    
                    self.responseHandler.parseResponse(data: data) { user, error in
                        if let error = error {
                            completionBlock(nil,error)
                        }
                        if let user = user{
                            completionBlock(user,nil)
                        }
                    }
                }
        }
    }
    
}

//PARSE API RESPONSE
class ResponseHandler<T: Decodable> {
    
     func parseResponse(data: Data,completionBlock: @escaping (T?,Error?) -> Void){
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
             let userResponse = try decoder.decode(T.self, from: data)
            completionBlock(userResponse,nil)
        }
        catch{
            print("Data: \(data)")
            print("DEBUG: parsing error \(error)")
        }
 
    }
}

