//
//  ViewModel.swift
//  MVCVM-ios
//
//  Created by RouterInViewModel on 18/03/2017.
//  Copyright © 2017 routerInViewModel. All rights reserved.
//

import Foundation

class ViewModel {

	fileprivate var exampleDatas = [ExampleData]()

	private let exampleDataFetcher = ExampleDataFetcher()

	var selectedIndexPath: IndexPath?
	var selectedDataRepresentation: ExampleDataRepresentation? {
		var result: ExampleDataRepresentation?

		if let selectedIndexPath = self.selectedIndexPath {
			result = self.dataRepresentation(indexPath: selectedIndexPath)
		}

		return result
	}

	func fetchData(completion: @escaping (() -> Void)) -> Void {

		self.exampleDataFetcher.fetchData {
			[weak self] datas in

			self?.exampleDatas = datas
			completion()
		}
	}

}

// TableView data can be changed to Protocol
extension ViewModel {

	func numberOfSections() -> Int {
		return 1
	}

	func numberOfRows(section: Int) -> Int {
		return self.exampleDatas.count
	}

	func dataRepresentation(indexPath: IndexPath) -> ExampleDataRepresentation {
		let data = self.exampleDatas[indexPath.row]
		let dataRepresentation = ExampleDataRepresentation(exampleData: data)
		return dataRepresentation
	}

}
