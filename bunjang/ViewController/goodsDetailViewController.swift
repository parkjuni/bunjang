//
//  goodsDetailViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/27.
//

import UIKit

class goodsDetailViewController: UIViewController {

//    var DataList : Detail = []

    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    @IBOutlet weak var DgoodImg: UIImageView!
    
    @IBOutlet weak var Dtitle: UILabel!
    @IBOutlet weak var Dprice: UILabel!
    
    @IBOutlet weak var Dregion: UILabel!
    
    @IBOutlet weak var Dviewlikes: UILabel!
    
    @IBOutlet weak var Dcontent: UILabel!
    
    
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
//        shareButton.addTarget(self, action: #selector(sharebuttonAction), for: .touchUpInside)

        
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
        

        print("굿즈디테일 성공")

        Dprice.text = response.result.price
        Dregion.text = response.result.region
        Dviewlikes.text =  "  𓁺" + String(response.result.views) + "  ♥" + String(response.result.likes)
        Dcontent.text = response.result.content
        Dtitle.text = response.result.title

        let url = URL(string:response.result.goodsImgList[0].imgUrl)
        let data = try! Data(contentsOf: url!)
        DgoodImg.image = UIImage(data: data)

        

    }
}
