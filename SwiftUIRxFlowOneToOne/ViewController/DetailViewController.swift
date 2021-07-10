//
//  DetailViewController.swift
//  SwiftUIRxFlowOneToOne
//
//  Created by cow on 2021/07/08.
//

import UIKit
import SwiftUI
import RxFlow
import RxCocoa

class DetailViewController: RxFlowViewController  {

    var restaurant: Restaurant!
    
    init(restaurant: Restaurant) {
        super.init(nibName: nil, bundle: nil)
        self.restaurant = restaurant
        self.contentViewController = UIHostingController(rootView: RestaurantDetailView(restaurant: restaurant))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//class DetailViewController: UIViewController, RxFlow.Stepper  {
//    let steps = PublishRelay<Step>()
//    var restaurant: Restaurant!
//    lazy var contentView = UIHostingController(rootView: RestaurantDetailView(restaurant: restaurant))
//    
//    private var didSetupConstraints = false
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        addChild(contentView)
//        view.addSubview(contentView.view)
//        contentView.view.translatesAutoresizingMaskIntoConstraints = false
//        view.setNeedsUpdateConstraints()
//    }
//    
//    override func updateViewConstraints() {
//        if (!didSetupConstraints) {
//            contentView.view.snp.makeConstraints { make in
//                make.top.bottom.left.right.equalToSuperview()
//            }
//            didSetupConstraints = true
//        }
//        super.updateViewConstraints()
//    }
//}
