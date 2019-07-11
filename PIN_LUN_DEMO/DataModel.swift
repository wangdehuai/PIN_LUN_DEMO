//
//  DataModel.swift
//  SWIFTUI
//
//  Created by wangdehuai on 2019/7/9.
//  Copyright © 2019 wangdehuai. All rights reserved.
//

import HandyJSON

class ReList: HandyJSON {
    var counts = String()
    var addtime = String()
    var content = String()
    var userId = String()
    var majorOid = String()
    var replyName = String()
    var userName = String()
    var userImg = String()
    var replyOid = String()
    var oid = String()
    
    required init() {}
}

class ComList: HandyJSON {
    var counts = String()
    var content = String()
    var userId = String()
    var reList = [ReList]()
    var userName = String()
    var userImg = String()
    var addTime = String()
    
    required init() {}
}

class DataModel: HandyJSON {
    var oid = String()
    var docTitle = String()
    var docVilew = String()
    var docTime = String()
    var good = String()
    var comList = [ComList]()
    
    required init() {}
}

