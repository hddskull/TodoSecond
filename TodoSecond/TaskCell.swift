//
//  TaskCell.swift
//  TodoSecond
//
//  Created by Gladkov Maxim on 27.06.2021.
//

import UIKit

class TaskCell: UITableViewCell {
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var done: Bool?
    
    let nameLabel: UILabel = {
        var nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Task name here"
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        return nameLabel
    }()

    let descLabel: UILabel = {
        var descLabel = UILabel()
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.text = "Task description here"
        descLabel.textAlignment = .left
        descLabel.textColor = .black
        descLabel.numberOfLines = 2
        return descLabel
    }()
    
    let deadlineLabel: UILabel = {
        var deadlineLabel = UILabel()
        deadlineLabel.translatesAutoresizingMaskIntoConstraints = false
        deadlineLabel.text = "Tomorrow"
        deadlineLabel.textAlignment = .right
        deadlineLabel.textColor = .black
        return deadlineLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TaskCell {
    func createCellConstraints(){
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(deadlineLabel)
        contentView.addSubview(descLabel)
        
        var constraints = [NSLayoutConstraint]()
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, deadlineLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)

//        cell height
        constraints.append(contentView.heightAnchor.constraint(equalToConstant: 90))
        
//        stackview
        constraints.append(stackView.topAnchor.constraint(equalTo: contentView.topAnchor))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5))
        constraints.append(stackView.heightAnchor.constraint(equalToConstant: 30))
        
//        description label
        constraints.append(descLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30))
        constraints.append(descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5))
        constraints.append(descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5))
        constraints.append(descLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor))

        
        

        NSLayoutConstraint.activate(constraints)
        
    }

}
