//
//  ViewController.swift
//  MVCVM-ios
//
//  Created by RouterInViewModel on 18/03/2017.
//  Copyright © 2017 routerInViewModel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	fileprivate struct CellReuseIdentifiers {
		static let exampleTableViewCellReuseIdentifier = "com.routerInViewModel.mvcmv-ios.mainViewController.examplecellreuseidentifier"
	}

	fileprivate struct SegueIdentifiers {
		static let toDetailsViewController = "com.routerInViewModel.mvcmv-ios.mainViewController.segueidentifiers.toexampleDetailsViewController"
	}

	@IBOutlet weak var tableView: UITableView!

	fileprivate let viewModel = ViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.viewModel.fetchData {
			[weak self] in

			self?.tableView.reloadData()
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if let indexPath = self.tableView.indexPathForSelectedRow {
			self.tableView.deselectRow(at: indexPath, animated: animated)
		}
	}

}

extension ViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return self.viewModel.numberOfSections()
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.viewModel.numberOfRows(section: section)
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.exampleTableViewCellReuseIdentifier,
		                                               for: indexPath) as? ExampleTableViewCell else {
			fatalError("undefined reuse identifier")
		}

		let dataRepresentation = self.viewModel.dataRepresentation(indexPath: indexPath)
		cell.fill(dataRepresentation: dataRepresentation)

		return cell
	}

}

extension ViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.viewModel.selectedIndexPath = indexPath
		self.performSegue(withIdentifier: SegueIdentifiers.toDetailsViewController, sender: self)
	}

}

// MARK: Navigation
extension ViewController {

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)

		guard segue.identifier == SegueIdentifiers.toDetailsViewController,
		let detailsViewController = segue.destination as? DetailsViewController else {
			fatalError("undefined segue identifier")
		}

		detailsViewController.exampleDataRepresentation = self.viewModel.selectedDataRepresentation
	}

}

