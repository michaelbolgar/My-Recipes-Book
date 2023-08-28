//
//  OnboardingView.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import Foundation
import UIKit
import SnapKit

class OnboardingView: UIView {

    //MARK: - Properties


    //MARK: - UI Elements


    //MARK: - Init

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Palette.redPrimary80
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods


    //MARK: - Extension

}
