//
//  HomeViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/18.
//

import UIKit




class HomeViewController: UIViewController {
    
    var menuList = ["찜","최근본상품","내피드","내폰시세","우리동네","친구초대","전체메뉴","에르메스","여성가방","스니커즈","스타굿즈","캠핑","골프","피규어/인형"]
    
//    @IBAction func whole_menu(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Menu", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "MenuViewController")
//         self.present(vc, animated: true, completion: nil)
//    }
    
    @IBOutlet weak var Scroll_image: UIScrollView!
    
    var images = ["a"]
    var imageViews = [UIImageView]()
    @IBOutlet weak var MenuCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    



}


class menuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var menuCell_img: UIImageView!
    @IBOutlet weak var menuCell_label: UILabel!
    

    override func awakeFromNib(){
        super.awakeFromNib()
   
    }
    
}


extension HomeViewController: UICollectionViewDataSource,
                                 UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! menuCollectionViewCell
        
        cell.menuCell_label.text = menuList[indexPath.row]

//
//        let url = URL(string:collectData[indexPath.row][3])
//        let data = try! Data(contentsOf: url!)
//        cell.album.image = UIImage(data: data)
//
        
        return cell
        
    }
}
