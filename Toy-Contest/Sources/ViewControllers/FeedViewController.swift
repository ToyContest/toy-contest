//
//  FeedViewController.swift
//  Toy-Contest
//
//  Created by LeeSeungsoo on 06/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    // UICollectionView 의 Outlet 변수
    @IBOutlet var toyCollection: UICollectionView!
    
    // UICollectionView 에 들어가게 될 Toy 모델 타입의 배열을 생성합니다.
    var toyList: [Toy] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setToydata()
        
        // musicCollection 의 delegate 와 dataSource 의 위임자를 self 로 지정합니다.
        toyCollection.dataSource = self
        toyCollection.delegate = self
        
        // musicCollection 에 handleLongPreeGesture 를 추가합니다.
        toyCollection.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(gesture:))))
    }
    
    /*
     gesture 를 구현하는 메소드입니다.
     */
    
    @objc func handleLongPressGesture(gesture: UIGestureRecognizer)
    {
        
        // gesture 가 발생한 좌표를 반환합니다.
        let location = gesture.location(in: self.toyCollection)
        
        // 해당 좌표에 toyCollection 의 item 이 존재한다면 indexPath 에 해당 item 의 index 를 반환합니다.
        guard let indexPath = toyCollection.indexPathForItem(at: location) else {return}
        
        // 해당하는 index 의 model 를 반환합니다.
        let item = toyList[indexPath.row]
        
        // alert 를 발생하는 메소드입니다.
        let alert = UIAlertController(title: "\(item.item_name)", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive, handler:
            { (_) in
                
                // toyList 배열에서 해당 모델을 제거합니다.
                self.toyList.remove(at: indexPath.item)
                
                // toyCollection 에서 해당하는 index 의 item 을 삭제합니다.
                self.toyCollection.deleteItems(at: [indexPath])
        }))
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        // alert 를 화면에 발생시킵니다.
        present(alert, animated: true, completion: nil)
    }
    

    @IBAction func goToDetailViewController(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailFeed") as! ToyDetailVC
        self.present(vc, animated: true, completion: nil)
    }

}

extension FeedViewController: UICollectionViewDataSource
{
    
    // UICollectionView 에 얼마나 많은 아이템을 담을 지 설정합니다.
    // 현재는 musicList 배열의 count 갯수 만큼 반환합니다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        //return toyList.count
        return 10
    }
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToyCollectionViewCell", for: indexPath) as! ToyCollectionViewCell
        
        //let toy = toyList[indexPath.row]
        
//        cell.toyImg.image = toy.toyImg
//        cell.toyTitle.text = toy.toyTitle
//        cell.category.text = toy.toyCategory
        return cell
    }
}

// UICollectionViewDelegate 를 채택합니다.
extension FeedViewController: UICollectionViewDelegate
{
    
    /*
     didSelectItemAt 은 셀을 선택했을때 어떤 동작을 할 지 설정할 수 있습니다.
     여기서는 셀을 선택하면 그에 해당하는 MusicDetailVC 로 화면전환을 합니다.
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let dvc = storyboard?.instantiateViewController(withIdentifier: "ToyDetailVC") as! ToyDetailVC
        
//        let toy = toyList[indexPath.row]
//
//        dvc.toyImg = toy.toyImg
//        dvc.toyTitle = toy.toyTitle
//        dvc.category = toy.toyCategory
        self.present(dvc, animated: true)
    }
}

/* UICollectionViewDelegateFlowLayout 을 채택 */
extension FeedViewController: UICollectionViewDelegateFlowLayout
{
    // Collection View Cell 의 width, height 를 지정할 수 있습니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width: CGFloat = (view.frame.width - 100) / 2
        let height: CGFloat = width * 234 / 137
        
        return CGSize(width: width, height: height)
    }
}

extension FeedViewController
{
    func setToydata()
    {
        // Toy 데이타 구현부
    }
}

