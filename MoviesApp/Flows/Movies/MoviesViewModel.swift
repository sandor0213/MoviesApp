//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 04/07/2024.
//

import Foundation

enum SortOption: String {
    case title = "Sort by Title"
    case rating = "Sort by Rating"
}

protocol MoviesViewModelDelegate: AnyObject {
    func didFetchMovies()
    func didFailWithError(_ error: Error)
    func didUpdateFilteredMovies()
}

final class MoviesViewModel {
    
    weak var delegate: MoviesViewModelDelegate?
    private(set) var movies: MoviesModel?
    private(set) var filteredMovies: MoviesModel?
    private(set) var selectedSortOption: SortOption? = nil

    func fetchPopularMovies() {
        APIRequests.getMoviesPopular { [weak self] result in
            switch result {
            case .success(let moviesModel):
                self?.movies = moviesModel
                self?.filteredMovies = moviesModel
                self?.delegate?.didFetchMovies()
            case .failure(let error):
                self?.delegate?.didFailWithError(error)
            }
        }
    }
    
    func filterMovies(with searchText: String) {
        guard let movies = movies else { return }
        if searchText.isEmpty {
            filteredMovies = movies
        } else {
            let filteredResults = movies.results?.filter { $0.originalTitle?.lowercased().contains(searchText.lowercased()) ?? false }
            filteredMovies = MoviesModel(page: movies.page, results: filteredResults, totalPages: movies.totalPages, totalResults: movies.totalResults)
        }
        delegate?.didUpdateFilteredMovies()
    }
    
    func sortMovies(by option: SortOption) {
        selectedSortOption = option
        switch option {
        case .title:
            filteredMovies?.results?.sort { ($0.originalTitle ?? "") < ($1.originalTitle ?? "") }
        case .rating:
            filteredMovies?.results?.sort { ($0.voteAverage ?? 0) > ($1.voteAverage ?? 0) }
        }
        delegate?.didUpdateFilteredMovies()
    }
}
