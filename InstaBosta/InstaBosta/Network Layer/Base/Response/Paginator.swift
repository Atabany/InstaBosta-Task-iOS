//  Paginator.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.



import Foundation

struct Paginator<Value: Codable>: Codable {
    private(set) var offset: Int
    private(set) var limit: Int
    private(set) var total: Int
    private(set) var count: Int
    private(set) var results: [Value]

    init(
        offset: Int = 0,
        limit: Int = 0,
        total: Int = 0,
        count: Int = 0,
        results: [Value]
    ) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }

    var hasMorePages: Bool {
        offset + count < total
    }

    var nextOffset: Int {
        hasMorePages ? offset + limit : offset
    }
}
