//
//  ViewController.swift
//  SwiftUIRxFlowOneToOne
//
//  Created by cow on 2021/07/08.
//

import UIKit
import SwiftUI
import RxFlow
import RxCocoa
import RxSwift

class ListViewController: RxFlowViewController  {
    init() {
        super.init(nibName: nil, bundle: nil)
        contentViewController = UIHostingController(rootView: RestaurantListView(steps: self.steps))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
