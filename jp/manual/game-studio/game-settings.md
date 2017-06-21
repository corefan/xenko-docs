# ゲームの設定

<span class="label label-doc-level">初級</span>
<span class="label label-doc-audience">プログラマー</span>
<span class="label label-doc-audience">デザイナー</span>

ゲームのグローバルな設定は、[Game Settings] アセットで構成できます。既定では、これはプロジェクトの [Assets] フォルダーに格納されます。

## ゲームの設定を編集する

1. [Solution explorer] (既定では左下のペイン) で、[Assets] フォルダーを選択します。

    ![Select Assets folder asset](media/select-asset-folder.png)

2. [Asset view] (既定では下部のペイン) で、[GameSettings] アセットを選択します。

    ![Select Game Settings asset](media/select-game-settings-asset.png)

3. [Property grid] (既定では右側のペイン) で、[Game Settings] のプロパティを編集します。

   ![Game settings](media/game-settings.png)

### 既定のシーン

プロジェクトには複数のシーンを作成できます。**既定のシーン**は、Xenko が実行時にロードするシーンです。

既定のシーンを設定するには:

1. [Game Settings] のプロパティで、[Default Scene] の隣の [Asset picker] ボタンをクリックします。

    ![Set default scene](media/game-settings-default-scene.png)

    **アセット ピッカー**が開きます。

2. アセット ピッカーで既定のシーンを選択し、[OK] をクリックします。

シーンの詳細については、「[シーンの概要](../game-studio/scenes.md)」を参照してください。

### レンダリングの設定

![Rendering settings](media/rendering-settings.png)

| プロパティ                    | 説明                                                                                                                                                                     |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Default Back Buffer Width   | デバイスの比率および解像度によっては、オーバーライドされている場合があります。Windows では、これはウィンドウのサイズです。Android/iOS では、これはオフスクリーン ターゲットの解像度です。 |
| Default Back Buffer Height  | デバイスの比率および解像度によっては、オーバーライドされている場合があります。Windows では、これはウィンドウのサイズです。Android/iOS では、これはオフスクリーン ターゲットの解像度です。 |
| Adapt Back Buffer To Screen | このオプションを有効にすると、画面の比率に合わせてバック バッファーの比率が調整されます。                                                                                            |
| Default Graphics Profile    | プロジェクトで必要なグラフィックス機能レベルです。                                                                                                                             |
| Color Space                 | レンダリングに使用される色空間 (ガンマまたはリニア) です。この設定は、実行時のゲーム、および Game Studio での要素の表示方法に影響します。                                           |
| Display Orientation         | ゲームの表示の向きです (既定、縦、左横、右横)。                                                                                    |
| Target graphics platform    | プロジェクトのビルド対象のターゲット プラットフォームです。これを [Default] に設定すると、最も適切なプラットフォームが選択されます。                                                                                                   |
### エディターの設定

エディターの設定は、シーン エディターでのエンティティの表示方法を制御します。実行時のゲームには影響ありません。

>[!NOTE]
>[Rendering Settings] の [Color Space] の設定は、シーン エディターでのエンティティの表示方法にも影響します。

![Editor settings](media/editor-settings.png)

| プロパティ            | 説明                                                                           |
|---------------------|---------------------------------------------------------------------------------------|
| Rendering mode      | サムネイルおよびアセット プレビューのレンダリング方法です。                                |
| Animation Frame Rate | Game Studio で表示されるアニメーションのフレーム レートです。アニメーション データには影響ありません。 |

### テクスチャの設定

![Texture settings](media/texture-settings.png)

| プロパティ        | 説明                                                                                                                                                    |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Texture Quality | テクスチャをエンコードするときのテクスチャの品質です。[Fast] は CPU の使用量は最小ですが、品質は最低です。品質を高くすると、ターゲット プラットフォームによってはビルドが遅くなる場合があります。 |

### 物理特性の設定

![Physics settings](media/physics-settings.png)

| プロパティ        | 説明                                                                                                                                                                                                                                                                                  |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Flags           | [CollisionsOnly] は、衝突を除く[物理特性](../physics/index.md)を無効にします。たとえば、このオプションを有効にすると、オブジェクトは重力によっては動きませんが、手動で動かした場合はやはり衝突します。[ContinuousCollisionDetection] は、高速で移動するエンティティが誤って他のエンティティを通り抜けないようにします。Note: 列記されている他のフラグはまだ有効になっておらず、将来のバージョンで動作するようになります。 |
| Max Sub Steps   | 物理特性エンジンが速度低下を補償するために 1 フレームで実行できるシミュレーションの最大回数です。                                                                                                                                                                                      |
| Fixed Time Step | 物理特性シミュレーション フレームの長さ (秒単位) です。既定値は 0.016667 です (1 秒の 60 分の 1)。                                                                                                                                                                                                                                       |       |

### オーバーライド

特定のプラットフォーム、グラフィックス、API などについて、設定をオーバーライドできます。たとえば、プラットフォームごとにテクスチャの品質を変えることができます。

1. [GameSettings] アセットを選択し、[Property grid] の [Overrides] で**緑色のプラス アイコン**をクリックします。

    ![Select graphics platform](../platforms/media/add-override.png)

    オーバーライドが追加されます。

2. 新しいオーバーライドの [Platforms] で、オーバーライドを適用するプラットフォームを選択します。必要なだけいくつでも選択できます。

    ![Select graphics platform override](../platforms/media/select-override-platform.png)

3. **オプション**: このオーバーライドを特定の GPU プラットフォームに対してのみ適用するには、[Specific Filter] ドロップダウン リストから選択します。

    ![Specific filter](media/specific-filter.png)

    [Platform Filters] (後の「**プラットフォーム フィルターを追加する**」を参照) で、このリストに GPU プラットフォームを追加できます。

4. [Configuration] ドロップダウン メニューで、オーバーライドする設定の種類を選択します ([Editor]、[Texture]、[Rendering]、[Physics])。

    ![Select graphics platform override](../platforms/media/select-override-configuration.png)

5. オーバーライドするオプションを設定します。

#### プラットフォーム フィルターを追加する

オーバーライドを設定するときの特定のプラットフォーム フィルターとして、[Platform Filters] で項目を選択できます (前記の説明を参照)。

![Specific filter](media/specific-filter.png)

1. [GameSettings] アセットを選択し、[Property grid] で [Platform Filters] を展開します。

    使用できるプラットフォーム フィルターのリストが表示されます。

    ![List of platform filters](media/list-of-platform-filters.png)

2. リストの下部で、[Add to Platform Filters] をクリックします。

    新しい空の項目が追加されます。

3. 項目のフィールドに、追加する GPU フィルターを入力します。

    ![Type platform filter](media/add-platform-filter-name.png)

プラットフォーム フィルターを追加した後は、[Overrides] で**特定のフィルター**としてそれを選択できます。

![Override](media/new-GPU-in-override-list.png)

>[!NOTE]
>新しいフィルターがリストに表示されない場合は、オーバーライドを削除し、再度追加してください。

## 関連項目

* [アセット](../game-studio/assets.md)
