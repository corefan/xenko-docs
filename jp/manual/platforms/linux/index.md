# Linux

## セットアップ

最初に[要件とセットアップの指示](setup.md)に従ってください。

## Linux 用ゲームを作成する

GameStudio で新しいゲームを作成し、ターゲット プラットフォームの 1 つとして Linux を選択します。

![New Game](media/platform_choice.png)

それが終われば後は、プラットフォーム セレクターで Linux を選択し、F5 キーを押して現在のプロジェクトをビルドして開始するだけです。

![Platform Selector](media/platform_selector.png)

初めて実行したときは、次に示すような Linux ホストに関する情報を入力する必要があります。

![Credential Dialog](media/default_credential_dialog.png)

次のように情報を入力します。

![Filled Credential Dialog](media/filled_credential_dialog.png)

このとき、［Test settings］ボタンをクリックして資格情報をテストする必要があります。エラーがある場合は、次のように表示されます。

![Invalid Settings](media/unreachable_host.png)

エラーがない場合は、次のように表示されます。

![Success](media/successful_login.png)

終了したら、［OK］ボタンをクリックして続行します。Linux ホストの指定した場所のサブディレクトリに、すべてのファイルがコピーされます。サブディレクトリの名前は、ゲームの名前です。

問題がある場合は、［Output］ペインで詳細を確認します。

## 設定

最初に入力したすべての資格情報は、［Settings］ダイアログに保存されます。

![Settings Dialog](media/remote_settings.png)

パスワードは、現在のユーザーに対して Micrsoft *System.Security.Cryptograph.ProtectedData.Protect* メソッドを使用して暗号化されて保存され、［Settings］には Base64 で保存されたものが表示されます。当分の間、［Settings］ダイアログでパスワードを変更することはできません。

資格情報に加えて、ゲームの実行を制御する設定が他に 2 つあります。
* [Use CoreCLR]: .NET Core を使用して強制的に実行します。
* [X Display]: Linux ホストの特定の X ディスプレイで強制的に実行します。

## Game Studio の外でコンパイルする

他の Xenko プロジェクトと同様に、Visual Studio またはコマンド ラインから直接プロジェクトをコンパイルすることもできます。どちらの場合も、有効な構成を選択する必要があります。

* Debug
* Release
* CoreCLR_Debug
* CoreCLR_Release

先の 2 つは Mono がターゲットで、後の 2 つは .NET Core がターゲットです。

### Visual Studio

プロジェクトを Visual Studio にロードした後、Linux プロジェクトを選択します。［ソリューション構成］ドロップダウン メニューで、有効な Linux の構成から 1 つを選択します。

![Configuration selection](media/vs_configuration_selection.png)

### MSBuild

コマンド ラインからは、次のコマンドを使用して Linux 用にコンパイルできます。

```
msbuild /p:Platform=Linux /p:Configuration=CONFIG YourGame.sln
```

**CONFIG** を、Linux の有効な構成の 1 つに置き換えます。

## 制限事項

* ファシリティのデバッグはまだできません

* レンダリング グラフィックス プラットフォームを切り替えると、ゲームが起動時にハングする可能性があります。これを回避するには、Linux ホストでゲームを展開したディレクトリの *cache*/*local*/*roaming* ディレクトリを削除します。
