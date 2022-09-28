//
//  HomeViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/18.
//

import UIKit
import SnapKit
import Then



class HomeViewController: UIViewController,UIScrollViewDelegate {
    var bounds = UIScreen.main.bounds.width
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var scrollCollectView: UIView!
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UnderlineSegmentedControl(items: ["추천상품", "브랜드" ])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
      }()
   
    
    
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
    private let indicatorView = IndicatorView()
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        
      super.viewDidAppear(animated)
      let allWidth = self.MenuCollectionView.contentSize.width + self.MenuCollectionView.contentInset.left + self.MenuCollectionView.contentInset.right
      let showingWidth = self.MenuCollectionView.bounds.width
        self.indicatorView.widthRatio = showingWidth / allWidth
      self.indicatorView.layoutIfNeeded()
    }
    
    
    
    @IBOutlet weak var goodsCollectionView: UICollectionView!
    
    var configuration = UIButton.Configuration.plain()
    
    
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Scroll_image.delegate = self
        addContentScrollView()
        setNavigationBar()
//        scrollCollectView.addSubview(self.segmentedControl)
      
//        self.view.addSubview(self.segmentedControl)
        
        self.scrollCollectView.addSubview(self.segmentedControl)
 self.stackView.insertArrangedSubview(self.scrollCollectView, at: 3)
//        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
              self.segmentedControl.leftAnchor.constraint(equalTo: self.scrollCollectView.leftAnchor , constant: 10),
              self.segmentedControl.rightAnchor.constraint(equalTo: self.scrollCollectView.rightAnchor),
              self.segmentedControl.topAnchor.constraint(equalTo: self.scrollCollectView.topAnchor, constant: 5),
              self.segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            ])
       
           self.segmentedControl.addTarget(self, action: #selector(changeValue(control:)), for: .valueChanged)
           self.segmentedControl.selectedSegmentIndex = 0
           self.changeValue(control: self.segmentedControl)
//
        
        self.view.addSubview(self.indicatorView)

        self.indicatorView.snp.makeConstraints {
          $0.top.equalTo(self.MenuCollectionView.snp.bottom).offset(4)
            $0.left.right.equalTo(self.MenuCollectionView).inset(bounds*0.43)
          $0.height.equalTo(4)
        }
        
        
 
           self.segmentedControl.selectedSegmentIndex = 0
        
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

        self.navigationItem.rightBarButtonItems = [notiBarButton,searchBarButton]
        
        
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
    
    
    @objc private func changeValue(control: UISegmentedControl) {
        if control.selectedSegmentIndex == 1 {
           firstView.alpha = 0
           secondView.alpha = 1
          
       }
       
       else {
            firstView.alpha = 1
            secondView.alpha = 0

       }
        
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
        cell.menuCell_img.image = UIImage(named: menuImg[indexPath.row])

        
            return cell
        

        
       
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
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
         
         func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
             return sectionInsets
         }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
    
         func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
             return sectionInsets.left
         }
    
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if scrollView == self.MenuCollectionView{
            
            let scroll = scrollView.contentOffset.x + scrollView.contentInset.left
           let width = scrollView.contentSize.width + scrollView.contentInset.left + scrollView.contentInset.right
           let scrollRatio = scroll / width
       
            self.indicatorView.leftOffsetRatio = scrollRatio
        
            }
        }
    }


// 스크롤바 커스텀
final class IndicatorView: UIView {
  // MARK: UI
  private let trackView = UIView().then {
    $0.backgroundColor = .lightGray.withAlphaComponent(0.3)
  }
  private let trackTintView = UIView().then {
    $0.backgroundColor = .gray
  }
  
  // MARK: Properties
  var widthRatio: Double? {
    didSet {
      guard let widthRatio = self.widthRatio else { return }
      self.trackTintView.snp.remakeConstraints {
        $0.top.bottom.equalToSuperview()
          $0.width.equalToSuperview().multipliedBy(widthRatio)
        $0.left.greaterThanOrEqualToSuperview()
        $0.right.lessThanOrEqualToSuperview()
        self.leftInsetConstraint = $0.left.equalToSuperview().priority(999).constraint
      }
    }
  }
  var leftOffsetRatio: Double? {
    didSet {
      guard let leftOffsetRatio = self.leftOffsetRatio else { return }
      self.leftInsetConstraint?.update(inset: leftOffsetRatio * self.bounds.width)
    }
  }
  private var leftInsetConstraint: Constraint?
  
  // MARK: Initilize
  required init?(coder: NSCoder) {
    fatalError()
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(self.trackView)
    self.trackView.addSubview(self.trackTintView)
    
    self.trackView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    self.trackTintView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(1.0/5.0)
      $0.left.greaterThanOrEqualToSuperview()
      $0.right.lessThanOrEqualToSuperview()
      self.leftInsetConstraint = $0.left.equalToSuperview().priority(999).constraint
    }
  }
}
