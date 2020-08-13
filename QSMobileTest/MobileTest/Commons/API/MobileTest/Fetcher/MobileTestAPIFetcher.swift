//
//  MobileTestAPIFetcher.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//


import Foundation
import Combine

typealias JSONDictionary = [String: Any]


protocol MobileTestAPIFetchable {
    func categories() -> AnyPublisher<CategoriesResponse, MobileTestAPIError>

    func restaurants() -> AnyPublisher<RestaurantsResponse, MobileTestAPIError>
    
    func vacationSpots() -> AnyPublisher<VacationSpotsResponse, MobileTestAPIError>
}


class MobileTestAPIFetcher {
    private let session: URLSession

    var dataTask: URLSessionDataTask?

    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - MobileTestAPIFetcher API
private extension MobileTestAPIFetcher {
    struct MobileTestAPI {
        static let scheme = "https"
        static let host = "raw.githubusercontent.com"
        static let path = "quickseries/mobile-test/master/data"
    }
    
    enum Paths: String {
        case CATEGORIES = "categories.json"
        case RESTAURANTS = "restaurants.json"
        case VACATION_SPOTS = "vacation-spot.json"
    }

    private func baseURL(forPath path: Paths) -> String {
        "\(MobileTestAPI.scheme)://\(MobileTestAPI.host)/\(MobileTestAPI.path)/\(path.rawValue)"
    }
    
    func makeCategoriesComponents() -> URLComponents? {
        URLComponents(string: baseURL(forPath: .CATEGORIES))
    }
    
    func makeRestaurantsComponents() -> URLComponents? {
        URLComponents(string: baseURL(forPath: .RESTAURANTS))
    }
    func makeVacationSpotsComponents() -> URLComponents? {
        URLComponents(string: baseURL(forPath: .VACATION_SPOTS))
    }
  
}

// MARK: - MobileTestAPIFetchable
extension MobileTestAPIFetcher: MobileTestAPIFetchable {
    
    func categories() -> AnyPublisher<CategoriesResponse, MobileTestAPIError> {
        fetchAPI(with: makeCategoriesComponents())
    }
    
    func restaurants() -> AnyPublisher<RestaurantsResponse, MobileTestAPIError> {
        fetchAPI(with: makeRestaurantsComponents())
    }
    
    func vacationSpots() -> AnyPublisher<VacationSpotsResponse, MobileTestAPIError> {
        fetchAPI(with: makeVacationSpotsComponents())
    }
    
    private func fetchAPI<T>(
        with components: URLComponents?
    ) -> AnyPublisher<T, MobileTestAPIError> where T: Decodable {
        guard let url = components?.url else {
             let error = MobileTestAPIError.network(description: "Couldn't create URL")
             return Fail(error: error).eraseToAnyPublisher()
           }
        let semaphore = DispatchSemaphore(value: 0)
        var decoded: AnyPublisher<T, MobileTestAPIError>?
        var errorMessage: String = ""
        
        dataTask = session.dataTask(with: url) { [weak self] data, response, error in
            defer { self?.dataTask = nil }
            if let error = error {
                errorMessage = error.localizedDescription
            } else if let data = data, let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                decoded = decode(data)
                semaphore.signal()
            }
        }
        dataTask?.resume()
        semaphore.wait()

        return decoded ?? Fail(error: MobileTestAPIError.parsing(description: "Couldn't parse response \(errorMessage)")).eraseToAnyPublisher()
    }
    
    /// Uncomment and use when url returns Content-Type: application/json insead of text/plain
    /// dataTaskPublisher ignored URLRequest setValue  forHTTPHeaderField
    /*
    private func fetchAPI<T>(
      with components: URLComponents
    ) -> AnyPublisher<T, MobileTestAPIError> where T: Decodable {
      guard let url = components.url else {
        let error = WeatherError.network(description: "Couldn't create URL")
        return Fail(error: error).eraseToAnyPublisher()
      }

      return session.dataTaskPublisher(for: URLRequest(url: url))
        .mapError { error in
          .network(description: error.localizedDescription)
        }
        .flatMap(maxPublishers: .max(1)) { pair in
          decode(pair.data)
        }
        .eraseToAnyPublisher()
    }*/
}
