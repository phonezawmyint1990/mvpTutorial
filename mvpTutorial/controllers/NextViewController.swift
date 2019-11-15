//
//  NextViewController.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 05/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import LGSideMenuController
import RxSwift
import RxCocoa

class NextViewController: UIViewController ,UIGestureRecognizerDelegate{

    @IBOutlet weak var petCollectionview: UICollectionView!
    @IBOutlet weak var petTableView: UITableView!
   // private let mPresenter: PetListPresenterImpl = PetListPresenterImpl()
    @IBOutlet weak var ivMenu: UIImageView!
    
    let viewModel =  PetListViewModel()
    var mCategoryList: [CategoryVO] = []
    var mCatList: [CatVO] = []
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        petCollectionview.delegate = self
 //       petCollectionview.dataSource = self
        petCollectionview.register(UINib(nibName: String(describing: PetCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: PetCollectionViewCell.self))
        let layout = petCollectionview.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 10
        //layout.itemSize = CGSize(width: (self.frame.width - 20)/3, height: 180)
        //layout.itemSize = CGSize(width: 100, height: 106)
        
//        petTableView.delegate = self
//        petTableView.dataSource = self
        petTableView.register(UINib(nibName: String(describing: PetTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PetTableViewCell.self))
        self.petTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        self.petTableView.rowHeight = 185
        petTableView.separatorStyle = .none
//        mPresenter.attachView(view: self)
//        mPresenter.onUIReady()
        
       
        let tap = UITapGestureRecognizer(target: self.ivMenu, action: #selector(onClickMenu))
        tap.delegate = self
        self.ivMenu.addGestureRecognizer(tap)

        initDataObservation()
        viewModel.requestData()
       
    }
    
    @objc func onClickMenu(){
        let vc = (UIApplication.shared.keyWindow?.rootViewController) as! LGSideMenuController
        vc.showLeftViewAnimated()
    }
    
    private func initDataObservation(){
        
        
        viewModel.dataObs
        .observeOn(MainScheduler.instance)
            .bind(to: petCollectionview.rx.items){ collectionView, index, item in
                 let item2 = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PetCollectionViewCell.self), for: IndexPath(row: index, section: 0)) as! PetCollectionViewCell
                    item2.mdata = item
                return item2
            }.disposed(by:bag)
        
        
        Observable
        .zip(petCollectionview.rx.itemSelected,
             petCollectionview.rx.modelSelected(CategoryVO.self))
            .bind{indexPath, model in
                self.petCollectionview.deselectItem(at: indexPath, animated: true)
                print("selected " + model.name + "\(indexPath)")
            }.disposed(by: bag)
        
        
//        viewModel.catObs.observeOn(MainScheduler.instance).subscribe(onNext:{response in
//            self.bindCat(catList: response)
//        },onError:{error in
//
//        }).disposed(by: bag)
        
        viewModel.catObs
        .observeOn(MainScheduler.instance)
            .bind(to: petTableView.rx.items){tableView, index, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PetTableViewCell.self), for: IndexPath(row: index, section: 0)) as! PetTableViewCell
                cell.mdata = item
                return cell
        }.disposed(by: bag)
        
        
        // for model
//        petTableView.rx
//        .modelSelected(CatVO.self)
//            .subscribe(onNext: {value in
//                print(value)
//            }).disposed(by: bag)
        
        // zip (item selected + model selected )
        
        Observable
        .zip(petTableView.rx.itemSelected,
             petTableView.rx.modelSelected(CatVO.self))
            .bind{indexPath, model in
                self.petTableView.deselectRow(at: indexPath, animated: true)
                print("selectd " + model.type  + "\(indexPath)")
            }.disposed(by: bag)
        
        
    }
    
//    func bindCategory(category:[CategoryVO]){
//        self.mCategoryList = category
//        self.petCollectionview.reloadData()
//    }
    
//    func bindCat(catList:[CatVO]){
//        self.mCatList = catList
//        self.petTableView.reloadData()
//    }
}

//extension NextViewController: UICollectionViewDataSource,UICollectionViewDelegate{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//       // return mPresenter.categoryList.count
//        return self.mCategoryList.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PetCollectionViewCell.self), for: indexPath) as! PetCollectionViewCell
//      //  item.mdata = mPresenter.categoryList[indexPath.row]
//        item.mdata = mCategoryList[indexPath.row]
//        return item
//    }
//
//
//}

extension NextViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 110)
    }
}


//extension NextViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//      //  return mPresenter.catList.count
//        return self.mCatList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PetTableViewCell.self), for: indexPath) as! PetTableViewCell
//      //  cell.mdata = mPresenter.catList[indexPath.row]
//        cell.mdata = mCatList[indexPath.row]
//        return cell
//    }
//}
//
//extension NextViewController: UITableViewDelegate{
//
//}

extension NextViewController: PetListView{
    
    
    func displayCategories(data: [CategoryVO]) {
        petCollectionview.reloadData()
    }
    
    func displayCatsList(data: [CatVO]) {
        petTableView.reloadData()
    }
    func displayErrot(error: String) {
        
    }
    
    
}
