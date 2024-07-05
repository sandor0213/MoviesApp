//
//  MoviesViewController.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 04/07/2024.
//

import UIKit
import Kingfisher

final class MoviesViewController: BaseViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    private let viewModel = MoviesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround(cancelsTouchesInView: false)
        setupUI()
        viewModel.delegate = self
        viewModel.fetchPopularMovies()
        
        // Change the localization language ("uk" or "en")
        UserDefaults.standard.setValue("uk", forKey: Constants.Main.languageKey)
    }
    
    @IBAction func rightBarButtonAction(_ sender: Any) {
        showSortOptions()
    }
}

private extension MoviesViewController {
    @objc private func showSortOptions() {
        let actionSheet = UIAlertController(title: "Sort Options".localized(), message: "Choose a sort option".localized(), preferredStyle: .actionSheet)
        
        let sortByTitleAction = UIAlertAction(title: SortOption.title.rawValue, style: .default) { _ in
            self.viewModel.sortMovies(by: .title)
        }
        sortByTitleAction.setValue(self.viewModel.selectedSortOption == .title, forKey: "checked")

        let sortByRatingAction = UIAlertAction(title: SortOption.rating.rawValue, style: .default) { _ in
            self.viewModel.sortMovies(by: .rating)
        }
        sortByRatingAction.setValue(self.viewModel.selectedSortOption == .rating, forKey: "checked")
        
        let cancelAction = UIAlertAction(title: "Cancel".localized(), style: .cancel, handler: nil)
        
        actionSheet.addAction(sortByTitleAction)
        actionSheet.addAction(sortByRatingAction)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
     func setupUI() {
        mainTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    }
    
     func updateUI() {
        guard let _ = viewModel.filteredMovies else { return }
        if viewModel.filteredMovies?.results?.isEmpty ?? true {
            mainTableView.isHidden = true
        } else {
            mainTableView.isHidden = false
            mainTableView.reloadData()
        }
    }
}

extension MoviesViewController: MoviesViewModelDelegate {
    func didFetchMovies() {
        updateUI()
    }

    func didFailWithError(_ error: Error) {
        
    }
    
    func didUpdateFilteredMovies() {
        updateUI()
    }
}

extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterMovies(with: searchText)
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredMovies?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as! MovieTableViewCell
        cell.setup(model: viewModel.filteredMovies?.results?[indexPath.row])
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
