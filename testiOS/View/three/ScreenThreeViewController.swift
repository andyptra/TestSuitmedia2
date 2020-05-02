//
//  ScreenThreeViewController.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class ScreenThreeViewController: UIViewController {
    var allData = DataList.datas
    
    private var selectedOffersIndex: Int = -1
    @IBOutlet weak var tbListData: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        showIconBar(imageOne: "ic_map_view.png", imageTwo: "ic_search_white.png")
        setupTableView()
    }
    
    func setupNavigationBar(){
        self.title = "EVENT";
        self.setDefaultToolbar(dismissTabBar: #selector(dismissTabBar))
        
    }
    
    @objc private func dismissTabBar () {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension ScreenThreeViewController :  UITableViewDelegate, UITableViewDataSource {
    func setupTableView(){
        tbListData.register(ListArticleTableViewCell.nib(), forCellReuseIdentifier: "cell")
        tbListData.delegate = self
        tbListData.dataSource = self
        tbListData.separatorStyle = .none
        tbListData.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return allData.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedOffersIndex = indexPath.row
        let vc = ScreenFiveViewController()
        vc.indexSet = selectedOffersIndex
        self.navigationController?.pushViewController(vc, animated: false)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! ListArticleTableViewCell
            
            let data = allData[indexPath.row]
            cell.selectionStyle = .none
            cell.lblTitle.text =  data.title
            cell.lblSubTitle.text = data.subTitle
            cell.dateLbl.text = data.Date
            return cell
    }
}

