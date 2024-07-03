//
//  StorageManager.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 02/07/2024.
//

import CoreData

final class StorageManager {
    
    static let shared = StorageManager()
    
    private init() {}
    
    func createData<T: Encodable, Z: NSManagedObject>(entity: Z.Type? = nil, model: T, forEntityName: String, in context: NSManagedObjectContext) -> [Z] {
        guard let entity = NSEntityDescription.entity(forEntityName: forEntityName, in: context) else { return [] }
        
        if var dictionary = model.dictionary {
            
            let entityObject = NSManagedObject(entity: entity, insertInto: context)
            entityObject.setValuesForKeys(dictionary)
            
            do {
                try context.save()
            } catch let error {
                print("\(#function) error = \(error)")
            }
            
            if let entityObjects = [entityObject] as? [Z] {
                return entityObjects
            }
        }
        return []
    }
    
    func fetchData<T: NSManagedObject>(entity: T.Type, in context: NSManagedObjectContext) -> [T] {
        let fetchRequest = T.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            if let entities = result as? [T] {
                return entities
            }
        } catch {
            return []
        }
        return []
    }
    
    func saveMoviesModel(moviesModel: MoviesModel, context: NSManagedObjectContext) {
        let moviesModelEntity = MoviesModelEntity(context: context)
        moviesModelEntity.page = Int64(moviesModel.page ?? 0)
        moviesModelEntity.totalPages = Int64(moviesModel.totalPages ?? 0)
        moviesModelEntity.totalResults = Int64(moviesModel.totalResults ?? 0)
        
        if let movieModels = moviesModel.results {
            for movieModel in movieModels {
                let movieModelEntity = MovieModelEntity(context: context)
                movieModelEntity.adult = movieModel.adult ?? false
                movieModelEntity.backdropPath = movieModel.backdropPath
                movieModelEntity.genreIDS = movieModel.genreIDS?.map { String($0) }.joined(separator: ",")
                movieModelEntity.id = Int64(movieModel.id ?? 0)
                movieModelEntity.originalLanguage = movieModel.originalLanguage
                movieModelEntity.originalTitle = movieModel.originalTitle
                movieModelEntity.overview = movieModel.overview
                movieModelEntity.popularity = movieModel.popularity ?? 0
                movieModelEntity.posterPath = movieModel.posterPath
                movieModelEntity.releaseDate = movieModel.releaseDate
                movieModelEntity.title = movieModel.title
                movieModelEntity.video = movieModel.video ?? false
                movieModelEntity.voteAverage = movieModel.voteAverage ?? 0
                movieModelEntity.voteCount = Int64(movieModel.voteCount ?? 0)
                
                moviesModelEntity.addToResults(movieModelEntity)
            }
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to save MoviesModel: \(error)")
        }
    }
    
    func fetchMoviesModel(context: NSManagedObjectContext) -> [MoviesModel] {
        let fetchRequest: NSFetchRequest<MoviesModelEntity> = MoviesModelEntity.fetchRequest()
        
        do {
            let moviesModelEntities = try context.fetch(fetchRequest)
            var moviesModels: [MoviesModel] = []
            
            for moviesModelEntity in moviesModelEntities {
                var movieModels: [MovieModel] = []
                
                if let results = moviesModelEntity.results?.array as? [MovieModelEntity] {
                    for movieModelEntity in results {
                        let genreIDS = movieModelEntity.genreIDS?.components(separatedBy: ",").compactMap { Int($0) }
                        let movieModel = MovieModel(
                            adult: movieModelEntity.adult,
                            backdropPath: movieModelEntity.backdropPath,
                            genreIDS: genreIDS,
                            id: Int(movieModelEntity.id),
                            originalLanguage: movieModelEntity.originalLanguage,
                            originalTitle: movieModelEntity.originalTitle,
                            overview: movieModelEntity.overview,
                            popularity: movieModelEntity.popularity,
                            posterPath: movieModelEntity.posterPath,
                            releaseDate: movieModelEntity.releaseDate,
                            title: movieModelEntity.title,
                            video: movieModelEntity.video,
                            voteAverage: movieModelEntity.voteAverage,
                            voteCount: Int(movieModelEntity.voteCount)
                        )
                        movieModels.append(movieModel)
                    }
                }
                
                let moviesModel = MoviesModel(
                    page: Int(moviesModelEntity.page),
                    results: movieModels,
                    totalPages: Int(moviesModelEntity.totalPages),
                    totalResults: Int(moviesModelEntity.totalResults)
                )
                
                moviesModels.append(moviesModel)
            }
            
            return moviesModels
        } catch {
            print("Failed to fetch MoviesModel: \(error)")
            return []
        }
    }
}
