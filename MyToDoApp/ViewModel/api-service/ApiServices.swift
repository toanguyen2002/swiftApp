//
//  ApiServices.swift
//  user-manager
//
//  Created by Toán Nguyễn on 26/2/25.
//
import Foundation

class ApiService {
    static let share = ApiService()
   
    private init (){}
    private func refreshToken(completion: @escaping (Bool) -> Void) {
        guard let refreshToken = UserDefaults.standard.string(forKey: "refreshToken") else {
            completion(false)
            return
        }
        var request = URLRequest(url: URL(string: "https://api.thedogapi.com")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: ["refreshToken": refreshToken])
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(false)
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String],
               let newAccessToken = json["accessToken"] {
                UserDefaults.standard.set(newAccessToken, forKey: "accessToken")
                completion(true)
            } else {
                completion(false)
            }
        }
        task.resume()
    }
    func request(endpoint: String, method: String = "GET", isAuth: Bool = true, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: "https://api.thedogapi.com\(endpoint)") else {
            print("❌ Invalid URL:", endpoint)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("YOUR_API_KEY", forHTTPHeaderField: "x-api-key") // ✅ Thêm API Key nếu cần

        if isAuth, let token = UserDefaults.standard.string(forKey: "accessToken") {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "No response", code: 0, userInfo: nil)))
                return
            }
            
            if httpResponse.statusCode == 401 {
                print("🔄 Token expired, refreshing...")
                self.refreshToken { success in
                    if success {
                        self.request(endpoint: endpoint, method: method, isAuth: isAuth, completion: completion)
                    } else {
                        completion(.failure(NSError(domain: "Unauthorized", code: 401, userInfo: nil)))
                    }
                }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("❌ API Error:", httpResponse.statusCode)
                completion(.failure(NSError(domain: "API Error", code: httpResponse.statusCode, userInfo: nil)))
                return
            }

            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
    
}
