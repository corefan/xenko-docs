# シーン エディター内を移動する

<span class="label label-doc-level">初級</span>
<span class="label label-doc-audience">レベル デザイナー</span>

シーン内を移動し、エディター カメラの視点を変えることができます。左下にある XYZ 軸が、3D 空間内での向きを示します。

   ![Scene orientation gizmo](media/navigate-in-a-scene-scene-orientation-gizmo.png)

## シーン内を動き回る

シーン エディター内でエディター カメラを移動させるには複数の方法があります。

> [!TIP]
> **Shift** キーを押したまま操作すると移動の速度が上がります。

### 歩く

シーン内を歩き回るには、**左マウス ボタン**を押したまま、**マウス**を動かします。エディター カメラは X および Z 次元に沿って移動します。

<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-walk-in-the-scene.mp4" type="video/mp4">
</video>

### 飛ぶ

シーン内を飛び回るには、**右マウス ボタン**を押したまま**マウスを移動**してカメラの向きを変え、**WASD キー**を使用して移動します。これは、多くのアクション ゲームのコントロールと似ています。

操作                          | 効果
--------------------------------|--------------
**右マウス ボタン + マウスを移動**              | エディター カメラが回転する
**A キー + 右マウス ボタン**  | 左に移動する
**D キー + 右マウス ボタン**  | 右に移動する
**S キー + 右マウス ボタン**  | 後方に移動する
**W キー + 右マウス ボタン**  | 前方に移動する
**Q キー + 右マウス ボタン**  | 下方に移動する
**E キー + 右マウス ボタン**  | 上方に移動する

<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-fly-in-the-scene.mp4" type="video/mp4">
</video>

### 点を中心に回転する

**Alt** キーと**左マウス ボタン**を押したまま、**マウス**を移動すると、中心点を中心にして回転できます。

回転の中心は、常に画面の中心です。中心点までの距離は、**マウス ホイール**で調整できます。

![Rotation](media/navigate-in-scene-orbital-rotation-schema.png)

<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-orbital-rotation.mp4" type="video/mp4">
</video>

### エンティティに焦点を合わせる

エンティティを選択した後、**F** キーを押します。エンティティにズームインし、エンティティがカメラ エディターの中央に配置されます。

また、エンティティ ツリーのエンティティの隣にある**虫眼鏡アイコン**をクリックすることで、エンティティに焦点を合わせることもできます。

![Focus icon](media/focus-icon.png)

<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-focus-on-entity-using-f-key.mp4" type="video/mp4">
</video>

> [!TIP]
> エンティティに焦点を合わせた後、**Alt キーと左マウス ボタン**を使用して回転すると、エンティティを調べることができます。

### コントロール

操作                 | コントロール
-----------------------|--------------
平行移動              | 方向キー、いずれかのマウス ボタンを押しながら A、S、D、Q、W、E キーを押す
歩行                   | 左マウス ボタン
シーンを見回す | 右マウス ボタン
軌道回転       | Alt キー + 左マウス ボタン
拡大または縮小    | マウス ホイールを動かす、Alt キー + 右マウス ボタン
パン                    | 中央マウス ボタンを押す
焦点                  | エンティティを選択して F キーを押す

## カメラ エディターの視点を変更する

シーン エディターの右上にある**ビュー カメラ ギズモ**を使用して、カメラ エディターの視点を変更できます。

![View camera gizmo](media/navigate-in-a-scene-view-camera-gizmo.png)

### カメラを位置にスナップする

エディター カメラの角度を変更するには、**ビュー カメラ ギズモ**の対応する面、辺、または頂点をクリックします。

クリック    | カメラの位置
---------|--------------
面     | 選択した面を向きます
辺     | 隣接する 2 つの面に対して 45° の方向を向きます
頂点  | 隣接する 3 つの面に対して 45° の方向を向きます

<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-change-view-angle.mp4" type="video/mp4">
</video>

## カメラの位置

カメラ オプションを表示するには、シーン エディターの右上にある**カメラ アイコン**をクリックします。

![Switch to orthographic](../get-started/media/switch-to-orthographic.png)

### 透視投影ビューと正投影ビュー

**透視投影ビュー**は、シーン内のオブジェクトの「現実世界」の遠近法です。このビューでは、同じ長さの線が、実際と同じように、短縮遠近のために異なる長さで表示されます。

**正投影ビュー**では、同じ長さの線は同じ長さで表示されます。平行線は交わることがなく、消失点はありません。オブジェクトが正確に整列されているかどうかを簡単に確認できます。

   ![Perspective and orthographic diagram](media/perspective-orthographic-diagram.png)

   ![Perspective and orthographic views](media/perspective-and-orthographic-views.png)

また、カメラが自分を向いているときに**ビュー カメラ ギズモ**をクリックすることによって、透視投影ビューと正投影ビューを切り替えることもできます。

<video controls autoplay loop height="240" width="320">
              <source src="media/navigate-in-scene-switch-projection-mode.mp4" type="video/mp4">
</video>

#### 視野

カメラの視野を変更できます。カメラの錐台が変化し、シーンのズームインとズームアウトの効果があります。高い値 (90 以上) に設定すると、引き延ばされた「魚眼レンズ」ビューになります。既定の設定は 45 です。

#### 近平面と遠平面

**近平面**は、Game Studio がシーンのレンダリングを開始するポイントです。既定の設定は 0.1 です。

**遠平面**は、描画距離とも呼ばれ、それを超えると Game Studio がシーンのレンダリングを止めるポイントです。既定の設定は 1000 です。

Game Studio は、近平面と円平面の間の領域をレンダリングします。

![Camera position](../get-started/media/camera-position.png)

## 関連項目

* [シーンを作成して開く](create-a-scene.md)
* [シーンをロードする](load-scenes.md)
* [エンティティを追加する](add-entities.md)
* [エンティティを管理する](manage-entities.md)
