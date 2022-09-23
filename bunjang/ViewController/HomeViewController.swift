//
//  HomeViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/18.
//

import UIKit




class HomeViewController: UIViewController,UIScrollViewDelegate {
    
    let menuList = ["찜","에르메스","최근본상품","여성가방","내피드","스니커즈","내폰시세","스타굿즈","우리동네","캠핑","친구초대","골프","전체메뉴","피규어/인형"]
    
    let menuImg = ["menu_heart","menu_herm","menu_his","menu_bag","menu_feed","menu_sne","menu_phone","menu_goods","menu_loca","menu_camp","menu_friend","menu_golf","menu_whole","menu_doll"]
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)


    
    @IBOutlet weak var Scroll_image: UIScrollView!
    
    var images = ["IMG_9686","IMG_9688"]
    var imageViews = [UIImageView]()
    
    private func addContentScrollView() {
           for i in 0..<images.count {
               let imageView = UIImageView()
               let xPos = Scroll_image.frame.width * CGFloat(i)
               imageView.frame = CGRect(x: xPos, y: 0, width: Scroll_image.bounds.width, height: Scroll_image.bounds.height)
               imageView.image = UIImage(named: images[i])
               
               
               Scroll_image.addSubview(imageView)
               Scroll_image.contentSize.width = imageView.frame.width * CGFloat(i + 1)
           }
       }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let value = scrollView.contentOffset.x/scrollView.frame.size.width
//            setPageControlSelectedPage(currentPage: Int(round(value)))
        }
    
    
    @IBOutlet weak var MenuCollectionView: UICollectionView!
    
    @IBOutlet weak var goodsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Scroll_image.delegate = self
        addContentScrollView()
        
//        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
////        backBarButtonItem.tintColor = .black
//        self.navigationItem.backBarButtonItem = backBarButtonItem
//        
        
    }
    



}


class menuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var menuCell_img: UIImageView!
    @IBOutlet weak var menuCell_label: UILabel!
    

    override func awakeFromNib(){
        super.awakeFromNib()
        
   
    }
    
}


class goodsCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var goods_img: UIImageView!
    @IBOutlet weak var goods_price: UILabel!
    

    override func awakeFromNib(){
        super.awakeFromNib()
        
   
    }
    
}


extension HomeViewController: UICollectionViewDataSource,
                                 UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == MenuCollectionView {

        return 14
        }
        else {return 10}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == MenuCollectionView {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! menuCollectionViewCell
        
        cell.menuCell_label.text = menuList[indexPath.row]
        cell.menuCell_img.image = UIImage(named: menuImg[indexPath.row])

        
            return cell
        
    }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_goods", for: indexPath) as! goodsCollectionViewCell
//            
//            cell.menuCell_label.text = menuList[indexPath.row]
//            cell.menuCell_img.image = UIImage(named: menuImg[indexPath.row])

            
                return cell
            
        }
       
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == MenuCollectionView {
             let width = collectionView.frame.width
             let height = collectionView.frame.height
             let itemsPerRow: CGFloat = 7
             let widthPadding = sectionInsets.left * (itemsPerRow + 1)
             let itemsPerColumn: CGFloat = 2
             let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
             let cellWidth = (width-widthPadding) / 4
             let cellHeight = (height-heightPadding) / itemsPerColumn
             
             return CGSize(width: cellWidth, height: cellHeight)
            
        }
        
       else {
             let width = collectionView.frame.width
             let height = collectionView.frame.height
             let itemsPerRow: CGFloat = 2
             let widthPadding = sectionInsets.left * (itemsPerRow + 1)
             let itemsPerColumn: CGFloat = 5
             let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
             let cellWidth = (width-widthPadding) / 2
             let cellHeight = (height-heightPadding) / itemsPerColumn
             
             return CGSize(width: cellWidth, height: 300)
            
        }
        
        
        }
         
         func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
             return sectionInsets
         }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
    
         func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
             return sectionInsets.left
         }
    
    
}
