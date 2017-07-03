# Full call stack not available

By default, when an exception is thrown, Visual Studio only shows the call stack from the Xenko runtime .DLL files, not user code.

To see more exceptions, add additional conditions to the Visual Studio **Exception Settings**.

1. In the Visual Studio toolbar, under the **Debug** menu, select **Windows > Exception Settings**. 

    ![Exception settings](media/exception-settings.png)

2. Expand **Common Language Runtime Exceptions** and select **All Common Language Runtime Exceptions not in this list**. You might need to select other conditions too.

    ![All common language runtime exceptions not in this list](media/all-common-language-runtime-exceptions.png)

>[!Tip]
>To restore the default list of exceptions, right-click and select **Restore Defaults**.