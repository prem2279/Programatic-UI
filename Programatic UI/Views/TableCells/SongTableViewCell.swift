//
//  SongTableViewCell.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/8/26.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    private let songImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "music.pages.fill")
        return image
    }()
    
    private let songName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    private let singerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private let albumName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private let duration: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    private let cellStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fill
        view.spacing = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let songStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.distribution = .equalSpacing
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        loadCellUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SongTableViewCell{
    func configure(with song: Song?){
        guard let song else {return}
        songName.text = song.name
        albumName.text = song.album
        duration.text = song.duration
        singerName.text = song.singer
    }
}

extension SongTableViewCell{
    private func loadCellUI(){
        
        contentView.backgroundColor = .black
        contentView.addSubview(cellStackView)
        
        cellStackView.addArrangedSubview(songImage)
        cellStackView.addArrangedSubview(songStackView)
        cellStackView.addArrangedSubview(duration)
        
        songStackView.addArrangedSubview(songName)
        songStackView.addArrangedSubview(singerName)
        songStackView.addArrangedSubview(albumName)
    }
    
    private func setUpConstraints(){
        pinAllCorners(child: cellStackView, parent: contentView, top: 20, leading: 20, trailing: -20)
        setWidthHeightConstraints(element: songImage, width: 75, height: 75)
        setWidthHeightConstraints(element: duration, width: 100)
        
    }
}
