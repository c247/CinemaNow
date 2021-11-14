//
//  File.swift
//  
//
//  Created by vijay on 2021-11-12.
//

import Foundation
import Fluent
import Vapor
import FluentPostgresDriver

struct CreateMovieActor: Migration {
    
    // up migration
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movie_actors") // table name
            .id()
            .field("movie_id", .uuid, .required, .references("movies", "id"))
            .field("actor_id", .uuid, .required, .references("actors", "id"))
            .create()
    }

    // undo of the migration
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movie_actors").delete() // drop the table
    }
}
