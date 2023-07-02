//
//  CategoryCell.swift
//  iShop
//
//  Created by Mommo Sadeghi on 30/06/23.
//

import UIKit

class CategoryCell: UITableViewCell {

    
    
    
    //MARK: - Application LifeCycle
    
    /// Layout SubViews
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 15
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        categoryImageConstraint()
        categoryNameLableConstraint()
    }
    
    /// Initializing Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(categoryImage)
        contentView.addSubview(categoryNameLable)
//        contentView.backgroundColor = UIColor(named: "CategoryCellContentColor")
    }
    
    /// Required Cell NSCoder
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// property observer for the setting up the cell details
    var categoryItem: CategoryModel? {
        didSet {
            categoryCellDetailsConfiguration()
        }
    }
    
    
    
    //MARK: -   UI Outlets
    
    
    
    /// Creating Category Image Cell
    private lazy var categoryImage  : UIImageView = {
        let image                   = UIImageView()
        image.contentMode           = .scaleAspectFit
        image.clipsToBounds         = false
        image.layer.cornerRadius    = (image.frame.size.width ) / 2
        image.layer.borderWidth     = 3.0
        image.image = UIImage(named: "plus.app")
        return image
    }()
    
    
    
    /// Creating Category NameLable Cell
    private lazy var categoryNameLable : UILabel = {
        let lable                      = UILabel()
        lable.textColor                = .white
        lable.textAlignment            = .left
        lable.font                     = UIFont(name:"Chalkboard SE", size: 15)
        return lable
    }()
    
    
    
    /// Set Category Image Constraint
    private func categoryImageConstraint() {
        
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        categoryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
//        categoryImage.widthAnchor.constraint(greaterThanOrEqualTo: contentView.heightAnchor, multiplier: 0.6).isActive = true
//        categoryImage.heightAnchor.constraint(equalTo: categoryImage.widthAnchor).isActive = true
    }
    
    
   
    
    
    
    /// Set Category NameLable Constraint
    private func categoryNameLableConstraint() {
        
        categoryNameLable.translatesAutoresizingMaskIntoConstraints = false
        categoryNameLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        categoryNameLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        categoryNameLable.leadingAnchor.constraint(equalTo: categoryImage.trailingAnchor, constant: 10).isActive = true
        categoryNameLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    
    
    //MARK: -   Methods
    
    /// Filling Cell Data
    
    func categoryCellDetailsConfiguration() {
        guard let categoryItem else { return }
        categoryNameLable.text = categoryItem.title
//        categoryImage.image = UIImage(named: "plus.app")
//        categoryImage.setImage(with: categoryItem.image)
       
    }
    
    
//    func fillPokemonsData(pokName : String, pokID: String) {
//        pokNameLable.text = "#\(pokID). \(pokName)"
//        pokImage.kf.setImage(with: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokID).png"), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil
//        )
//    }
    
    
    
    
}




//MARK: -   Extension

extension CategoryCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
