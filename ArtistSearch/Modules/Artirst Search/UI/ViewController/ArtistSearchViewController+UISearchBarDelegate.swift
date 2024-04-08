import UIKit

extension ArtistSearchViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchData = []
        searchCollectionView.isHidden = true
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        showInformationView(true, type: .defaultInformation)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {
            searchData = []
            searchCollectionView.isHidden = true
            showInformationView(true, type: .defaultInformation)
            return
        }
        searchBar.resignFirstResponder()
        searchCollectionView.isHidden = false
        presenter?.searchTerm(type: selectedFilterType, and: searchBarText)
        showInformationView(false, type: .defaultInformation)
    }
}
