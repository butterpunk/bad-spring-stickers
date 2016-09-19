//
//  badSpringBrowserViewController.swift
//  bad-spring
//
//  Created by Blake butterworth on 9/18/16.
//  Copyright © 2016 Blake butterworth. All rights reserved.
//

import Foundation
import UIKit
import Messages

class badSpringBrowserViewController: MSStickerBrowserViewController{
    
    //array to hold stickers
    var stickers = [MSSticker]()
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
    
    
    func changeBrowserViewBackgroundColor(color: UIColor){
        stickerBrowserView.backgroundColor = color
    }
    
    func loadStickers(){
        let stickString = ["beer_can","trump face sticker_censor bar only","censor bar_fuckboi","cut out cig butt"]
        for stickersing in stickString{
            createSticker(asset: stickersing, localizedDescription: "mugSticker")
        }
    }
    
    func createSticker(asset: String, localizedDescription: String){
        guard let stickerPath = Bundle.main.path(forResource: asset, ofType: "png") else{
            print("couldn't creat the sticker path for", asset)
            return
        }
        let stickerURL = URL(fileURLWithPath: stickerPath)
        let sticker: MSSticker
        do {
            try sticker = MSSticker(contentsOfFileURL: stickerURL, localizedDescription: localizedDescription)
            stickers.append(sticker)
        }catch{
            print(error)
            return
        }
    }
    
    
    
}
