//
//  RxFlowView.swift
//  SwiftUIRxFlowOneToOne
//
//  Created by cow on 2021/07/09.
//
import SwiftUI
import RxFlow
import RxCocoa

struct RxFlowView: ViewModifier {
    var steps = PublishRelay<Step>()

    func body(content: Content) -> some View {
       content
    }
}
