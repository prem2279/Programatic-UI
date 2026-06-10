//
//  MovieController.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/5/26.
//
import UIKit

class MovieController: UIViewController{
    
    
    let genreLabel = UIElements.label(text: "genre", textColor: .white, fontSize: 15, fontWeight: .bold)
    let titleLabel = UIElements.label(text: "Title", textColor: .white, fontSize: 25, fontWeight: .bold)
    let ratingLabel = UIElements.label(text: "5.0", textColor: .white, fontSize: 18, fontWeight: .semibold)
    let overviewLabel = UIElements.label(text: "Overview", fontSize: 20, fontWeight: .semibold)
    let detailsLabel = UIElements.label(text: "Details", fontSize: 20, fontWeight: .semibold)
    let descriptionLabel = UIElements.label(text: "Description",textColor: .white, fontSize: 18, fontWeight: .regular)
    let directorLabel = UIElements.label(text: "Description",textColor: .white, fontSize: 18, fontWeight: .regular)
    let yearLabel = UIElements.label(text: "2021",textColor: .white, fontSize: 18, fontWeight: .semibold)
    let duration = UIElements.label(text: "2 hr",textColor: .white, fontSize: 18, fontWeight: .regular)
    var bannerColor: UIColor = .systemGray
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bannerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let genreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rowStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 15
        return view
    }()
    
    let directorStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 5
        return view
    }()
    
    let starIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(systemName: "star.fill")
        imageView.tintColor = .systemOrange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        loadData()
        setUpUI()
    }
}

extension MovieController{
    func setUpUI(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(bannerView)
        contentView.addSubview(genreView)
        genreView.addSubview(genreLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(rowStack)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(detailsLabel)
        contentView.addSubview(directorStack)
        
        rowStack.addArrangedSubview(starIcon)
        rowStack.addArrangedSubview(ratingLabel)
        rowStack.addArrangedSubview(yearLabel)
        
        directorStack.addArrangedSubview(directorLabel)
        directorStack.addArrangedSubview(duration)
        
        genreView.backgroundColor = .red
        genreView.layer.cornerRadius = 10
        genreView.clipsToBounds = true
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .justified
        
        bannerView.backgroundColor = bannerColor
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)

        ])
        
        pinAllCorners(child: contentView , parent: scrollView)
        
        
        pinLeftRightCorners(child: bannerView, parent: contentView)
        pinTopCorner(child: bannerView, parent: contentView)
        setWidthHeightConstraints(element: bannerView, height: 220)
        
        pinLeadingCorner(child: genreView, parent: bannerView, leading: 12)
        pinBottomCorner(child: genreView, parent: bannerView, bottom: -12)
        
        pinAllCorners(child: genreLabel, parent: genreView, top: 4, bottom: -4, leading: 10, trailing: -10)
        
        pinLeftRightCorners(child: titleLabel, parent: contentView, leading: 16, trailing: -16)
        pinTopToBottomCorner(child: titleLabel, parent: bannerView, top: 16)
        
        pinTopToBottomCorner(child: rowStack, parent: titleLabel, top: 8)
        pinLeadingCorner(child: rowStack, parent: contentView, leading: 16)
        
        pinTopToBottomCorner(child: overviewLabel, parent: rowStack, top: 20)
        pinLeadingCorner(child: overviewLabel, parent: contentView, leading: 16)
        
        pinTopToBottomCorner(child: descriptionLabel, parent: overviewLabel, top: 8)
        pinLeftRightCorners(child: descriptionLabel, parent: contentView, leading: 16, trailing: -16)
        
        pinTopToBottomCorner(child: detailsLabel, parent: descriptionLabel, top: 24)
        pinLeadingCorner(child: detailsLabel, parent: contentView, leading: 16)
        
        pinTopToBottomCorner(child: directorStack, parent: detailsLabel, top: 10)
        pinLeftRightCorners(child: directorStack, parent: contentView, leading: 16, trailing: -16)
        pinBottomCorner(child: directorStack, parent: contentView, bottom: -30)
        
    }
        
}

extension MovieController{
    func loadData(){
        let movie = Movie(
            title: "Inception",
            genre: "Sci-Fi",
            rating: 8.8,
            year: 2010,
            overview: "A skilled thief is offered a chance to have his criminal record erased if he can successfully perform inception — planting an idea into someone's subconscious. A skilled thief is offered a chance to have his criminal record erased if he can successfully perform inception — planting an idea into someone's subconscious. A skilled thief is offered a chance to have his criminal record erased if he can successfully perform inception — planting an idea into someone's subconscious. A skilled thief is offered a chance to have his criminal record erased if he can successfully perform inception — planting an idea into someone's subconscious.",
            director: "Christopher Nolan",
            duration: "2h 28min",
            bannerColor: .systemBlue
        )

        genreLabel.text = movie.genre
        titleLabel.text = movie.title
        ratingLabel.text = String(movie.rating)
        descriptionLabel.text = movie.overview
        directorLabel.text = "Director: \(movie.director)"
        yearLabel.text = String(movie.year)
        duration.text = "Duration: \(movie.duration)"
        bannerColor = movie.bannerColor
        
    }
}
