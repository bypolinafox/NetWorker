//
//  NetworkFetchingError.swift
//  NetWorker
//
//  Created by Полина Скалкина on 18.03.2023.
//

public enum NetworkFetchingError: Error {
    case unableToMakeRequest
    case noResponseData
    case parsingError
    case serverError(error: Error)
}
