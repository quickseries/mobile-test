//
//  API.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-19.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation

struct APIError: Error {
  enum ErrorKind: String {
    //case genericError
    case connectionError = "Connection error"
    case noDataError = "No data error"
    case jsonError = "Json error"
  }
  
  let kind: ErrorKind
  let message: String?
}

class API {
	
	static func fetchCategories(completion: @escaping (Result<[Category]?, APIError>) -> Void)  {
		fetchQuery() { result in
			completion(result)
		}
	}

	//	static func fetchResources(completion: @escaping (Result<[Location]?, APIError>) -> Void)  {
	static func fetchResources(completion: @escaping (Result<[Resource]?, APIError>) -> Void)  {
		fetchQuery() { result in
			completion(result)
		}
	}
}

extension API {
	static func fetchQuery<T: Codable>(completion: @escaping (Result<T?, APIError>) -> Void)  {
		
		let session:URLSession?  = URLSession.shared

		//find url from generic type
		let url:URL?
		
		switch T.self {
		case is [Category].Type:
			url = URL(string: categoriesURL())
		case is [Resource].Type:
			url = URL(string: resourcesURL())
		default:
			fatalError("fetchQuery: wrong type")
		}
				
		let task = session?.dataTask(with: url!) {data, response, error in
			
			guard error == nil else {
				DispatchQueue.main.async {
					completion(.failure(APIError(kind:.connectionError, message:error?.localizedDescription)))
				}
				return
			}
			
			guard let data = data else {
				DispatchQueue.main.async {
					completion(.failure(APIError(kind:.noDataError, message: nil)))
				}
				return
			}
			
			var objects:T?
			
			do {
				let decoder = JSONDecoder()
				
				let decodedData = try decoder.decode(T.self, from: data)
				objects = decodedData
				
				DispatchQueue.main.async {
					completion(.success(objects))
				}
				
			} catch let err {
				print(Strings.error, err)
				
				DispatchQueue.main.async {
					completion(.failure(APIError(kind: .jsonError, message: err.localizedDescription)))
				}
				return
			}
		}
		
		task?.resume()
	}
}

extension API {

	//https://raw.githubusercontent.com/quickseries/mobile-test/master/data/categories.json

	private static let baseURL = "https://raw.githubusercontent.com/quickseries/mobile-test/master/data/"

	static func categoriesURL() -> String {
	  return "\(baseURL)categories.json"
	}
	
	static func resourcesURL() -> String {
	  return "\(baseURL)restaurants.json"
	}

}
