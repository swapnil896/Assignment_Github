//
//  SearchBarView.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 09/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

protocol SearchBarViewDelegate: class {
    
    func didCancelButtonTapped()
    func didKeyboardSearchTapped(_ searchBar: TopSearchBar)
    func didSearchBarDidBeginEditing(_ searchBar: TopSearchBar)
    func searchBarView(_ searchBar: TopSearchBar, textDidChange text: String)
    
}

class SearchBarView: UIView {
    
    //MARK:- IBOutlets
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var searchBar: TopSearchBar!
    
    // MARK: - Public Properties
    
    weak var delegate: SearchBarViewDelegate?
    var isShowCancel: Bool = true {
        didSet {
            cancelButton.isHidden = !isShowCancel
        }
    }
    var placeholder: String? {
        didSet {
            setupPlaceholder()
        }
    }

    // MARK: - Nib Loading
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    
}

//MARK:- Public

extension SearchBarView {
    
    func addDidChangeSelector() {
        searchBar.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    func removeDidChangeSelector() {
        searchBar.removeTarget(self, action: nil, for: UIControl.Event.editingChanged)
    }
    
}

//MARK:- Private

private extension SearchBarView {
    
    func configure() {
        containerView = loadNib()
        addSubview(containerView)
        
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        stackView.clearBackground()
        applyStyle()
        setupPlaceholder()
    }
    
    func applyStyle() {
        self.backgroundColor = .navigationBar
        cancelButton.setTitle(.cancel, for: .normal)
        cancelButton.titleLabel?.font = UIFont.system(AppConstants.FontSize.seventeen)
        cancelButton.setTitleColor(UIColor.black, for: .normal)
        searchBar.backgroundColor = .lightGray
    }
    
    func setupPlaceholder() {
        if let placeholder = placeholder {
            searchBar.placeholder = placeholder
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print(textField.text!)
        delegate?.searchBarView(searchBar, textDidChange: textField.text!)
    }
    
}

//MARK:- IBActions

extension SearchBarView {
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        delegate?.didCancelButtonTapped()
    }
    
}

// MARK: - UITextFieldDelegate

extension SearchBarView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.didSearchBarDidBeginEditing(searchBar)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !(textField.text?.isEmpty)! {
            delegate?.didKeyboardSearchTapped(searchBar)
        }
        return true
    }
    
}
