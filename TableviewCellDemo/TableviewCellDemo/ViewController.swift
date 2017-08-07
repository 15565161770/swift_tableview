//
//  ViewController.swift
//  TableviewCellDemo
//
//  Created by 仝兴伟 on 2017/8/1.
//  Copyright © 2017年 仝兴伟. All rights reserved.
// 自定义tableview  注意；自定义tableviewcell是一个集合视图
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
import UIKit
import SwiftyJSON
class ViewController: UIViewController {

    lazy var detailChannelArray: [ListModel] = [ListModel]()

    
    // tableview懒加载
    lazy var tableView : UITableView = {
        let table = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style : .plain)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        
        loadStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
   func loadStatus(){
    NetworkTools.shareInstance.loadStatus { (result, error) in
        // 1 错误校验
        if error != nil{
            return
        }
        // 2 获取可选类型数组
        guard let resultArray = result else{
            return
        }
        // 3 遍历微博字典
        for dic in resultArray{
            // 字典转模型
            let model = ListModel(dict: dic as [NSString : AnyObject])
            self.detailChannelArray.append(model)
          }
        // 刷新表格
        self.tableView.reloadData()
        
        }
    }
}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.detailChannelArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "cell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DetailCollectionCell {
            let status = self.detailChannelArray[indexPath.row];
            cell.sendModel(model: status)
            return cell
        } else {
            let cell = DetailCollectionCell(style: .default, reuseIdentifier: identifier)
            let status = self.detailChannelArray[indexPath.row];
            cell.sendModel(model: status)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableview的点击方法===\(indexPath.row)")
    }

}
