//
//  UICollectionView+Ext.swift
//  MVVM-Example
//
//  Created by safa uslu on 6.12.2023.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
