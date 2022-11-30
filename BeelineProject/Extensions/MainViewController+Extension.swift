//
//  MainViewController+Extension.swift
//  BeelineProject
//
//  Created by саргашкаева on 30.11.2022.
//

import UIKit

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfComponents
    }
    
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return viewModel.users?[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let id = viewModel.users?[row].id else {
            return
        }
        viewModel.fetchAlbumsData(with: id ) {
            [weak self] in
            DispatchQueue.main.async {
                self?.albumsCollectionView.reloadData()
            }
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfAlbums
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.identifier, for: indexPath) as! AlbumCollectionViewCell
        guard let model = viewModel.albums?[indexPath.item] else { return UICollectionViewCell() }
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = GalleryViewController(viewModel: GalleryViewModel())
        controller.viewModel.id = viewModel.albums?[indexPath.row].id ?? 0
        navigationController?.pushViewController(controller, animated: true)
    }
}
