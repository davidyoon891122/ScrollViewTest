//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by David Yoon on 2021/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        //scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "circle")!)
        scrollView.layer.contents = UIImage(named: "circle")?.cgImage
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .black
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let secondStackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.backgroundColor = .blue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let thirdStackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.backgroundColor = .red
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setLayoutConstrains()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = nil
        
        
    }
    
    
    
    
    private func addSubviews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(firstStackView)
        scrollView.addSubview(secondStackView)
        scrollView.addSubview(thirdStackView)
        scrollView.addSubview(tableView)
        scrollView.addSubview(imageView)
        
        //face commit
        
    }
    
    private func setLayoutConstrains() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        
        firstStackView.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        firstStackView.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
        firstStackView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor).isActive = true
        secondStackView.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        secondStackView.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
        secondStackView.heightAnchor.constraint(equalToConstant: 900).isActive = true
        
        
        thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor).isActive = true
        thirdStackView.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        thirdStackView.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
        thirdStackView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        tableView.topAnchor.constraint(equalTo: thirdStackView.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        imageView.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }

    override func viewWillAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+2000)
        tableView.backgroundColor = .clear
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "test"
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        return cell
    }
    
    
}

