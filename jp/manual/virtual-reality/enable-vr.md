# VR を有効にする

ここでは、Oculus Rift および Vive デバイスのサポートをゲームに追加する方法を説明します。他のデバイスは、近日中にサポートされるようになります。

1. [Asset view] (既定では下部のペイン) で、[Graphics Compositor] をダブルクリックします。

    ![Graphics compositor asset](../graphics/graphics-compositor/media/graphics-compositor-asset.png)

    Graphics Compositor エディターが開きます。

2. Graphics Compositor で、[ForwardRenderer] ノードを開きます。

    ![Select forward renderer](media/select-forward-renderer.png)

3. [Property grid] (既定では右側) で、[VR Settings] を展開します。

    ![VR settings](media/vr-settings.png)

4. [Required Apis] の隣にある緑色のプラス アイコン ([Add a new item to the list]) をクリックします。

    新しい API がリストに追加されます。

    ![Add VR item](media/add-vr-api.png)

5. [Item] ドロップダウン メニューで、ゲームでサポートする VR API を選択します。必要なだけいくつでも追加できます。

    | API    | 説明
    |--------|  --------
    | Oculus | Oculus Rift デバイスをサポートします (Oculus Rift の最善のサポート)
    | OpenVR | Vive デバイスと Oculus Rift デバイスをサポートします (Vive の最善のサポート)
    | Dummy  | VR デバイスではなく、2 つの「アイ カメラ」で画面にゲームを表示します (主として、開発に役立ちます)。Game Studio のシーン エディターでダミー ビューを表示するには、エディターがフォワード レンダラーに接続されていることを確認します。

6. リストの順序が正しいことを確認します。

    ゲームは、実行時に、リストの順序でデバイスを使用しようとします。たとえば、最初の項目が Dummy の場合、ゲームは VR デバイスを使用しません。最後の項目が Dummy の場合、ゲームは使用できる VR デバイスがない場合にのみ Dummy を使用します。

    >[!TIP]
    >OpenVR API は Vive デバイスと Oculus Rift デバイスの両方をサポートしますが、Oculus API は Oculus Rift のサポートの方が優れています。このため、リストの順序を次のようにすることをお勧めします。
    >
    >* 項目 0: Oculus
    >
    >* 項目 1: OpenVR
    >
    >このようにすると、ゲームは、Oculus Rift デバイスが接続されている場合は Oculus API を使用し、別のデバイス (Vive など) が接続されている場合は OpenVR API を使用します。

7. [VRRendererSettings] を有効にします。

    ![VR renderer settings](media/vr-renderer-settings.png)

これで、ゲームは VR を使用できる状態になりました。

>[!NOTE]
>API を変更した後、実行時に変更を有効にするには、プロジェクトを再ロードする必要があります ([File] > [Reload project])。これは既知の問題であり、将来のリリースで解決されます。

## VR のプロパティ

| プロパティ             | 説明      
|----------------------|--------
| Ignore Camera Rotation  | VR デバイス以外の入力によるカメラの移動を無効にします。[VR 酔い](vr-sickness.md)を軽減するのに役立ちます。   
| Resolution Scale | VR デバイスに表示される画像の解像度です。解像度が高いほど高品質の画像が生成されますが、より多くの CPU が必要になります。

## マルチサンプル アンチエイリアシング

エイリアシング アーティファクトは、VR ではいっそう顕著になるので、ForwardRenderer のプロパティ (VR の設定の下) で **MSAA** (マルチサンプル アンチエイリアシング) を有効にすることをお勧めします。

![MSAA](media/MSAA.png)
