//
//  SceneDelegate.swift
//  SwiftUIRxFlowOneToOne
//
//  Created by cow on 2021/07/08.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    let disposeBag = DisposeBag()
    var window: UIWindow?
    var coordinator = FlowCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        guard let window = self.window else { return }
        
        // [start] rxflow 페이지 전이시 로그 찍음
        self.coordinator.rx.willNavigate.subscribe(onNext: { (flow, step) in
            print("will navigate to flow=\(flow) and step=\(step)")
        }).disposed(by: self.disposeBag)
        
        self.coordinator.rx.didNavigate.subscribe(onNext: { (flow, step) in
            print("did navigate to flow=\(flow) ")
        }).disposed(by: self.disposeBag)
        // [end] rxflow 페이지 전이시 로그 찍음
        
        let appFlow = AppFlow()
        
        // Flow의 Navigation을 실행한다.
        // flow: coordinate를 원하는 navigation을 묘사한다.
        // stepper: Flow의 전역 navigation을 제어한다.
        self.coordinator.coordinate(flow: appFlow, with: AppStepper())
        
        // 주어진 파라미터로 디동한다. 구동한다.
        // 첫번째 인자: 첫 Flow
        // 두번째 인자: .created 실행하지 않고 Block상태로 둔다.
        //            .ready : 실행한다.
        Flows.use(appFlow, when: .created) { root in
            window.rootViewController = root  // AppFlow에서 생성된 NavigationController를 window.rootViewController에 넣는다
            window.makeKeyAndVisible() // 윈도우 객체를 화면에 표시한다.
        }
        
//        window?.rootViewController = ViewController()
//        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

