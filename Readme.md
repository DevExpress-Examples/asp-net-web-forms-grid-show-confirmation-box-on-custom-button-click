# How to show the Deleting Confirmation box after performing some server-side actions


<p>This example demonstrates how you can perform some server-side actions when a user clicks the "Delete" command button, and then show the Deleting confirmation PopupControl.</p>
<br>
<p>Use a <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewGridViewCommandColumn_CustomButtonstopic"><u>custom command button</u></a> to create a custom Delete link. Handle the server-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_CustomButtonCallbacktopic"><u>ASPxGridView.CustomButtonCallback</u></a> event to perform server-side actions when the Delete button is clicked. Use <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxEditorsASPxButton_JSPropertiestopic"><u>ASPxGridView.JSProperties</u></a> to pass values from the server side to the client. I have used the "cpShowDeleteConfirmBox" JSPropety to indicate if it is necessary to show the confirmation popup on the client when the grid's callback ends. The "cpRowIndex" JSProperty is used to pass the deleting row index from the server-side ASPxGridView.CustomButtonCallback event handler to the client.</p>
<br>
<p>The <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_RowDeletingtopic"><u>ASPxGridView.RowDeleting</u></a> event is used for custom row deleting. It is not necessary to handle it if you are using the standard DataSourse deleting functionality.</p>

<br/>

