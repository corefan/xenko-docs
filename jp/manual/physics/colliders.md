# コライダー

<span class="label label-doc-level">初級</span>
<span class="label label-doc-audience">デザイナー</span>

プロジェクトで物理特性を使用するには、**コライダー** コンポーネントをエンティティに追加します。コライダーは、相互に衝突できるエンティティです。

コライダーには次の 3 種類があります。

* [静的コライダー](static-colliders.md)は動きません。
* [剛体](rigid-bodies.md)は、衝突や重力などの力によって動き回ります。
* [キャラクター](characters.md)は、ユーザーの入力によって制御されます。

また、以下のことが可能です。

* [コライダー コンポーネントの形状](collider-shapes.md)を設定します
* [トリガー](triggers.md) コライダーを作成し、それを使用してオブジェクトがそれを通過するときのイベントをスクリプト化します
* [制約](constraints.md)によってコライダーの動きを制限します

## シーン エディターでコライダーを表示する

既定では、コライダーはシーン エディターには表示されません。表示するには次のようにします。

1. Game Studio ツールバーの右上にある [Display gizmo options] アイコンを表示します。

   ![Display gizmo options](media/display-gizmo-options.png)

2. [Physics] を選択します。

    ![Display physics option](media/display-physics-option.png)

シーン エディターにコライダーの形状が表示されます。

![Display physics](media/display-physics.png)

## 実行時にコライダーを表示する

実行時にコライダーを表示できます。これは、物理特性に関する問題のデバッグに便利です。そのためには、次のようにします。

``
this.GetSimulation().ColliderShapesRendering = true;
``

キーボード ショートカットで実行時にコライダーの形状の表示/非表示を切り替えるには、**DebugPhysicsShapes** スクリプトを使用します。

1. [Asset view] で [Add asset] をクリックします。
2. [Scripts] > [Debug Physics Shapes] の順に選択します。
3. [Debug Physics Shapes] スクリプトをコンポーネントとしてシーン内のエンティティに追加します。

スクリプトがコライダーの形状の可視性を**左 Shift + 左 Ctrl + P** にバインドするので、実行時にオン/オフを切り替えられるようになります。スクリプトを編集して、別のキーの組み合わせにバインドできます。

> [!NOTE]
> 無限平面に対するコライダーの形状は常に表示されません。

## 関連項目

* [コライダーの形状](collider-shapes.md)
* [静的コライダー](static-colliders.md)
* [剛体](rigid-bodies.md)
* [運動学的剛体](kinematic-rigid-bodies.md)
* [シミュレーション](simulation.md)
* [物理特性のチュートリアル](tutorials.md)
