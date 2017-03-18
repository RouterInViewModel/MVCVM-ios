//
//  DetailsViewController.swift
//  MVCVM-ios
//
//  Created by RouterInViewModel on 18/03/2017.
//  Copyright © 2017 routerInViewModel. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

	var exampleDataRepresentation: ExampleDataRepresentation?
	@IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.exampleDataRepresentation?.title
		self.imageView.image = self.exampleDataRepresentation?.image
    }

}
