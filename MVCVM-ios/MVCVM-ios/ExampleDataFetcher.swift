//
//  ExampleDataFetcher.swift
//  MVCVM-ios
//
//  Created by RouterInViewModel on 18/03/2017.
//  Copyright © 2017 routerInViewModel. All rights reserved.
//

import Foundation

class ExampleDataFetcher {

	func fetchData(completion: (([ExampleData]) -> Void)) {

		var models = [ExampleData]()
		for i in 0...5 {

			let model = ExampleData(identifier: i, imageName: "\(i)")
			models.append(model)
		}

		completion(models)

	}

}
