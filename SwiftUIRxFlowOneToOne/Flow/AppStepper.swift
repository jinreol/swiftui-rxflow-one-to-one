//
//  AppStepper.swift
//  SwiftUIRxFlowOneToOne
//
//  Created by cow on 2021/07/08.
//

import RxFlow
import RxSwift 
import RxCocoa

class AppStepper: Stepper {
    let steps = PublishRelay<Step>()
    var initialStep: Step {
        return AppStep.listVC
    }
}
