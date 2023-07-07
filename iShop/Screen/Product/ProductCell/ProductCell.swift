//
//  ProductCell.swift
//  iShop
//
//  Created by Mommo Sadeghi on 06/07/23.
//

import UIKit

class ProductCell: UITableViewCell {

    
    //MARK: - Application LifeCycle
    
    /// Layout SubViews
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 15
        collectedElementsConstraints()
        
    }
    
    /// Initializing Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(productTitleLable)
        contentView.addSubview(productPriceLable)
        contentView.addSubview(productRatingLable)
        contentView.backgroundColor = UIColor(named: "CategoryCellContentColor")
    }
    
    /// Required Cell NSCoder
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// property observer for the setting up the cell details
    var categoryItem: CategoryModel? {
        didSet {
            productCellDetailsConfiguration()
        }
    }
  
    
    
    //MARK: -   Methods
    
    /// Filling Cell Data
    func productCellDetailsConfiguration() {
//        guard let categoryItem else { return }
//        print(categoryItem)
//        categoryNameLable.text = categoryItem.first
    }
    
    
    /// Collecting all of Constraints
    private func collectedElementsConstraints() {
        productImageConstraint()
        productTitleLableConstraint()
        productPriceLableConstraint()
        productRatingLableConstraint()
    }
    
    
    
    //MARK: -   UI Outlets
    
    /// Creating productImage Cell
    private lazy var productImage  : UIImageView = {
        let image                   = UIImageView()
        image.clipsToBounds         = false
        image.contentMode           = .scaleAspectFit
        image.layer.cornerRadius    = (image.frame.size.width ) / 2
        image.image                 = UIImage(systemName: "iphone.gen1")
        return image
    }()
    
    
    
    /// Creating productTitleLable Cell
    private lazy var productTitleLable : UILabel = {
        let lable                      = UILabel()
        lable.textColor                = .white
        lable.textAlignment            = .left
        lable.font                     = UIFont(name:"Chalkboard SE", size: 15)
        return lable
    }()
    
    
    /// Creating productPriceLable Cell
    private lazy var productPriceLable : UIImageView = {
        let image                        = UIImageView()
        image.clipsToBounds             = false
        image.contentMode               = .scaleAspectFit
        image.layer.cornerRadius        = (image.frame.size.width ) / 2
        image.image                     = UIImage(systemName: "chevron.right")
        return image
    }()
    
    /// Creating productRatingLable Cell
    private lazy var productRatingLable : UIImageView = {
        let image                        = UIImageView()
        image.clipsToBounds             = false
        image.contentMode               = .scaleAspectFit
        image.layer.cornerRadius        = (image.frame.size.width ) / 2
        image.image                     = UIImage(systemName: "chevron.right")
        return image
    }()
    
    
}


// MARK:  - Constraints setup

extension ProductCell {
    
    
    /// Set productImage Constraint
    private func productImageConstraint() {
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        productImage.widthAnchor.constraint(lessThanOrEqualTo: productImage.heightAnchor).isActive = true
    }
    
    /// Set productTitleLable Constraint
    private func productTitleLableConstraint() {
        
        productTitleLable.translatesAutoresizingMaskIntoConstraints = false
        productTitleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        productTitleLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        productTitleLable.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10).isActive = true
    }
    
    
    /// Set productPriceLable Constraint
    private func productPriceLableConstraint() {
        
        productPriceLable.translatesAutoresizingMaskIntoConstraints = false
        productPriceLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        productPriceLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        productPriceLable.leadingAnchor.constraint(equalTo: productTitleLable.trailingAnchor, constant: 5).isActive = true
        productPriceLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    
    /// Set CategoryDisclosureImage Constraint
    private func productRatingLableConstraint() {
        
        productRatingLable.translatesAutoresizingMaskIntoConstraints = false
        productRatingLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        productRatingLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        productRatingLable.leadingAnchor.constraint(equalTo: productPriceLable.trailingAnchor, constant: 5).isActive = true
        productRatingLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
}





//MARK: -   Extension

extension ProductCell {
    
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
