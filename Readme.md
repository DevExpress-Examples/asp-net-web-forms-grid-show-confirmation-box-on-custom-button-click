# Grid View for ASP.NET Web Forms - How to show a confirmation dialog box on a custom button click
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4126/)**
<!-- run online end -->

This example demonstrates how to create a custom **Delete** button and show a confirmation pop-up window on a button click.

## Overview

Follow the steps below to configure the grid's confirm functionality:

1. Use a command column's [CustomButtons](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewCommandColumn.CustomButtons) property to create a custom **Delete** button.

    ```aspx
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True">
            <CustomButtons>
                <dx:GridViewCommandColumnCustomButton ID="btDelete" Text="Delete"
                    Visibility="AllDataRows" />
            </CustomButtons>
        </dx:GridViewCommandColumn>
        <!-- ... -->
    ```

2. Handle the grid's server-side [CustomButtonCallback](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.CustomButtonCallback) event to perform server-side actions on a custom button click. Use the grid's [JSProperties](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridBase.JSProperties) property to pass the row's visible index to the server and indicate whether to show a confirmation pop-up window when the callback ends.

    ```js
    function gvProducts_EndCallback(s, e) {
        if (s.cpShowDeleteConfirmBox)
            pcConfirm.Show();
    }
    ```

    ```csharp
    protected void gvProducts_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e) {
        ASPxGridView gridView = sender as ASPxGridView;
        if (e.ButtonID == "btDelete") {

            // Perform custom server-side actions before showing a pop-up window

            gridView.JSProperties["cpRowIndex"] = e.VisibleIndex;
            gridView.JSProperties["cpShowDeleteConfirmBox"] = true;
        }
    }
    ```

3. To configure the grid's row delete functionality, handle the grid's server-side [RowDeleting](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.RowDeleting) event.

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))

## Documentation

* [Passing Values Between Client and Server Sides](https://docs.devexpress.com/AspNet/11816/common-concepts/client-side-functionality/passing-values-between-client-and-server-sides)
* [Update a Control on Another Contol's Callback](https://docs.devexpress.com/AspNet/402219/common-concepts/callbacks/update-control-in-callback-of-another-control)
