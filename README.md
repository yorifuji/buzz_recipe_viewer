# buzz_recipe_viewer

# What

- flutter project を作成
- Initial Commit
- Bundle Identifier の変更
  - Runner.xcwrokspace を開いて com.exmaple.... を変更する
  - 変更すると ADC に Identifier が登録される（Automatically manage signing のため）
- プロビジョニングプロファイルの作成
  - ADC にログイン
  - Register a New Provisioning Profile
    - Distribution / App Store
    - 登録されている App ID を選択する
    - 適当な名前（'MyApp for App Store' など）を入力して Generate
- Automatically manage signing を Off にする（Manual に変更）
  - Runner.xcwrokspace を開く
  - Signing and Capabilities を開いて Automatically manage signing のチェックを外す
  - Provisioning profile に先ほど作成したプロファイルを指定する
- ExportOptions.plist の取得
  - Xcode から Product > Archive > Export を選択
  - 初回は App Store Connect に登録するアプリ名を入力する
    - App Store Connect にアプリが登録される
  - Manual managing signing を選択する
    - 作成したプロファイルを指定する
  - Export
    - 出力先のフォルダに入っている ExportOptions.plist をプロジェクトの ios フォルダに追加する
- GitHub Actions のワークフローを追加
  - .github フォルダに Workflow を追加
  - 修正
    - deliver.ios.job.yaml
      - IOS_IPA_PATH のファイル名を修正
    - deliver.workflow.yaml
      - deliver-ios: の uses を修正
- GitHub Actions の環境設定
  - GitHub のプロジェクトを開く
  - Settings / Secrets / Actions を開く
  - 以下の内容を登録

| キー                       | 用途                               | 取得方法                                                 |
| -------------------------- | ---------------------------------- | -------------------------------------------------------- |
| SLACK_INCOMING_WEBHOOK_URL | Slack への通知                     | App 管理 > カスタムインテグレーション > Incoming Webhook |
| APPLE_APPLE_ID             | App Store Connect にアクセス       |                                                          |
| APPLE_APP_PASS             | App Store Connect にアップロード   | https://support.apple.com/ja-jp/HT204397                 |
| APPLE_CERTIFICATES_P12     | ipa に署名するための証明書         | https://zenn.dev/pressedkonbu/articles/254ca2fc3cd1ab    |
| APPLE_CERTIFICATE_PASSWORD | 証明書にセットしたパスワード       | https://zenn.dev/pressedkonbu/articles/254ca2fc3cd1ab    |
| APPLE_PROVISIONING_PROFILE | 配布用プロビジョニングプロファイル | https://zenn.dev/pressedkonbu/articles/254ca2fc3cd1ab    |

- GitHub でブランチ保護を設定する（オプション）
  - main ブランチに対する保護を設定する
  - 詳細
    - Branch name pattern
      - main
    - Protect matching branches / Require a pull request before merging / Require approvals
      - 1
    - ref: https://docs.github.com/ja/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule
- CD の動作確認
  - GitHub Actions を開く
  - action bump から Run workflow を選択
  - 'Please Choice Bump Up Target' で適当なターゲットを選択して実行
  - 成功すると PR が作成される
  - PR に対して Approve する
  - CD が起動してビルドが行われる
