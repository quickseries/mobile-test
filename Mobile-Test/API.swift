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

	//alamo
	static func fetchCategories(completion: @escaping (Result<[Category]?, APIError>) -> Void)  {

	  let session:URLSession?  = URLSession.shared
	  let url:URL? = URL(string: categoriesURL())
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
		
		/*guard let json = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
		 
		 print("Not containing JSON")
		 return
		 }*/
		
		var categories:[Category]?
		
		do {
		  let decoder = JSONDecoder()

		  //custom date formater
		  //decoder.dateDecodingStrategy = .formatted(dateFormatter())

		  let decodedData = try decoder.decode([Category].self, from: data)
		  categories = decodedData
		  
		  DispatchQueue.main.async {
			completion(.success(categories))
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
}
