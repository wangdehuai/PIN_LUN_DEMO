//
//  LeftTableViewController.swift
//  SWIFTUI
//
//  Created by wangdehuai on 2019/7/8.
//  Copyright © 2019 wangdehuai. All rights reserved.
//

import UIKit

let CELLID = "cellId"
class LeftTableViewController: UITableViewController {
    
    var toolV = UIView.init()
    //wenzhang
    let titleL = UILabel.init()
    let subtitleV = UIView.init()
    let danweiL = UILabel.init()
    let timeL = UILabel.init()
    let seenumL = UILabel.init()
    let yanjingI = UIImageView.init()
    let line = UIView.init()
    let neirongL = UILabel.init()
    
    var model = DataModel.init()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.toolbar.addSubview(self.toolV)
        navigationController?.setToolbarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.toolV.removeFromSuperview()
        navigationController?.setToolbarHidden(true, animated: true)
    }
    
    func addToolV(){
        self.toolV.frame = navigationController!.toolbar.bounds
        
        let subTF = UITextField.init()
        subTF.backgroundColor = UIColor.red
        self.toolV.addSubview(subTF)
        subTF.snp.makeConstraints { make in
            make.left.top.equalTo(5)
            make.bottom.equalTo(-5)
        }
        
        let pinlunBtn = UIButton.init()
        pinlunBtn.backgroundColor = UIColor.gray
        self.toolV.addSubview(pinlunBtn)
        pinlunBtn.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
            make.width.equalTo(80)
            make.left.equalTo(subTF.snp.right).offset(5)
        }
        
        let zanBtn = UIButton.init()
        zanBtn.backgroundColor = UIColor.blue
        self.toolV.addSubview(zanBtn)
        zanBtn.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.bottom.right.equalTo(-5)
            make.left.equalTo(pinlunBtn.snp.right).offset(5)
            make.width.equalTo(zanBtn.snp.height)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: tableView.bounds, style: .grouped)
        tableView.register(TableViewCell.classForCoder(), forCellReuseIdentifier: CELLID)
        tableView.tableHeaderView = addHeaderV()
        tableView.tableFooterView = UIView.init();
        tableView.separatorStyle = .none
        let data = readLocalData(fileNameStr: "1", type: "json") as! Dictionary<String, Any>
        model = DataModel.deserialize(from: data)!
        addToolV()
        
        titleL.text = "“一鞭晓色渡滹沱，芳草茸茸漫碧波。”静静流淌的滹沱河水，无言地诉说着千年沧桑。"
        danweiL.text = "迎泽区政府"
        timeL.text = "4小时前"
        seenumL.text = "浏览 50"
        
        neirongL.text = "上世纪80年代，一位青年来到滹沱河畔的正定县，他骑着一辆“二八”式自行车，跑遍了正定每个村落。不论风霜雪雨，不论酷暑严寒，他的车轮都不停歇；遇到滹沱河的“大沙窝”，推也推不动，骑也骑不动，他就扛着自行车步行…当时，未满29周岁的习近平怀着“我要为人民做事情，要同人民唱一曲悠扬的《农家乐》”的情怀，主动请缨下基层，来到河北省正定县。西兆通、塔元庄、二十里铺、三角村、东权城村、南村……深深浅浅的车辙里，印证着习近平“求真务实”的初心。1983年10月，时任正定县委书记的习近平在县城大街上临时摆桌子，听取群众意见。"
        tableView.layoutIfNeeded()
    }
    
    func readLocalData(fileNameStr:String,type:String) -> Any? {
        let path = Bundle.main.path(forResource: fileNameStr, ofType: type);
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            return jsonData;
        } catch let error as Error? {
            return error?.localizedDescription;
        }
    }
    
    func addHeaderV()->UIView{
        let bgV = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 1, height: 1))
        bgV.backgroundColor = UIColor.white
        bgV.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.size.width)
        }
        //标题
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        titleL.numberOfLines = 0
        bgV.addSubview(titleL)
        titleL.snp.makeConstraints{make in
            make.top.left.equalTo(bgV).offset(10)
            make.right.equalTo(bgV).offset(-10)
        }
        
        //subtitleV
        bgV.addSubview(subtitleV)
        subtitleV.snp.makeConstraints{make in
            make.top.equalTo(titleL.snp.bottom).offset(10)
            make.left.right.equalTo(titleL)
            make.height.equalTo(19)
        }
        
        //单位
        danweiL.textColor = UIColor.gray
        danweiL.font = UIFont.systemFont(ofSize: 12)
        subtitleV.addSubview(danweiL)
        danweiL.snp.makeConstraints{make in
            make.top.equalTo(subtitleV.snp.top)
            make.bottom.equalTo(subtitleV.snp.bottom)
            make.left.equalTo(titleL.snp.left)
        }
        
        //时间
        timeL.textColor = UIColor.gray
        timeL.font = UIFont.systemFont(ofSize: 12)
        subtitleV.addSubview(timeL)
        timeL.snp.makeConstraints{make in
            make.top.equalTo(subtitleV.snp.top)
            make.bottom.equalTo(subtitleV.snp.bottom)
            make.left.equalTo(danweiL.snp.right).offset(5)
        }
        
        //浏览数
        seenumL.textColor = UIColor.gray
        seenumL.font = UIFont.systemFont(ofSize: 12)
        subtitleV.addSubview(seenumL)
        seenumL.snp.makeConstraints{make in
            make.top.equalTo(subtitleV.snp.top)
            make.bottom.equalTo(subtitleV.snp.bottom)
            make.right.equalTo(titleL.snp.right)
        }
        
        //浏览数图标
        yanjingI.backgroundColor = UIColor.red
        subtitleV.addSubview(yanjingI)
        yanjingI.snp.makeConstraints{make in
            make.top.equalTo(subtitleV.snp.top)
            make.bottom.equalTo(subtitleV.snp.bottom)
            make.width.equalTo(yanjingI.snp.height)
            make.right.equalTo(seenumL.snp.left).offset(-5)
        }
        
        //分割线
        line.backgroundColor = UIColor.groupTableViewBackground
        bgV.addSubview(line)
        line.snp.makeConstraints{make in
            make.top.equalTo(subtitleV.snp.bottom).offset(10)
            make.left.right.equalTo(titleL)
            make.height.equalTo(1)
        }
        
        //内容
        neirongL.numberOfLines = 0
        bgV.addSubview(neirongL)
        neirongL.snp.makeConstraints{make in
            make.top.equalTo(line.snp.bottom).offset(10)
            make.left.right.equalTo(titleL)
        }
        
        //评论标题
        let pinglunTitleL = UILabel.init()
        pinglunTitleL.text = "  说两句  "
        pinglunTitleL.backgroundColor = UIColor.red
        pinglunTitleL.textColor = UIColor.white
        pinglunTitleL.font = UIFont.systemFont(ofSize: 12)
        bgV.addSubview(pinglunTitleL)
        pinglunTitleL.snp.makeConstraints{make in
            make.top.equalTo(neirongL.snp.bottom).offset(20)
            make.height.equalTo(20)
            make.left.equalTo(0)
        }
        //评论小标题
        let pinglunSubTitleL = UILabel.init()
        pinglunSubTitleL.font = UIFont.systemFont(ofSize: 14)
        pinglunSubTitleL.text = "热门评论"
        pinglunSubTitleL.textColor = UIColor.gray
        bgV.addSubview(pinglunSubTitleL)
        pinglunSubTitleL.snp.makeConstraints{make in
            make.top.equalTo(pinglunTitleL.snp.bottom)
            make.left.right.equalTo(titleL)
            make.height.equalTo(50)
            make.bottom.equalTo(bgV.snp.bottom)
        }
        return bgV
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0;
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bgV = UIView.init()
        bgV.backgroundColor = UIColor.white
        
        let headIV = UIImageView.init()
        headIV.layer.cornerRadius = 20
        headIV.backgroundColor = UIColor.groupTableViewBackground
        bgV.addSubview(headIV)
        headIV.snp.makeConstraints{ make in
            make.top.left.equalTo(15)
            make.width.height.equalTo(40)
        }
        
        let userL = UILabel.init()
        userL.textColor = UIColor.blue
        userL.font = UIFont.systemFont(ofSize:14)
        bgV.addSubview(userL)
        userL.snp.makeConstraints{ make in
            make.top.equalTo(headIV.snp.top).offset(2)
            make.left.equalTo(headIV.snp.right).offset(5)
        }
        
        let timeL = UILabel.init()
        timeL.textColor = UIColor.gray
        timeL.font = UIFont.systemFont(ofSize:12)
        bgV.addSubview(timeL)
        timeL.snp.makeConstraints{ make in
            make.left.equalTo(userL.snp.left)
            make.bottom.equalTo(headIV.snp.bottom).offset(-2)
        }
        
        let rightBtn = UIButton.init()
        rightBtn.backgroundColor = UIColor.red
        //        rightBtn.setImage(#imageLiteral(resourceName: <#T##String#>), for: .normal)
        bgV.addSubview(rightBtn)
        rightBtn.snp.makeConstraints{ make in
            make.top.equalTo(17)
            make.right.equalTo(-15)
            make.width.height.equalTo(20)
        }
        
        let detailL = UILabel.init()
        detailL.numberOfLines = 0
        bgV.addSubview(detailL)
        detailL.snp.makeConstraints{ make in
            make.top.equalTo(headIV.snp.bottom).offset(10)
            make.bottom.equalTo(-10)
            make.left.equalTo(userL.snp.left)
            make.right.equalTo(-15)
        }
        
        let comlist = model.comList[section]
        //cell.headIV.image = UIImage.init(data: Data.init(contentsOf: relist.userImg))
        userL.text = comlist.userName
        timeL.text = comlist.addTime
        rightBtn.tag = section + 2000
        rightBtn.addTarget(self, action: #selector(clickRight), for: .touchUpInside)
        detailL.text = comlist.content
        
        return bgV
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.comList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.comList[section].reList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELLID, for: indexPath) as! TableViewCell
        let relist = model.comList[indexPath.section].reList[indexPath.row]
        //cell.headIV.image = UIImage.init(data: Data.init(contentsOf: relist.userImg))
        if (relist.replyName == "") {
            cell.userL.text = relist.userName
        }else{
            let attrStr = NSMutableAttributedString.init(string: "\(relist.userName) 回复 \(relist.replyName)")
            attrStr.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange.init(location: relist.userName.count, length: 4))
            cell.userL.attributedText = attrStr
        }
        cell.timeL.text = relist.addtime
        cell.rightBtn.tag = indexPath.row + 2000
        cell.rightBtn.addTarget(self, action: #selector(clickRight), for: .touchUpInside)
        cell.detailL.text = relist.content
        
        return cell
    }
    
    @objc func clickRight(btn:UIButton){
        let vc = UIViewController.init()
        show(vc, sender: nil)
    }
}



