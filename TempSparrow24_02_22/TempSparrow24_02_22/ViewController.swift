//
//  ViewController.swift
//  TempSparrow24_02_22
//
//  Created by Egor Ledkov on 22.02.2024.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - UI Elements
	
	private lazy var scrollView: UIScrollView = makeScroll()
	
	// MARK: - Life cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
		setupLayout()
	}
	
	private func setupUI() {
		view.backgroundColor = .systemBackground
		
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Avatar"
		
		view.addSubview(scrollView)
	}
}

// MARK: - Constructors

private extension ViewController {
	
	func makeScroll() -> UIScrollView {
		let scroll = UIScrollView()
		
		scroll.translatesAutoresizingMaskIntoConstraints = false
		scroll.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
		
		return scroll
	}
	
	func makeImage(named: String) -> UIImageView {
		let uiImage = UIImage(named: named)
		let image = UIImageView(image: uiImage)
		
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFill
		
		return image
	}
}

// MARK: - Layout

private extension ViewController {
	
	private func setupLayout() {
		NSLayoutConstraint.activate(
			[
				scrollView.topAnchor.constraint(equalTo: view.topAnchor),
				scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
				scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
				scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			]
		)
	}
}
