import Foundation
import Alamofire
import UIKit
import Kingfisher

class NetworkManager {
    private let keySDK = "9a49740c5034d7ee252d1e1419a10faa"
    private let url = "https://v3.football.api-sports.io"
    static let shared = NetworkManager()
    
    private func createURL(endpoint: Endpoint) -> URL {
        let url = URL(string: url)
        var urlComponents = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        urlComponents?.path = endpoint.path
        urlComponents?.queryItems = endpoint.query
        return urlComponents!.url!
    }
    
    func fetchData(endpoint: EndpointParameters,completion: @escaping (Bool) -> Void ) {
        let header: HTTPHeaders = ["x-rapidapi-key": keySDK]
        let url = createURL(endpoint: endpoint)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        print(url)
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: LiveData.self, decoder: decoder) { (response) in
            print(response.error)
            guard let live = response.value else { return }
            LiveDataBuffer.upcomingData = live
            completion(true)
        }
    }
    
    func fetchStatTeamData(endpoint: EndpointParameters,completion: @escaping (Bool) -> Void ) {
        let header: HTTPHeaders = ["x-rapidapi-key": keySDK]
        let url = createURL(endpoint: endpoint)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: LiveDataTeamStat.self, decoder: decoder) { (response) in
            print(response.error)
            guard let live = response.value else { return }
            LiveDataBuffer.upcomingDataTeamStat = live
            completion(true)
        }
    }
    
    func getImage(urlString: String, completion: @escaping (Result<UIImage,Error>) -> Void) {
        guard let url = URL.init(string: urlString) else { return }
        let resource = ImageResource(downloadURL: url)
        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                completion(.success(value.image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


protocol Endpoint {
    var path: String { get }
    var query: [URLQueryItem] { get }
}




