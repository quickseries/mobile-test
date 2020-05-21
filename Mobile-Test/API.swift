//
//  API.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-19.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation
import Alamofire
//import CodableAlamofire

struct APIError: Error {
  enum ErrorKind: String {
    //case genericError
    case connectionError = "Connection error"
    case noDataError = "No data error"
    case jsonError = "JSON error"
  }
  
  let kind: ErrorKind
  let message: String?
}

class API {
	
	static func fetchCategories(completion: @escaping (Result<[Category]?, APIError>) -> Void) {
		fetchQuery(url: categoriesURL()) { result in
			completion(result)
		}
	}
	
	static func fetchResources(category: Category, completion: @escaping (Result<[Resource]?, APIError>) -> Void) {
		var url: String {
			switch category.type {
			case .restaurant:
				return restaurantsURL()
			case .vacationSpot:
				return vacationSpotsURL()
			}
		}
		
		fetchQuery(url: url) { result in
			completion(result)
		}
	}
}

extension API {
	private static func fetchQuery<T: Codable>(url: String, completion: @escaping (Result<T?, APIError>) -> Void) {
		AF.request(url)
			.validate()
			.responseDecodable(of: T.self) { (response) in
				guard let objects = response.value else {
					DispatchQueue.main.async {
						completion(.failure(APIError(kind: .connectionError, message: response.error?.localizedDescription)))
					}
					return
				}
				
				DispatchQueue.main.async {
					completion(.success(objects))
				}
		}
	}
	
	/*
	//old version, manual JSON decoding
	private static func fetchQuery<T: Codable>(url: String, completion: @escaping (Result<T?, APIError>) -> Void)  {
				
		AF.request(url)
		.responseJSON { response in
			guard response.error == nil else {
				DispatchQueue.main.async {
					completion(.failure(APIError(kind:.connectionError, message:response.error?.localizedDescription)))
				}
				return
			}
			
			guard let data = response.data else {
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
	}*/
}

extension API {
	private static let baseURL = "https://raw.githubusercontent.com/quickseries/mobile-test/master/data/"

	private static func categoriesURL() -> String {
	  return "\(baseURL)categories.json"
	}
	
	private static func restaurantsURL() -> String {
	  return "\(baseURL)restaurants.json"
	}

	private static func vacationSpotsURL() -> String {
	  return "\(baseURL)vacation-spot.json"
	}

}
