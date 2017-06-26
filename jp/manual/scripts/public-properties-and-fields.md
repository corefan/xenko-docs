# パブリック プロパティとフィールド

<span class="label label-doc-level">初級</span>
<span class="label label-doc-audience">プログラマー</span>

スクリプトでパブリック プロパティまたはパブリック フィールドを宣言すると、そのプロパティは Game Studio 内でスクリプト コンポーネント プロパティからアクセスできるようになります。

![Property in Game Studio](media/property-shown-in-game-studio.png)

同じスクリプトを複数のエンティティにアタッチし、エンティティごとに異なるプロパティ値を設定できます。

> [!NOTE]
> パブリック プロパティまたはフィールドを Game Studio で使用するには、シリアル化可能である必要があります。

## パブリック プロパティまたはフィールドを追加する

次のスクリプトにはパブリック プロパティ (`DelayTimeOut`) があります。

```cs
public class SampleSyncScript : StartupScript
{
	// このパブリック メンバーは Game Studio に表示されます
	public float DelayTimeOut { get; set; }
}
```

`DelayTimeOut` プロパティはスクリプト コンポーネントのプロパティに表示されます。

![Public property appears in the property grid](media/scripts-in-xenko-change-value-public-property.png)

>[!NOTE]
>原則として、Game Studio でプロパティまたはフィールドを表示したい場合、ゲッターおよびセッターは可能な限り何も行わないようにする必要があります。たとえば、メソッドを呼び出したり、Xenko のランタイム API にアクセスしたりしないようにする必要があります。

>以下のコードは、実行時にのみ使用できる `Entity.Components` にアクセスしようとしているため、問題になります。

>```cs
>public class SampleSyncScript : StartupScript
>{
>	private float delayTimeOut;
>	// このパブリック メンバーは Game Studio に表示される
>	public float DelayTimeOut
>	{
>		get { return delayTimeOut; }
>		set
>		{
>			delayTimeOut = value;
>			Entity.Components.Add(new SkyboxComponent());
>		}
>	}
>}
>```
>このようなコードをプロパティまたはフィールドに組み込む場合は、Game Studio がそれを表示しないように非表示にします (後述を参照)。

## 属性

パブリック プロパティおよびフィールドを宣言するときは、ユーザーが Game Studio の［Property grid］でそれを編集する方法を、属性を使用して変更できます。

スクリプトで宣言するパブリック クラスの上に、属性を追加します。次に例を示します。

```cs
        [DataMember]
        [DataMemberRange(-10, 10, 0.1f, 1f)]
        [Display(category: "Simple Properties")]
        [DefaultValue(2.0f)]
        public float Float { get; set; } = 2.0f;
```

### DataMember

[DataMember](https://msdn.microsoft.com/en-us/library/system.runtime.serialization.datamemberattribute)

### DataMemberRange

[DataMemberRange](xref:SiliconStudio.Core.Annotations.DataMemberRangeAttribute) は、［Property grid］で設定できる値の範囲を指定します。

```cs
        [DataMember]
        [DataMemberRange(-10, 10, 1, 2)]
        public int Integer { get; set; }
```

* 最初の値は最小値を指定します。
* 2 番目の値は最大値を指定します。
* 3 番目の値は値が増減するときの刻みを指定します。
* **4 番目の値は謎です。幸運を祈ります。**

### DataMemberIgnore

[DataMemberIgnore](xref:SiliconStudio.Core.DataMemberIgnoreAttribute) は、［Property grid］の値を非表示にします。

```cs
	// このパブリック プロパティは Game Studio では使用できない
	［DataMemberIgnore］
	public float DelayTimeOut { get; set; }
```

Game Studio には［Property grid］のプロパティが表示されなくなります。

!［パブリック プロパティは ```[DataMemberIgnore］``` で非表示になっている](media/scripts-in-xenko-public-property-with-datamemberignore.png)

### DefaultValue

[Default value](https://msdn.microsoft.com/en-us/library/system.componentmodel.defaultvalueattribute) は、プロパティの既定値を設定します。

>[!NOTE]
>``DefaultValue`` 属性とクラス宣言の後の両方で、これを指定する必要があります。

```cs
        [DefaultValue(2.0f)]
        public float Float { get; set; } = 2.0f;
```

### Display

[Class DisplayAttribute](xref:SiliconStudio.Core.DisplayAttribute) は、［Property grid］のプロパティ ラベルを変更します。

```cs
        [Display("My Property")]
        public double Double { get; set; }
```

![My-Property](media/my-property.png)

下に表示されるプロパティの展開可能なカテゴリも指定できます。

```cs
        [Display("My Property", "My Category")]
        public double Double { get; set; }
```

![My-Property-My-Category](media/my-property-my-category.png)

名前を指定しないでカテゴリにプロパティを含めたい場合は、``［Display(category: "My Category")］`` を使用します。次に例を示します。

```cs
        [Display(category: "My Category")]
        public double Double { get; set; }
```

### CategoryOrder

既定では、［Property grid］にはスクリプトと同じ順序でプロパティが表示されます。[CategoryOrder](xref:SiliconStudio.Core.Annotations.CategoryOrderAttribute) を使用して順序を変更できます。

小さい値のカテゴリが先に表示されます。負の値も使用できます。

```cs
    [CategoryOrder(1, "List 1")]
    [CategoryOrder(2, "List 2")]
    [CategoryOrder(3, "List 3")]
    public class MyScript : StartupScript
```

![Category order](media/category-order.png)

同じ値のカテゴリが複数ある場合は、アルファベット順に表示されます。

### MemberCollection

[MemberCollection](xref:SiliconStudio.Core.Annotations.MemberCollectionAttribute) は、ユーザーがリストの項目と対話する方法を変更します。

```cs
        [DataMember]
        [MemberCollection(ReadOnly = false, NotNullItems = true, CanReorderItems = true)]
        [Display(category: "List 2")]
        public List<int> ReadonlyIntegerList { get; set; } = new List<int> { 0, 1, 2, 3, 4 };
```

| プロパティ        | 説明                                                                                     |
|-----------------|-------------------------------------------------------------------------------------------------|
| CanReorderItems | `true` の場合は、ドラッグ アンド ドロップして［Property grid］内の項目の順序を変更できます。 |
| NotNullItems    | `true` の場合は、リストの項目を null にできません。                                                     |
| ReadOnly        | `true` の場合は、［Property grid］のリストの項目を追加または削除できません。                |

## 関連項目

* [スクリプトの種類](types-of-script.md)
* [スクリプトを作成する](create-a-script.md)
* [スクリプトを追加する](add-a-script.md)
* [スケジュール設定と優先順位](scheduling-and-priorities.md)
* [イベント](events.md)
* [デバッグ](debugging.md)
* [プリプロセッサ変数](preprocessor-variables.md)
