# Xenko を起動する

<span class="label label-doc-level">初級</span>

**Xenko Launcher** を使用すると、異なるバージョンの Xenko をインストール、管理、実行できます。

![Xenko launcher](media/xenko-launcher-interface.png)

## 最新バージョンの Xenko をインストールする

Xenko がまだインストールされていない場合は、Xenko Launcher で最新バージョンのインストールを促されます。

![No version installed](media/xenko-launcher-install-last-version.png)

最新バージョンのインストールを選択すると、Visual Studio 統合機能をインストールするかどうかの確認を求められます。

![Install Visual Studio integration](media/install-VS-plug-in-prompt.png)

Visual Studio 統合機能を使用すると、Visual Studio から直接シェーダーを編集でき、構文の強調表示、検証でのライブ コード分析、エラー チェック、ナビゲーションなどが提供されます。統合機能のインストールは必須ではありませんが、インストールすることをお勧めします。

## さまざまなバージョンの Xenko を管理する

複数のバージョンの Xenko をインストールし、Xenko Launcher からそれらを起動することができます。

![Manage versions of Xenko](media/xenko-launcher-various-versions.png)

古いプロジェクトの作業には、古いバージョンの Xenko の使用が必要になる場合があります。新しいバージョンの Xenko には、古いプロジェクトをアップグレードする必要がある変更が含まれる可能性があります。

マイナー バージョンでは、バージョン番号の最後の数字だけが変化します (1.9.0、1.9.1、1.9.2 など)。マイナー バージョンには互換性がなくなるような変更は含まれないので、インストールして既存のプロジェクトで使用しても安全です。

>[!NOTE]
>前のマイナー バージョンに戻すことはできません。たとえば、Xenko 1.9 と 1.8 の両方を同じ環境にインストールすることはできますが、Xenko 1.9.2 を Xenko 1.9.1 に戻すことはできません。

* 特定のバージョンのリリース ノートを見るには、バージョン名の隣にある**ノート アイコン**をクリックします。

* 特定のバージョンをインストールするには、バージョン名の隣の［Download and install］アイコンを
クリックします。

## Game Studio を開始する

Xenko のインストールが済んだら、Game Studio を開始してプロジェクトをビルドします。

1.［Switch/update version］で、使用する Xenko のバージョンを選択します。

  ［Start］ボタンでバージョン番号が更新されます。

   ![Start button](media/xenko-launcher-start-button.png)

2.［Start］をクリックして Game Studio を起動します。

## 次に学習すること

* [Game Studio で初めてのプロジェクトを作成する](create-a-project.md)

## 関連項目

Xenko Launcher の詳細については、「[Xenko Launcher](../xenko-launcher/index.md)」のページを参照してください。
