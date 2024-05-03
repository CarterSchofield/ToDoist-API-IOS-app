//
//  ToDoistAPI.swift
//  ToDoistAPI
//
//  Created by Carter Schofield on 11/15/23.
//

import Foundation

struct ToDoistAPI {
    static func getProjects(completion: @escaping (Result<[Project], Error>) -> Void) {
        fetchData(from: "https://api.todoist.com/rest/v2/projects", completion: completion)
    }

    static func getTasks(completion: @escaping (Result<[Task], Error>) -> Void) {
        fetchData(from: "https://api.todoist.com/rest/v2/tasks", completion: completion)
    }

    private static func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        // Specify the URL
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }

        // Create a URLRequest
        var request = URLRequest(url: url)

        // Set the HTTP method to GET
        request.httpMethod = "GET"

        // Add the Authorization header with the Bearer token
        let token = "9e38f863622e2e0a91223d5461e6fe2d9e5373d7"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        // Create a URLSession configuration
        let config = URLSessionConfiguration.default

        // Create a URLSession
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(T.self, from: data)
                    completion(.success(responseModel))
                } catch {
                    completion(.failure(error))
                }
            }
        }

        // Resume the task to initiate the request
        task.resume()
    }
}




