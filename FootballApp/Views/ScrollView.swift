import UIKit
class HorizontalPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var pages: [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        let page1 = TableViewController()
        let page2 = UIViewController()
        page2.view.backgroundColor = .green
        let page3 = TableViewController()
        pages = [page1, page2, page3]
        setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
    }


    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }
}
