Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.Data

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub gvProducts_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
		gridView.JSProperties("cpShowDeleteConfirmBox") = False
	End Sub

	Protected Sub gvProducts_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs)
		Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
		If e.ButtonID = "btDelete" Then

			'Server-side actions performed before showing popup here

			gridView.JSProperties("cpRowIndex") = e.VisibleIndex
			gridView.JSProperties("cpShowDeleteConfirmBox") = True
		End If
	End Sub

	Protected Sub gvProducts_RowDeleting(ByVal sender As Object, ByVal e As ASPxDataDeletingEventArgs)

		'Custom row deleting code here
		Throw New Exception("Data modifications are not allowed.")

		e.Cancel = True
	End Sub
End Class