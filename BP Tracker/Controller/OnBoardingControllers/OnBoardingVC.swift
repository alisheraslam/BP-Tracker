//
//  OnBoardingVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 18/04/2024.
//

import UIKit

class OnBoardingVC: UIViewController {
    
    @IBOutlet weak var onBoardingCollectionView: UICollectionView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var titleArray = ["Blood Pressure Tool", "Graph & Trend Statistics", "Blood Pressure Info & Knowledge"]
    var subtitle = ["Track, Analyze And Export Your Blood Pressure", "See The Evolution Tendency Of Your Blood Pressure", "See The Evolution Tendency Of Your Blood Pressure"]
    var images = [ImageHelper.imgOne, ImageHelper.imgTwo, ImageHelper.imgThree]
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        pageControl.numberOfPages = titleArray.count
        pageControl.updateIndicatorImages()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showItem(at: 0)
    }

    //MARK: - Actions
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AccountInfoVC") as? AccountInfoVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let nextPage = min(pageControl.currentPage + 1, titleArray.count - 1)
        showItem(at: nextPage)
        pageControl.currentPage = nextPage
        pageControl.updateIndicatorImages()
        if nextPage == titleArray.count - 1 {
            skipButton.isHidden = true
            nextButton.setTitle("Let's Go", for: .normal)
        }
    }
    @IBAction func pageControlValue(_ sender: UIPageControl) {
        showItem(at: pageControl.currentPage)
        pageControl.updateIndicatorImages()
        if pageControl.currentPage != titleArray.count - 1 {
            skipButton.isHidden = false
            nextButton.setTitle("Next", for: .normal)
        }
    }
    func showItem(at index: Int) {
        guard index >= 0 && index < titleArray.count else {
            return
        }
        pageControl.currentPage = index
        let indexPath = IndexPath(item: index, section: 0)
        onBoardingCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally, .centeredVertically], animated: true)
    }
}

//MARK: - Extension CollectionView
extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnBoardingCVCell
        cell.onBoardingImage.image = images[indexPath.row]
        cell.titleLbl.text = titleArray[indexPath.row]
        cell.subTitleLbl.text = subtitle[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

//MARK: - Extension PageControl
extension UIPageControl {
    func updateIndicatorImages() {
        for index in 0..<numberOfPages {
            let indicatorImage = (index == currentPage) ? ImageHelper.pageSelected : ImageHelper.page
            setIndicatorImage(indicatorImage, forPage: index)
        }
    }
}

