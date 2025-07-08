//
//  GIFView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 05.07.2025.
//

import WebKit
import SwiftUI

struct GIFView: UIViewRepresentable {
    private let gifName: String

    init(_ gifName: String) {
        self.gifName = gifName
    }

    func makeUIView(context: Context) -> some WKWebView {
        let webView = WKWebView()
        //bundle is similar to folders
        //Bundle.main.url gives access to the resources inside the of the file of the application
        let url = Bundle.main.url(forResource: gifName, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(
            data, //provide data object
            mimeType: "image/gif", //mimetype is a label to identify a type of data
            characterEncodingName: "UTF-8",
            //deletingLastPath -> delete the last part
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false

        return webView
    }
    //send data from SwiftUI to UIView
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.reload()
    }
}

struct GIFView_Previews: PreviewProvider {
    static var previews: some View {
        GIFView("micVideo")
    }
}

