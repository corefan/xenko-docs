# マウス

<span class="label label-doc-level">初級</span>
<span class="label label-doc-audience">プログラマー</span>

**マウス**は、デスクトップ ゲームでよく使われる入力デバイスです。

Xenko にはマウス入力を処理する 2 つの方法があります。

* **マウスのボタンの状態**を問い合わせます。
* モバイル デバイスを対象とするクロスプラットフォーム ゲームの場合は、[PointerEvent](xref:SiliconStudio.Xenko.Input.PointerEvent) のリストを使用できます。
詳細については、「[ポインター](pointers.md)」を参照してください。

**マウス ボタンの状態**と**ポインター イベントのリスト**には、[入力マネージャー](xref:SiliconStudio.Xenko.Input.InputManager)からアクセスできます。

| クラス | プロジェクトの種類 | 使用目的 |
| --- | --- | --- |
| [Input](xref:SiliconStudio.Xenko.Input.InputManager) | デスクトップのみ | デスクトップ ゲームの場合、通常、複数のマウス ボタンでの入力を処理します。つまり、**マウス ボタンの状態**を使用する必要があります。 |
| [PointerEvent](xref:SiliconStudio.Xenko.Input.PointerEvent) | クロスプラットフォーム | モバイル ゲームの場合、通常、左マウス ボタンだけでポインターをシミュレートします。つまり、マウス入力をポインターのように処理できます。マウス固有のコントロールを別に作成する必要はありません。詳細については、「[ポインター](pointers.md)」を参照してください。|

これらのオプションの詳細については、「[入力](index.md)」を参照してください。

## マウスを使用できるかどうかを調べる
マウスの入力を処理する前に、[Input.HasMouse](xref:SiliconStudio.Xenko.Input.InputManager.HasMouse) を使用して、マウスが接続されているかどうかを確認します。

> [!NOTE]
> Xenko では、実行中に接続されたマウスはサポートされません。この機能は将来のリリースで追加されます。

## マウスの位置を問い合わせる

[MousePosition](xref:SiliconStudio.Xenko.Input.InputManager.MousePosition) は、マウス ポインターの位置を決定する X 座標と Y 座標を返します。値は 0 ～ 1 の範囲です (正規化された値)。

* (0,0): ポインターは画面の左上隅にあります。
* (1,1): ポインターは画面の右下隅にあります。

> [!NOTE]
> Xenko では、画面の実際のピクセル サイズではなく、正規化された座標が使用されます。そのため、ポインターの位置は任意の解像度に合わせて調整され、異なる解像度ごとに異なるコードを作成する必要はありません。

## マウス ボタンの状態変化を問い合わせる

マウス ボタンを使用してプロジェクトのアクションをトリガーできます。たとえば、ファーストパーソン シューティング ゲームでは、通常、左端のボタンが射撃に使用されます。

[入力マネージャー](xref:SiliconStudio.Xenko.Input.InputManager)には、マウス ボタンの状態 (_押された_、_押されている_、_放された_) を調べる複数のメソッドがあります。

| メソッド | 説明 |
| --- | --- |
| [HasDownMouseButtons()](xref:SiliconStudio.Xenko.Input.InputManager.HasDownMouseButtons) | 1 つ以上のマウス ボタンが現在押されているかどうかを調べます。 |
| [HasPressedMouseButtons()](xref:SiliconStudio.Xenko.Input.InputManager.HasPressedMouseButtons) | 1 つ以上のマウス ボタンが最後の更新で押されたかどうかを調べます。 |
| [HasReleasedMouseButtons()](xref:SiliconStudio.Xenko.Input.InputManager.HasReleasedMouseButtons) | 1 つ以上のマウス ボタンが最後の更新で放されたかどうかを調べます。 |
| [IsMouseButtonDown (MouseButton)](xref:SiliconStudio.Xenko.Input.InputManager.IsMouseButtonDown\(SiliconStudio.Xenko.Input.MouseButton\)) | 指定されたマウス ボタンが現在押されているかどうかを調べます。 |
| [IsMouseButtonPressed (MouseButton)](xref:SiliconStudio.Xenko.Input.InputManager.IsMouseButtonPressed\(SiliconStudio.Xenko.Input.MouseButton\)) | 指定されたマウス ボタンが最後の更新で押されたかどうかを調べます。 |
| [IsMouseButtonReleased (MouseButton)](xref:SiliconStudio.Xenko.Input.InputManager.IsMouseButtonReleased\(SiliconStudio.Xenko.Input.MouseButton\)) | 指定されたマウス ボタンが最後の更新で放されたかどうかを調べます。 |

### マウスのデルタ

最後の更新以降のマウス位置の変化を正規化された座標で取得するには、[MouseDelta](xref:SiliconStudio.Xenko.Input.InputManager.MouseDelta) を使用します。これを使用して、マウスの移動の速度と方向を分析できます。

### マウス ホイールのデルタ

マウス ホイールを使用してプロジェクトのアクションをトリガーできます。たとえば、ファーストパーソン シューティング ゲームでは、マウス ホイールを動かすことで、武器を切り替えたり、カメラをズームしたりする場合があります。

[MouseWheelDelta](xref:SiliconStudio.Xenko.Input.InputManager.MouseWheelDelta) は、マウス ホイールが前方に回されると正の値を、後方に回されると負の値を返します。値 `0` は、動きがないことを示します。

> [!NOTE]
> 既定では、[MouseWheelDelta](xref:SiliconStudio.Xenko.Input.InputManager.MouseWheelDelta) は 120*X を返します。X は、最後の更新の間に回されたホイール ステップの量です。

## マウスの位置をロックする

プロジェクトによっては、ユーザーが画面の境界を越えてマウス カーソルを移動する必要がある場合があります。たとえば、ファーストパーソン シューティング ゲームでは、通常、カメラを 360 度回転させる必要があります。そのような場合はおそらく、マウス カーソルを非表示にする必要もあります。

以下のプロパティとメソッドを使用すると、マウスの位置をロックし、カーソルを非表示にすることができます。

| メソッド/プロパティ | 説明 |
| --- | --- |
| [LockMousePosition(Boolean)](xref:SiliconStudio.Xenko.Input.InputManager.LockMousePosition\(System.Boolean\)) | 次に [UnlockMousePosition()](xref:SiliconStudio.Xenko.Input.InputManager.UnlockMousePosition) メソッドを呼び出すまで、マウスの位置をロックし、カーソルを非表示にします。 |
| [UnlockMousePosition()](xref:SiliconStudio.Xenko.Input.InputManager.UnlockMousePosition) | [LockMousePosition(Boolean)](xref:SiliconStudio.Xenko.Input.InputManager.LockMousePosition\(System.Boolean\)) メソッドによってロックされたマウス位置をロック解除し、カーソルの表示を元に戻します。 |
| [IsMousePositionLocked](xref:SiliconStudio.Xenko.Input.InputManager.IsMousePositionLocked) | マウスの位置がロックされているかどうかを調べます。 |

> [!TIP]
> マウスの表示は、[GameWindow.IsMouseVisible](xref:SiliconStudio.Xenko.Games.GameWindow.IsMouseVisible) で取得または設定できます。

## コード例

```
public class MouseInputScript : SyncScript
{
	public override void Update()
	{
		// この更新で左マウス ボタンが押されている場合、処理を行う。
		if (Input.IsMouseButtonDown(MouseButton.Left))
		{   
		}
		// 最後の更新以降に中央マウス ボタンが押された場合、処理を行う。
		if (Input.IsMouseButtonPressed(MouseButton.Middle))
		{  
		}

		// マウスが X 方向に画面サイズで 0.2 単位より大きく動いた場合、処理を行う。
		if (Input.MouseDelta.X > 0.2f)
		{
		}

	}
}
```
## 関連項目
* [ポインター](pointers.md)
* [仮想ボタン](virtual-buttons.md)
* [キーボード](keyboards.md)
* [ゲームパッド](gamepads.md)
* [入力の概要](index.md)
