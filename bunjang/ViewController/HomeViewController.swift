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
    
    var images = ["IMG_1","IMG_2","IMG_3","IMG_4","IMG_5","IMG_6"]
    var imageViews = [UIImageView]()
    
    private func addContentScrollView() {
           for i in 0..<images.count {
               let imageView = UIImageView()
               imageView.image = UIImage(named: images[i])
               imageView.contentMode = .scaleToFill
               let xPos = self.view.frame.width * CGFloat(i)
               imageView.frame = CGRect(x: xPos, y: 0, width: self.view.bounds.width, height: Scroll_image.bounds.height)

               
               Scroll_image.addSubview(imageView)
               Scroll_image.contentSize.width = imageView.frame.width * CGFloat(i + 1)
           }
       }
    
   
    
    
    @IBOutlet weak var MenuCollectionView: UICollectionView!
    
    @IBOutlet weak var goodsCollectionView: UICollectionView!
    
    var configuration = UIButton.Configuration.plain()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Scroll_image.delegate = self
        addContentScrollView()
        setNavigationBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           self.navigationItem.title = " "
                     }
    
    
    func setNavigationBar(){
        let menuButtonImage = UIImage(systemName: "line.3.horizontal")!
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        let searchButtonImage = UIImage(systemName: "magnifyingglass")!
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        let notiButtonImage = UIImage(systemName: "bell")!
        let notiButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
               
        menuButton.tintColor = .white
        menuButton.setImage(menuButtonImage, for: .normal)
        
        searchButton.tintColor = .white
        searchButton.setImage(searchButtonImage, for: .normal)
        
        notiButton.tintColor = .white
        notiButton.setImage(notiButtonImage, for: .normal)
               
        let menuBarButton = UIBarButtonItem(customView: menuButton)

        let searchBarButton = UIBarButtonItem(customView: searchButton)
        let notiBarButton = UIBarButtonItem(customView: notiButton)
        
        self.navigationItem.leftBarButtonItems = [menuBarButton]

        self.navigationItem.rightBarButtonItems = [searchBarButton, notiBarButton]
        
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)

        searchButton.configuration = configuration
        notiButton.configuration = configuration

        menuButton.addTarget(self, action: #selector(menubuttonAction), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchbuttonAction), for: .touchUpInside)
        notiButton.addTarget(self, action: #selector(notibuttonAction), for: .touchUpInside)

        
    }
   
    
    
    
    @objc func menubuttonAction(sender: UIButton!) {

        let storyboard = UIStoryboard(name: "Menu2", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MenuViewController")
        vc.modalPresentationStyle = .fullScreen

         self.present(vc, animated: true, completion: nil)
        
           }
    
    
    
    @objc func searchbuttonAction(sender: UIButton!) {

        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchViewcontroller")

         self.show(vc, sender: self)

        
           }
    
    
    @objc func notibuttonAction(sender: UIButton!) {

        let storyboard = UIStoryboard(name: "Notification", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationViewController")

        self.show(vc, sender: self)

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
