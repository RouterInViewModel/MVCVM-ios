//
//  ExampleDataRepresentation.swift
//  MVCVM-ios
//
//  Created by RouterInViewModel on 18/03/2017.
//  Copyright © 2017 routerInViewModel. All rights reserved.
//

import UIKit

struct ExampleDataRepresentation {

	let title: String
	let image: UIImage?

	init(exampleData: ExampleData) {

		self.title = "\(exampleData.identifier)"
		self.image = UIImage(named: exampleData.imageName)

	}

}
