
import Fluent
import Vapor

struct MoviesController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let movies = routes.grouped("movies")
        movies.get(use: index)
        movies.post(use: create)
        movies.group(":movieId") { movie in
            movie.delete(use: delete)
        }
    }
    
    func create(_ req: Request) throws -> EventLoopFuture<Movie> {
        let movie = try req.content.decode(Movie.self)
        return movie.create(on: req.db).map { movie }
    }
    

    func index(req: Request) throws -> EventLoopFuture<[Movie]> {
        return Movie.query(on: req.db).all()
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Movie.find(req.parameters.get("movieId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
