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
        CollectingElementsConstraints()
        
    }
    
    /// Initializing Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(categoryImage)
        contentView.addSubview(categoryNameLable)
        contentView.addSubview(categoryDisclosure)
        contentView.backgroundColor = UIColor(named: "CategoryCellContentColor")
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
  
    
    
    //MARK: -   Methods
    
    /// Filling Cell Data
    func categoryCellDetailsConfiguration() {
        guard let categoryItem else { return }
//        print(categoryItem)
        categoryNameLable.text = categoryItem.first
    }
    
    
    /// Collecting all of Constraints
    private func CollectingElementsConstraints() {
        categoryImageConstraint()
        categoryNameLableConstraint()
        categoryDisclosureImageConstraint()
    }
    
    
    
    //MARK: -   UI Outlets
    
    /// Creating Category Image Cell
    private lazy var categoryImage  : UIImageView = {
        let image                   = UIImageView()
        image.clipsToBounds         = false
        image.contentMode           = .scaleAspectFit
        image.layer.cornerRadius    = (image.frame.size.width ) / 2
        image.image                 = UIImage(systemName: "checkmark.seal")
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
    
    
    /// Creating Category NameLable Cell
    private lazy var categoryDisclosure : UIImageView = {
        let image                        = UIImageView()
        image.clipsToBounds             = false
        image.contentMode               = .scaleAspectFit
        image.layer.cornerRadius        = (image.frame.size.width ) / 2
        image.image                     = UIImage(systemName: "chevron.right")
        return image
    }()
    
    
}


// MARK:  - Constraints setup

extension CategoryCell {
    /// Set CategoryImage Constraint
    private func categoryImageConstraint() {
        
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        categoryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        categoryImage.widthAnchor.constraint(lessThanOrEqualTo: categoryImage.heightAnchor).isActive = true
    }
    
    /// Set CategoryNameLable Constraint
    private func categoryNameLableConstraint() {
        
        categoryNameLable.translatesAutoresizingMaskIntoConstraints = false
        categoryNameLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        categoryNameLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        categoryNameLable.leadingAnchor.constraint(equalTo: categoryImage.trailingAnchor, constant: 10).isActive = true
    }
    
    
    /// Set CategoryDisclosureImage Constraint
    private func categoryDisclosureImageConstraint() {
        
        categoryDisclosure.translatesAutoresizingMaskIntoConstraints = false
        categoryDisclosure.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        categoryDisclosure.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        categoryDisclosure.leadingAnchor.constraint(equalTo: categoryNameLable.trailingAnchor, constant: 5).isActive = true
        categoryDisclosure.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
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
