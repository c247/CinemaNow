//
//  File.swift
//  
//
//  Created by vijay on 2021-11-12.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver
import CryptoKit

final class Actor: Model, Content {
    static let schema = "actors" // table name, should be plural; represents more than 1 review
    
    @ID(key: .id)
    var id: UUID? // primary key

    @Field(key: "name")
    var name: String
    
    @Siblings(through: MovieActor.self, from: \.$actor, to: \.$movie)
    var movies: [Movie]

    init() { }

    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
