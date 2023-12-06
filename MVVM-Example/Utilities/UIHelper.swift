//
//  UIHelper.swift
//  MVVM-Example
//
//  Created by safa uslu on 30.11.2023.
//

import UIKit

enum UIHelper{
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        let itemWidth = CGFloat.dwidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        layout.minimumLineSpacing = 40
        return layout
    }
}
