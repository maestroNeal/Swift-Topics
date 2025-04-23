//MARK: Combine
///get_memes
import Foundation
import Combine

enum Endpoint: String {
    case getMemes
    case captionImage
    var rawValue: String {
        switch self {
        case .getMemes:
            return "get_memes"
        case .captionImage:
            return "caption_image"
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}
final class NetworkService {
    
    static let share = NetworkService()
    private var cancellables = Set<AnyCancellable>()
    private let baseUrlString = "https://api.imgflip.com/"
    
    private init(){}
    
    func fetchMemes<T: Decodable>(endPoints: Endpoint, id: Int? = nil, type: T.Type) -> Future<[T], Error> {
        return Future<[T], Error> { promise in
            var urlString = self.baseUrlString + endPoints.rawValue
            if let id = id {
                urlString += "/\(id)"
            }
            
            guard let url = URL(string: urlString) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { data, response -> Data in
                    guard let httpResponse = response as? HTTPURLResponse,
                          200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: [T].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { decodedData in
                    promise(.success(decodedData))
                })
                .store(in: &self.cancellables)
        }
    }
    
}

class ViewModel {
    
}
