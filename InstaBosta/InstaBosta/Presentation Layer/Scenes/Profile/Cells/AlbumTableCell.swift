//
//  AlbumTableCell.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import UIKit

class AlbumTableCell: UITableViewCell {
    
    var viewModel: AlbumItemViewModel? = nil
    
    let titleLabel: UILabel = UILabel()
    static let rowHeight: CGFloat = 112
    static let reuseID = AlbumTableCell.description()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



extension AlbumTableCell {
    
    private func setup() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel.text = "Album Name"
        titleLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(titleLabel)
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 2),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
        ])
    }
}

extension AlbumTableCell {
    func configure(with vm: AlbumItemViewModel) {
        viewModel = vm
        titleLabel.text = vm.title
    }
}


