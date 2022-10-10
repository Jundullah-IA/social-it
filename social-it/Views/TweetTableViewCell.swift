//
//  TweetTableViewCell.swift
//  social-it
//
//  Created by Jundullah Ilhaq Aulia on 09/10/22.
//

import UIKit

protocol TweetTableViewCellDelegate: AnyObject {
    func tweetTableViewCellDidTapReply()
    func tweetTableViewCellDidTapRetweet()
    func tweetTableViewCellDidTapLike()
    func tweetTableViewCellDidTapShare()
}

class TweetTableViewCell: UITableViewCell {
    static let identifier = "TweetTableViewCell"
    
    weak var delegate: TweetTableViewCellDelegate?
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jundullah"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@jia"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum sit dolor amet Lorem ipsum sit dolor amet Lorem ipsum sit dolor amet Lorem ipsum sit dolor amet Lorem ipsum sit dolor amet Lorem ipsum sit dolor amet "
        label.numberOfLines = 0
        return label
    }()
    
    private let replayButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(replayButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        
        configureConstraints()
        configureButtons()
    }
    
    @objc private func didTapReply() {
        delegate?.tweetTableViewCellDidTapReply()
    }
    
    @objc private func didTapRetweet() {
        delegate?.tweetTableViewCellDidTapRetweet()
    }
    
    @objc private func didTapLike() {
        delegate?.tweetTableViewCellDidTapLike()
    }
    
    @objc private func didTapShare() {
        delegate?.tweetTableViewCellDidTapShare()
    }
    
    func configureButtons() {
        replayButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)

    }
    
    private func configureConstraints() {
        let avatarIMageViewConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(avatarIMageViewConstraints)
        
        let displayNameLabelConstraints = [
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 5),
            displayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7)
        ]
        NSLayoutConstraint.activate(displayNameLabelConstraints)

        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7)
        ]
        NSLayoutConstraint.activate(usernameLabelConstraints)
        
        let contentLabelConstraints = [
            contentLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6),
            contentLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            contentLabel.heightAnchor.constraint(equalToConstant: 70)
        ]
        NSLayoutConstraint.activate(contentLabelConstraints)
        
        let replayButtonConstraints = [
            replayButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor),
            replayButton.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6)
        ]
        NSLayoutConstraint.activate(replayButtonConstraints)
        
        let retweetButtonConstraints = [
            retweetButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor),
            retweetButton.leadingAnchor.constraint(equalTo: replayButton.trailingAnchor, constant: 60)
        ]
        NSLayoutConstraint.activate(retweetButtonConstraints)
        
        let likeButtonConstraints = [
            likeButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor),
            likeButton.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant: 60)
        ]
        NSLayoutConstraint.activate(likeButtonConstraints)
        
        let shareButtonConstraints = [
            shareButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor),
            shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 60)
        ]
        NSLayoutConstraint.activate(shareButtonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
