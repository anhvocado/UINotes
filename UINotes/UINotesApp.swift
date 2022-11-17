//
//  UINotesApp.swift
//  UINotes
//
//  Created by Nguyễn Thị Vân Anh on 14/11/2022.
//

//import SwiftUI
//
//@main
//struct UINotesApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

//
//  UINotesApp.swift
//  UINotes
//
//  Created by Nguyễn Thị Vân Anh on 14/11/2022.
//

extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}

import SwiftUI

@main
//chỉ định struct/class nào là điểm bắt đàu khi khởi chạy chương trình
//thêm 2 lần main thì báo lỗi, không thêm cũng lỗi


struct UINotesApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @State var name: String = "
    //tạo scene, thêm .onChange(of:) để lắng nghe giá trị các biến từ môi trường

    init() {
        //tương tự didFinishLaunchWithOptions trong AppDelegate
    }

    var body: some Scene {
        WindowGroup {
            ContentView(name: name)
                .onOpenURL(perform: { url in
                    name = url.valueOf("name") ?? ""
                    print(url.absoluteURL)
                    print(name)
                })
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                print("App State : Background")
            case .inactive:
                print("App State : Inactive")
            case .active:
                print("App State : Active")
            @unknown default:
                print("App State : Unknown")
            }

        }
    }
}

//implement protocol app nên phải có 1 method SceneBuilder (dùng để hiển thị cho người dùng thấy)
//trong đó khai báo một WindowGroup cần 1 ContentView

//Thêm một biến môi trường cho Scene để lắng nghe sự thay đổi trạng thái của môi trường, ScenePhase đùng dể theo dõi trạng thái
