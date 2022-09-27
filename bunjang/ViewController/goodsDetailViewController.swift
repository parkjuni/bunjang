//
//  goodsDetailViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/27.
//

import UIKit

class goodsDetailViewController: UIViewController {

    var DataList : [Detail] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        goods().goodsDetail(self)

        

    }
    func setNavigationBar(){
     
        let searchButtonImage = UIImage(systemName: "magnifyingglass")!
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        let shareButtonImage = UIImage(systemName: "square.and.arrow.up")!
        let shareButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
       
        searchButton.tintColor = .black
        searchButton.setImage(searchButtonImage, for: .normal)
        
        shareButton.tintColor = .black
        shareButton.setImage(shareButtonImage, for: .normal)
        

        let searchBarButton = UIBarButtonItem(customView: searchButton)
        let sharehBarButton = UIBarButtonItem(customView: shareButton)


        self.navigationItem.rightBarButtonItems = [sharehBarButton
                                                   ,searchBarButton]
        
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)

        searchButton.configuration = configuration
        shareButton.configuration = configuration

        
        searchButton.addTarget(self, action: #selector(searchbuttonAction), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(sharebuttonAction), for: .touchUpInside)

        
    }
   
    
    
    
    @objc func searchbuttonAction(sender: UIButton!) {

        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchViewcontroller")

         self.show(vc, sender: self)
           }
    
    
    
    
    @objc func sharebuttonAction(sender: UIButton!) {

        let storyboard = UIStoryboard(name: "Menu2", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MenuViewController")
        vc.modalPresentationStyle = .fullScreen

         self.present(vc, animated: true, completion: nil)
        
           }
}


//api setting 함수
extension goodsDetailViewController{
    
    func didSuccess_goodsDe(_ response: goods_Detail){
        
//        let brandName = response.result[0].brandName
//        self.testlabel.text = brandName
//
        self.DataList = response.result

        print("굿즈디테일")
        print(DataList.count)
        print(DataList[0].title)
//        print(homelist[2].categoryName)
//        self.collectionView.reloadData()

//        self.collectionView.reloadData()

//        self.brandTable.reloadData()
                   
               
//
    }
}
