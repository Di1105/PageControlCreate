//
//  ViewController.swift
//  PageControlCreate
//
//  Created by Dilara Elçioğlu on 22.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //Labellar ve image eksik
    let pageControl = UIPageControl()
    lazy var titleLAbel = UILabel()
    lazy var subTitleLabel = UILabel()
    lazy var imageView = UIImageView()
    let scrollView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pageControl)
        view.addSubview(scrollView)
        
        pageControl.backgroundColor = .purple
        pageControl.numberOfPages = 3
        pageControl.layer.cornerRadius = 20
        
        scrollView.backgroundColor = .systemPink
    }

    override func viewDidLayoutSubviews() {
        setUpUI()
        if scrollView.subviews.count == 2{
            configureScrolView()
        }
    }
    
    func setUpUI(){
        pageControl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(view.snp.leading).offset(10)
            make.trailing.equalTo(view.snp.trailing).offset(-10)
            make.height.equalTo(70)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
        
    }
    
    func configureScrolView(){
        scrollView.contentSize = CGSize(width: view.frame.size.width*5, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        let colors: [UIColor] = [
            .systemCyan,
            .systemBlue,
            .systemPink
        ]
        for x in 0..<3{
            let page = UIView(frame: CGRect(x: CGFloat(x)*view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            scrollView.addSubview(page)
            page.backgroundColor = colors[x]
        }
    }

}

