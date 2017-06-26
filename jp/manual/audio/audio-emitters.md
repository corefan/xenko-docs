# オーディオ エミッター

<span class="label label-doc-level">初級</span>
<span class="label label-doc-audience">プログラマー</span>
<span class="label label-doc-audience">デザイナー</span>

[オーディオ エミッター コンポーネント](xref:SiliconStudio.Xenko.Audio.AudioEmitter)は、[空間オーディオ](spatialized-audio.md)を作成するために使用されるオーディオを生成します。任意のエンティティにオーディオ エミッター コンポーネントを追加できます。

[オーディオ リスナー](audio-listeners.md)がオーディオ エミッターに近づいたり離れたりすると、サウンドのピッチとボリュームが変化します。

> [!NOTE]
オーディオ エミッターからのオーディオを聴くには、シーン内に少なくとも 1 つの [AudioListenerComponent](xref:SiliconStudio.Xenko.Audio.AudioListener) が必要です。

## 1. オーディオ エミッター アセットをセットアップする

1. **シーン エディター**で、オーディオ エミッターにするエンティティを選択します。

    ![Select an entity](media/audio-add-audiolistener-component-select-entity.png)

2.［Property grid］で［Add component］をクリックして、［Audio Emitter］を選択します。

    ![Add AudioEmitter Component](media/audio-add-audioemitter-component-select-entity.png)

    次に、サウンドをエミッターに追加する必要があります。

3.［Audio Emitter］で、緑のプラス記号アイコンをクリックして、サウンドの名前を指定します。

    ![Add New Sound Entry](media/audio-play-audioemitter-component-add-new-entry.png)

4.［Asset view］から、前のステップで追加したサウンドに、サウンド アセットをドラッグ アンド ドロップします。

    ![Drag and drop a sound asset](media/audio-play-drag-and-drop-audio-asset.gif)

    または、手のアイコンをクリックして、［Asset picker］を開きます。

    ![Pick up an asset](media/audio-play-audioemitter-component-pick-an-asset.png)

    サウンド アセットを選択します。

    ![Select sound asset](media/audio-play-audioemitter-component-add-select-audio-asset.png)

5. ステップ 3 と 4 を繰り返して、必要なサウンド アセットをすべて追加します。

## 2. オーディオを再生するスクリプトを作成する
次に、サウンド アセットの再生と構成を行うスクリプトを作成する必要があります。

1. スクリプトでは、使用する各サウンドに対して [AudioEmitterSoundController](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController) をインスタンス化する必要があります。

   たとえば、2 つのサウンド **MySound1** と **MySound2** がある場合は次のようになります。

	```cs
	AudioEmitterComponent audioEmitterComponent = Entity.Get<AudioEmitterComponent>();
	AudioEmitterSoundController mySound1Controller = audioEmitterComponent["MySound1"];
	AudioEmitterSoundController mySound2Controller = audioEmitterComponent["MySound2"];
	```

2. [AudioEmitterSoundController](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController) の次のプロパティとメソッドを使用して、オーディオを再生および構成します。

| プロパティ/メソッド | 説明 |
|-------    |-------|
| [IsLooping](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController.IsLooping) | オーディオをループします。[PlayAndForget()](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController.PlayAndForget) が true に設定されている場合は、何も行いません。|
| [Pitch](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController.Pitch)     | サウンドのピッチ (周波数) を取得または設定します。空間オーディオの場合は注意して使用する必要があります。 |
| [PlayState](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController.PlayState)	| オーディオ エミッター サウンド コントローラーの現在の状態を取得します。 |
| [Volume](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController.Volume)	| オーディオのボリュームです。 |
| [Pause()](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController.Pause)	| オーディオを一時停止します。 |
| [Play()](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController.Play)      | オーディオを再生します。 |
| [PlayAndForget()](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController.PlayAndForget)| オーディオを 1 回再生してから、メモリをクリアします。発砲音のような短いサウンドに便利です。[IsLooping](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController.IsLooping) をオーバーライドします。|
| [Stop()](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController.Stop)	| オーディオを停止します。 |

次に例を示します。

```
mySound2Controller.IsLooping = true;
mySound2Controller.Pitch = 2.0f;
mySound2Controller.Volume = 0.5f;
mySound2Controller.Play();
```

このサウンドは、元のサウンドの 2 倍のピッチと半分のボリュームでループします。詳細については、[AudioEmitterSoundController Xenko API のドキュメント](xref:SiliconStudio.Xenko.Audio.AudioEmitterSoundController)を参照してください。

## 3. オーディオ エミッター エンティティにスクリプトを追加する

Game Studio では、スクリプトは［Add component］の下にコンポーネントとして一覧表示されます。オーディオ エミッター エンティティにスクリプトを追加します。

## 関連項目
* [空間オーディオ](spatialized-audio.md)
* [オーディオ リスナー](audio-listeners.md)
* [グローバル オーディオ設定](global-audio-settings.md)
