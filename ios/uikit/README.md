# UIKit Counter App

UIKitを使用したiOSカウンターアプリの実装例です。プログラマティックにUIを構築し、Storyboardを使用しないモダンなアプローチを採用しています。

## 概要

このプロジェクトは、UIKitの基本的な概念を学ぶためのシンプルなカウンターアプリです：
- カウンター値の表示
- インクリメント/デクリメントボタン
- リセット機能
- プログラマティックなUI構築（Storyboard不使用）
- Auto Layoutによるレイアウト
- アニメーション効果

## ファイル構成

```
uikit/
├── AppDelegate.swift           # アプリケーションのエントリーポイント
├── SceneDelegate.swift         # シーン管理（iOS 13+）
├── CounterViewController.swift # メインのビューコントローラー
└── README.md                   # このファイル
```

## 前提条件

- **macOS**: iOS開発にはmacOSが必須
- **Xcode**: 最新版を推奨（14.0以降）
- **Swift**: 5.5以降
- **iOS**: 13.0以降をターゲット

## セットアップ手順

### 1. Xcodeプロジェクトの作成

```bash
# Xcodeを起動
open -a Xcode

# または新規プロジェクトを作成
# File > New > Project > iOS > App
# Interface: Storyboard を選択
```

### 2. ファイルの追加

1. プロジェクトナビゲーターで右クリック
2. "New File..." を選択
3. "Swift File" を選択
4. このディレクトリのファイル内容をコピー

### 3. Info.plist の設定

Storyboardを使用しない場合、Info.plistから以下を削除：

```xml
<!-- この項目を削除 -->
<key>UISceneStoryboardFile</key>
<string>Main</string>

<!-- Application Scene Manifest内のStoryboard Name も削除 -->
```

### 4. ビルドと実行

```bash
# シミュレーターで実行
⌘ + R

# または特定のシミュレーターを指定
xcodebuild -scheme CounterApp -destination 'platform=iOS Simulator,name=iPhone 15'
```

## コード解説

### AppDelegate.swift

アプリケーションのライフサイクルを管理します。

```swift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // アプリケーション起動時の処理
    func application(_ application: UIApplication,
                    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}
```

### SceneDelegate.swift

iOS 13以降のシーンベースのライフサイクルを管理します。

```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
              options connectionOptions: UIScene.ConnectionOptions) {
        // ウィンドウの作成とルートビューコントローラーの設定
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(
            rootViewController: CounterViewController()
        )
        window?.makeKeyAndVisible()
    }
}
```

### CounterViewController.swift

メインのUIとロジックを実装します。

#### プロパティの定義

```swift
// カウンター値（didSetで自動更新）
private var counter = 0 {
    didSet {
        updateCounterLabel()
    }
}

// UI要素
private let counterLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 48, weight: .bold)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()
```

#### Auto Layoutの設定

```swift
NSLayoutConstraint.activate([
    // Center horizontally and vertically with offset
    counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),

    // Button constraints
    incrementButton.widthAnchor.constraint(equalToConstant: 120),
    incrementButton.heightAnchor.constraint(equalToConstant: 120)
])
```

#### イベント処理

```swift
@objc private func incrementTapped() {
    counter += 1  // didSetが呼ばれ、UIが自動更新される
    animateButton(incrementButton)
}
```

## UIKitの主要概念

### 1. ViewController

UIViewControllerはビュー階層の管理を担当：
- `viewDidLoad()`: ビューが読み込まれた時に呼ばれる
- `view`: ルートビュー
- ビューのライフサイクル管理

### 2. プログラマティックUI

Storyboardを使わず、コードでUIを構築：

```swift
// UIコンポーネントの作成
let button = UIButton(type: .system)
button.setTitle("タップ", for: .normal)
button.translatesAutoresizingMaskIntoConstraints = false

// ビューに追加
view.addSubview(button)

// 制約を設定
NSLayoutConstraint.activate([
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
])
```

### 3. Target-Action パターン

イベント処理の基本：

```swift
// アクションの追加
button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

// アクションメソッド
@objc private func buttonTapped() {
    // 処理
}
```

### 4. Auto Layout

制約ベースのレイアウトシステム：

```swift
NSLayoutConstraint.activate([
    // 位置の制約
    view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
    view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 20),

    // サイズの制約
    view.widthAnchor.constraint(equalToConstant: 100),
    view.heightAnchor.constraint(equalToConstant: 50)
])
```

### 5. アニメーション

UIViewのアニメーションAPI：

```swift
UIView.animate(withDuration: 0.3) {
    view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
} completion: { _ in
    UIView.animate(withDuration: 0.3) {
        view.transform = .identity
    }
}
```

## Flutterとの比較

| 概念 | Flutter | UIKit |
|-----|---------|-------|
| 状態管理 | `setState(() { counter++; })` | `counter += 1` + 手動UI更新 |
| UI構築 | 宣言的（Widget） | 命令的（プログラマティック） |
| レイアウト | `Column`, `Row` | `UIStackView`, Auto Layout |
| ボタン | `ElevatedButton` | `UIButton` |
| テキスト | `Text` | `UILabel` |
| イベント | `onPressed` | `addTarget(_:action:for:)` |

### 主な違い

1. **宣言的 vs 命令的**
   - Flutter: UI全体を宣言的に記述
   - UIKit: UIを命令的に構築・更新

2. **状態管理**
   - Flutter: `setState`で自動的に再ビルド
   - UIKit: 手動でUIコンポーネントを更新

3. **レイアウト**
   - Flutter: Flexboxライクなレイアウト
   - UIKit: 制約ベースのAuto Layout

4. **Hot Reload**
   - Flutter: 高速なHot Reload
   - UIKit: ビルドが必要（遅い）

## トラブルシューティング

### 制約のエラー

```
Unable to simultaneously satisfy constraints
```

**解決方法**:
- `translatesAutoresizingMaskIntoConstraints = false`を設定
- 競合する制約がないか確認
- 優先度を調整（`priority`プロパティ）

### ビューが表示されない

**確認ポイント**:
1. `view.addSubview()`を呼んでいるか
2. 制約が正しく設定されているか
3. `translatesAutoresizingMaskIntoConstraints = false`を設定しているか

### Storyboardエラー

プログラマティックUIを使用する場合:
1. Info.plistからStoryboard関連の設定を削除
2. SceneDelegateでwindowを手動で作成

## 学習リソース

### 公式ドキュメント
- [UIKit Documentation](https://developer.apple.com/documentation/uikit)
- [Auto Layout Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/)
- [View Controller Programming Guide](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/)

### チュートリアル
- [Apple Developer Tutorials](https://developer.apple.com/tutorials/)
- [Ray Wenderlich - UIKit Tutorials](https://www.raywenderlich.com/ios/paths/iosfoundations)

### コミュニティ
- [Swift Forums](https://forums.swift.org/)
- [Stack Overflow - UIKit](https://stackoverflow.com/questions/tagged/uikit)

## 次のステップ

1. **ナビゲーション**: `UINavigationController`の使用
2. **テーブルビュー**: `UITableView`でリスト表示
3. **永続化**: UserDefaultsやCore Dataでデータ保存
4. **ネットワーキング**: URLSessionでAPI通信
5. **SwiftUIへの移行**: モダンな宣言的UIフレームワーク

## ライセンス

このサンプルコードは教育目的で自由に使用できます。
