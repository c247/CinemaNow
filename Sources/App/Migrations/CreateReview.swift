//
//  File.swift
//  
//
//  Created by vijay on 2021-11-12.
//

import Foundation
import Fluent
import FluentPostgresDriver


struct CreateReview: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
       database.schema("reviews")
            .id()
            .field("title", .string, .required)
            .field("body", .string, .required)
            .field("movie_id", .uuid, .references("movies", "id")) // movie_id linked to movies table using column id
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("reviews").delete() // drop the table
    }
}

