import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {

    //MARK: - UI Elements

    let loginView = LoginView()

    //MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }

    //MARK: - Methods

    private func layout() {
        view.addSubview(loginView)

        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
