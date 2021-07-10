//
//  AppStep.swift
//  SwiftUIRxFlowOneToOne
//
//  Created by cow on 2021/07/08.
//

import RxFlow

enum AppStep: Step {
    case listVC
    case detailVC(Restaurant)
    case popVC
}
