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
	private lazy var avatarView: UIImageView = makeImage()
	
	// MARK: - Life cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
		setupLayout()
	}

	// MARK: - Private Methods
	
	private func setupUI() {
		view.backgroundColor = .systemBackground
			
		title = "Avatar"
		
		view.addSubview(scrollView)
		
		// Если хотим прятать аватар под инлайн бар item
		guard let navigationBar = self.navigationController?.navigationBar else { return }
		guard let UINavigationBarLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
		
		navigationBar.subviews.forEach { subview in
			if subview.isKind(of: UINavigationBarLargeTitleView.self) {
				subview.addSubview(avatarView)
				
				NSLayoutConstraint.activate([
					avatarView.bottomAnchor.constraint(equalTo: subview.bottomAnchor,constant: -8),
					avatarView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -8),
					avatarView.widthAnchor.constraint(equalToConstant: 36),
					avatarView.heightAnchor.constraint(equalToConstant: 36),
				])
			}
		}
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
	
	func makeImage() -> UIImageView {
		let uiImage = UIImage(systemName: "person.crop.circle.fill")
		let image = UIImageView(image: uiImage)
		
		image.tintColor = .systemGray3
		image.translatesAutoresizingMaskIntoConstraints = false
		
		return image
	}
}

// MARK: - Layout

private extension ViewController {
	
	private func setupLayout() {
		// Если хотим показывать аватар над инлайн бар item
//		guard let navigationBar = navigationController?.navigationBar else { return }
		
		NSLayoutConstraint.activate(
			[
				scrollView.topAnchor.constraint(equalTo: view.topAnchor),
				scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
				scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
				scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
				
//				avatarView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -8),
//				avatarView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -8),
//				avatarView.widthAnchor.constraint(equalToConstant: 36),
//				avatarView.heightAnchor.constraint(equalToConstant: 36),
			]
		)
	}
}
