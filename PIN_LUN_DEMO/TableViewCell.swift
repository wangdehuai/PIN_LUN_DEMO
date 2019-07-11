//
//  TableViewCell.swift
//  SWIFTUI
//
//  Created by wangdehuai on 2019/7/9.
//  Copyright © 2019 wangdehuai. All rights reserved.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    var headIV = UIImageView.init()
    var userL = UILabel.init()
    var timeL = UILabel.init()
    var rightBtn = UIButton.init()
    var detailL = UILabel.init()
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier:String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        
        let bgV = UIView.init()
        contentView.addSubview(bgV)
        bgV.snp.makeConstraints{ make in
            make.left.equalTo(40)
            make.right.equalTo(0)
            make.top.bottom.equalTo(0)
        }
        
        headIV.layer.cornerRadius = 20
        headIV.backgroundColor = UIColor.groupTableViewBackground
        bgV.addSubview(headIV)
        headIV.snp.makeConstraints{ make in
            make.top.left.equalTo(15)
            make.width.height.equalTo(40)
        }
        
        userL.textColor = UIColor.blue
        userL.font = UIFont.systemFont(ofSize:14)
        bgV.addSubview(userL)
        userL.snp.makeConstraints{ make in
            make.top.equalTo(headIV.snp.top).offset(2)
            make.left.equalTo(headIV.snp.right).offset(5)
        }
        
        timeL.textColor = UIColor.gray
        timeL.font = UIFont.systemFont(ofSize:12)
        bgV.addSubview(timeL)
        timeL.snp.makeConstraints{ make in
            make.left.equalTo(userL.snp.left)
            make.bottom.equalTo(headIV.snp.bottom).offset(-2)
        }
        
        rightBtn.backgroundColor = UIColor.red
        //        rightBtn.setImage(#imageLiteral(resourceName: <#T##String#>), for: .normal)
        bgV.addSubview(rightBtn)
        rightBtn.snp.makeConstraints{ make in
            make.top.equalTo(17)
            make.right.equalTo(-15)
            make.width.height.equalTo(20)
        }
        
        
        detailL.numberOfLines = 0
        bgV.addSubview(detailL)
        detailL.snp.makeConstraints{ make in
            make.top.equalTo(headIV.snp.bottom).offset(10)
            make.bottom.equalTo(-10)
            make.left.equalTo(userL.snp.left)
            make.right.equalTo(-15)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

