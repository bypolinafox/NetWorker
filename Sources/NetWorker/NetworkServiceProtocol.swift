//
//  NetworkServiceProtocol.swift
//  NetWorker
//
//  Created by Полина Скалкина on 18.03.2023.
//

import Foundation

protocol NetworkServiceProtocol {
  associatedtype Model: Decodable

  var host: String { get }

  func perform(
    type: RequestType,
    path: String,
    params: [String: String],
    completion: @escaping (Result<Model, NetworkFetchingError>) -> ()
  )
}
