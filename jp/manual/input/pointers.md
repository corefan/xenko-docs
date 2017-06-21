# ポインター

<span class="label label-doc-level">初級</span>
<span class="label label-doc-audience">プログラマー</span>

**ポインター**は、**指のタッチ**に対応するデバイス画面上の点です。マルチタッチ機能のあるデバイスでは、同時に複数のポインターがサポートされます。

デスクトップ プラットフォームでは、左マウス ボタンを使用してポインターをシミュレートできます。マウス入力の詳細については、「[マウス](mouse.md)」を参照してください。

## Xenko によるポインター入力の処理方法

1. ユーザーが、画面をタッチするか、左マウス ボタンをクリックします。
2. Xenko が、ポインターを作成します。
3. Xenko が、特定の指に対応するそのポインターに**ポインター ID** を割り当てます。
4. ポインターが変更されるたびに、Xenko はそのポインターで新しい**ポインター イベント**を作成します。
5. 新しい指ごとに、Xenko は新しいポインター ID で新しいポインターを作成します。

> [!NOTE]
> ポインター イベントは発生順に列記されます。

> [!NOTE]
> 各ポインター イベントには、1 つのポインターだけについての情報が含まれます。複数のポインターが同じ更新で同時に変更された場合、ポインターごとに異なるイベントが作成されます。

> [!WARNING]
> ポインターの変更の処理は、OS ごとに異なります。つまり、指の同じジェスチャでも、プラットフォームが異なると、若干異なるポインター イベント シーケンスが生成されることがあります。たとえば、Android では、指が画面にタッチしても、動いていない場合は、新しいポインター イベントは作成されません。
詳細については、OS のドキュメントを参照してください。

ジェスチャの認識を有効にして、長押しやタップなどのジェスチャを検出できます。詳細については、「[ジェスチャ](gestures.md)」を参照してください。

## マルチタッチ
マルチタッチが有効な場合、複数の指に対してイベントがトリガーされます。無効になっている場合は、画面にタッチした最初の指に対してのみイベントがトリガーされます。マルチタッチは既定で有効になります。

**マルチタッチ**を有効にするには、[MultiTouchEnabled](xref:SiliconStudio.Xenko.Input.InputManager.MultiTouchEnabled) を使用します。

## PointerEvent クラス

[PointerEvent](xref:SiliconStudio.Xenko.Input.PointerEvent) は、ポインターのイベントを報告します。イベントには、現在の**ポインターの位置**と時刻の情報が含まれます。**ポインター**が変更されるたびにスローされます。

最後の更新以降の**ポインター イベント**のリストには、
[PointerEvents](xref:SiliconStudio.Xenko.Input.InputManager.PointerEvents) を使用してアクセスできます。リストは更新のたびにクリアされるので、手動でクリアする必要はありません。フレーム ターンの間に分析されなかったポインター イベントは失われます。

### ポインターの情報を取得する

以下のプロパティを使用して、イベントをトリガーしたポインターに関する情報を取得できます。

|プロパティ | 説明|
|--------|-----------|
|[PointerEvent.IsPrimary](xref:SiliconStudio.Xenko.Input.PointerEvent.IsPrimary)| イベントをトリガーしたポインターが画面にタッチした最初の指であったかどうかを示します。 |
|[PointerEvent.PointerType](xref:SiliconStudio.Xenko.Input.PointerEvent.PointerType) | イベントをトリガーしたポインターが_マウス_からシミュレートされたものか、または実際の_タッチ_であったかを示します。 |
|[PointerEvent.PointerId](xref:SiliconStudio.Xenko.Input.PointerEvent.PointerId) | イベントをトリガーしたポインターの ID を示します。 |

> [!WARNING]
> ポインターの ID は、ポインター イベントの 1 回の _Down->Move->Up_ のシーケンスの間だけ有効です。
> 同じ指でも、画面にタッチするたびに ID が異なる場合があります (非常にすばやく行われた場合であっても)。

> [!WARNING]
> ポインターに ID を割り当てる方法は、OS ごとに異なります。
> ポインター ID の値と対応する指の間に関係はありません。

### ポインターの位置を取得する

[PointerEvent.Position](xref:SiliconStudio.Xenko.Input.PointerEvent.Position) は、ポインターの位置を決定する X 座標と Y 座標を返します。値は 0 ～ 1 の範囲です (正規化された値)。次に例を示します。

* (0,0): ポインターは画面の左上隅にあります。
* (1,1): ポインターは画面の右下隅にあります。

> [!NOTE]
> Xenko では、画面の実際のピクセル サイズではなく、正規化された座標が使用されます。そのため、ポインターの位置は任意の解像度に合わせて調整され、異なる解像度ごとに異なるコードを作成する必要はありません。

### ポインター イベントを取得する

ポインター イベントを調べるには、[PointerEvent.State](xref:SiliconStudio.Xenko.Input.PointerEvent.State) を使用します。このメソッドは、[PointerState](xref:SiliconStudio.Xenko.Input.PointerState) 内の値を返します。

Xenko は、5 種類のイベントを認識します。

* _Down_: 指が画面にタッチしました。
* _Move_: 指が画面に沿って移動しました。
* _Up_: 指が画面を離れました。
* _Out_: 指がタッチ領域から外に出ました。
* _Cancel_: ポインター シーケンスがキャンセルされました。このイベントは、たとえば電話の着信によって電話アプリが割り込まれた場合など、アプリケーションが中断されたときに発生します。

> [!NOTE]
> 1 つのポインターに対するポインター イベントのシーケンスは、常に _Down_ イベントで開始します。その後で 1 つ以上の _Move_ イベントが発生する可能性があり、常に _Up_、_Out_、または _Cancel_ イベントで終了します。

### デルタ値を取得する

特定のポインター ID に対する前回の [PointerEvent](xref:SiliconStudio.Xenko.Input.PointerEvent) からの経過時間を取得するには、[PointerEvent.DeltaTime](xref:SiliconStudio.Xenko.Input.PointerEvent.DeltaTime) を使用します。

特定のポインター ID に対する前回の [PointerEvent](xref:SiliconStudio.Xenko.Input.PointerEvent) 以降の位置変化を取得するには、[PointerEvent.DeltaPosition](xref:SiliconStudio.Xenko.Input.PointerEvent.DeltaPosition) を使用します。

> [!NOTE]
> ポインター イベントのシーケンスの開始時には (つまり、**ポインターの状態**が _Down_ のとき)、デルタ値は常に null になっています。

## コード例

このスクリプトは、ポインターの動きを追跡して、その位置を表示します。

```
public override async Task Execute()
{
	var pointerPositions = new Dictionary<int, Vector2>();
	while (true)
	{
		await Scheduler.NextFrame();
		foreach (var pointerEvent in Input.PointerEvents)
		{
			switch (pointerEvent.State)
			{
				case PointerState.Down:
					pointerPositions[pointerEvent.PointerId] = pointerEvent.Position;
					break;
				case PointerState.Move:
					pointerPositions[pointerEvent.PointerId] = pointerEvent.Position;
					break;
				case PointerState.Up:
				case PointerState.Out:
				case PointerState.Cancel:
					pointerPositions.Remove(pointerEvent.PointerId);
					break;
				default:
					throw new ArgumentOutOfRangeException();
			}
		}
		var positionsStr = pointerPositions.Values.Aggregate("", (current, pointer) => current + (pointer.ToString() + ", "));
		logger.Info("There are currently {0} pointers on the screen located at {1}", pointerPositions.Count, positionsStr);
	}
}
```

## 関連項目
* [ジェスチャ](gestures.md)
* [マウス](mouse.md)
* [仮想ボタン](virtual-buttons.md)
* [入力の概要](index.md)
