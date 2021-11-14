//
//  Review.swift
//  
//
//  Created by vijay on 2021-11-12.
//

import Foundation
import Fluent
import FluentPostgresDriver
import Vapor

final class Review: Model, Content {
    
    static let schema = "reviews"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title:String
    
    @Field(key: "body")
    var body:String
    
    // belongs to
    @Parent(key: "movie_id") // foreign key
    var movie: Movie
    
    
    init() {}
    
    init (id: UUID? = nil, title: String, body: String, movieId: UUID) {
        self.id = id
        self.title = title
        self.body = body
        self.$movie.id = movieId
    }
    
}
