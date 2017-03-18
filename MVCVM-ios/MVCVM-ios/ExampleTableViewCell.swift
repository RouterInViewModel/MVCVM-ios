//
//  ExampleTableViewCell.swift
//  MVCVM-ios
//
//  Created by RouterInViewModel on 18/03/2017.
//  Copyright © 2017 routerInViewModel. All rights reserved.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var exampleImageView: UIImageView!

	func fill(dataRepresentation: ExampleDataRepresentation) {
		self.titleLabel.text = dataRepresentation.title
		self.exampleImageView.image = dataRepresentation.image
	}

}
