//
//  ViewController.swift
//  SlackCooperation
//
//  Created by TakaoAtsushi on 2018/12/06.
//  Copyright © 2018 TakaoAtsushi. All rights reserved.
//

import UIKit
import SlackKit

class ViewController: UIViewController {
    
    let bot = SlackKit()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Botの登録
        bot.addRTMBotWithAPIToken(Key.slackAPIToken)
        bot.addWebAPIAccessWithToken(Key.slackAPIToken)
        
        //一回だけ投稿するように
        var number = 0
        while number == 0 {
            
            //誰かが投稿すると呼ばれる。
            bot.notificationForEvent(.message) { (event, connection) in
                
                if let user = event.message?.user {
                    //あっちゃんの場合のみ
                    if user == Key.atsushiUserAccount {
                        //条件の指定
                        if event.message!.text?.contains("まいやん") == true || event.message!.text?.contains("麻衣") == true  {
                            //投稿情報の作成
                            let attachment =  Attachment(fallback:  "いつもお疲れ様！私のためにお仕事頑張ってね！！", title: "いつもお疲れ様！私のためにお仕事頑張ってね！！", callbackID: "hello_world", type: nil, colorHex: nil, pretext: nil, authorName: "白石麻衣", authorLink: nil, authorIcon: "https://www.cinemacafe.net/imgs/thumb_h1/356246.jpg", titleLink: nil, text: nil, fields: nil, actions: nil, imageURL: "https://www.cinemacafe.net/imgs/thumb_h1/356246.jpg", thumbURL: "https://www.cinemacafe.net/imgs/thumb_h1/356246.jpg", footer: nil, footerIcon: nil, ts: nil, markdownFields: nil)
                            //メッセージの送信
                            self.bot.webAPI?.sendMessage(channel: event.message!.channel!, text: "", attachments: [attachment], success: nil, failure: nil)
                        }
                    }
                }
            }
            number = number + 1
        }
        
        
    }
    
    
}




