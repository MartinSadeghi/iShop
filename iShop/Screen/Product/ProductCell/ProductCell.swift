//
//  ProductCell.swift
//  iShop
//
//  Created by Mommo Sadeghi on 06/07/23.
//

import UIKit

class ProductCell: UITableViewCell {

    
        // MARK:  - Variables
    
    /// property observer for the setting up the Product Cell details
    var productItem : Product? {
        didSet {
            configureProductDetailsStackView()
        }
    }
    
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
        contentView.addSubview(productDetailsStackView)
//        contentView.backgroundColor = UIColor(named: "CategoryCellContentColor")
        contentView.backgroundColor = UIColor(named: "ProductCellContentColor")
    }
    
    /// Required Cell NSCoder
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

  
    
    
    //MARK: -   Methods
    
    /// Filling Cell Data
    func productCellDetailsConfiguration() {
        guard let productItem else { return }
        productTitleLable.text = productItem.title

//        print(categoryItem)
//        categoryNameLable.text = categoryItem.first
    }
    
    
    /// Collecting all of Constraints
    private func collectedElementsConstraints() {
        configureProductDetailsStackView()
        productImageConstraint()
//        productTitleLableConstraint()
//        productPriceLableConstraint()
//        productRatingLableConstraint()
    }
    
    
    
    //MARK: -   UI Outlets
    
    /// Creating productImage Cell
    private lazy var productImage : UIImageView = {
        let image                 = UIImageView()
        image.clipsToBounds       = false
        image.contentMode         = .scaleAspectFit
        image.layer.cornerRadius  = 7
        image.image               = UIImage(systemName: "iphone.gen1")
        image.backgroundColor = UIColor(named: "ProductImageBackgroundColor")
        return image
    }()
    
    
    private lazy var productDetailsStackView : UIStackView = {
        let stackView                        = UIStackView()
        stackView.backgroundColor            = UIColor(named: "ProductCellDetailsStackView")
        stackView.layer.cornerRadius = 5
        stackView.clipsToBounds = false
        return stackView
    }()
    
    
    /// Creating productTitleLable Cell
    private lazy var productTitleLable : UILabel = {
        let lable                      = UILabel()
        lable.textColor                = .white
        lable.textAlignment            = .left
        lable.numberOfLines            = 2
        lable.font                     = UIFont(name:"Chalkboard SE", size: 15)
        lable.text = "sdfbvcsacdvfsdvfbgntrevdcsaxbgdwegy654evsc"
        return lable
    }()
    
    
    /// Creating productPriceLable Cell
    private lazy var productPriceLable : UILabel = {
        let lable                      = UILabel()
        lable.textColor                = .white
        lable.textAlignment            = .left
        lable.font                     = UIFont(name:"Chalkboard SE", size: 15)
        lable.text = "23456789876543"
        return lable
    }()
    
    /// Creating productRatingLable Cell
    private lazy var productRatingLable : UILabel = {
        let lable                      = UILabel()
        lable.textColor                = .white
        lable.textAlignment            = .left
        lable.font                     = UIFont(name:"Chalkboard SE", size: 15)
        lable.text = "22222222222"
        return lable
    }()
    
    /// Creating productRatingButton Cell
    private lazy var productRatingButton : UIButton = {
        let button                       = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.titleLabel?.text          = "3.9"
        button.backgroundColor           = .systemYellow
        button.titleLabel?.font          = UIFont(name:"Chalkboard SE", size: 15)
        return button
    }()
    
    
    /// Creating productBuyButton Cell
    private lazy var productBuyButton : UIButton = {
        let button                      = UIButton()
        button.titleLabel?.text = "Buy"
        button.backgroundColor = .systemYellow
        button.titleLabel?.font = UIFont(name:"Chalkboard SE", size: 15)
        return button
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
        productImage.widthAnchor.constraint(greaterThanOrEqualTo: productImage.heightAnchor).isActive = true
    }
    
    /// Set productDetailsStackView Constraint
    private func productDetailsStackViewConstraint() {
        productDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        productDetailsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        productDetailsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        productDetailsStackView.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10).isActive = true
        productDetailsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true

    }
    
    /// Configure productDetailsStackView
    private func configureProductDetailsStackView() {
        contentView.addSubview(productDetailsStackView)
        productDetailsStackView.axis = .vertical
        productDetailsStackView.distribution = .fillEqually
        productDetailsStackView.spacing = 10
        productDetailsStackViewConstraint()
        productDetailsElementsToProductDetailsStackView()
    }
    

    /// Add productDetailsElements to ProductDetailsStackView
    private func productDetailsElementsToProductDetailsStackView() {
        productDetailsStackView.addArrangedSubview(productTitleLable)
        productDetailsStackView.addArrangedSubview(productPriceLable)
        productDetailsStackView.addArrangedSubview(productRatingLable)
        productDetailsStackView.addArrangedSubview(productRatingButton)
        productDetailsStackView.addArrangedSubview(productBuyButton)

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
