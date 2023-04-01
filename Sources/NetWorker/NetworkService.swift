//
//  NetWorker.swift
//  NetWorker
//
//  Created by Полина Скалкина on 18.03.2023.
//

public class NetworkService<Model: Decodable>: NetworkServiceProtocol {
  let host: String

  private lazy var opQueue = FetchingOperations()
  private lazy var delayCounter = ExponentialBackoffDelayCalculator()
  private lazy var requestCreator = RequestCreator()

  public init(host: String) {
    self.host = host
  }

  func perform(
    type: RequestType,
    path: String,
    params: [String: String],
    completion: @escaping (Result<Model, NetworkFetchingError>) -> ()
  ) {
    let operation = FetchingDataOperation(
      request: requestCreator.createRequest(type: type, host: host, path: path, params: params),
      delayCounter: delayCounter,
      completion: completion
    )
    opQueue.fetchingQueue.addOperation(operation)
  }
}
