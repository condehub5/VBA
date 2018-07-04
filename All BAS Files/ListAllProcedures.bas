Attribute VB_Name = "ListAllProcedures"
Sub ListAllProc()
'In the VBE Editor set a reference to "Microsoft Visual Basic For Applications Extensibility 5.3" and to "Microsoft Scripting Runtime"

Dim objVBProj As VBProject
Dim objVBComp As VBComponent
Dim objVBCode As CodeModule
Dim strCurrent As String
Dim strPrevious As String
Dim x As Integer

Set objVBProj = ThisWorkbook.VBProject

For Each objVBComp In objVBProj.VBComponents
    If InStr(1, "1, 2", objVBComp.Type) Then
        Set objVBCode = objVBComp.CodeModule
        Debug.Print objVBComp.Name
            For x = objVBCode.CountOfDeclarationLines + 1 To objVBCode.CountOfLines
                strCurrent = objVBCode.ProcOfLine(x, vbext_pk_Proc)
                If strCurrent <> strPrevious Then
                    Debug.Print vbTab & objVBCode.ProcOfLine(x, vbext_pk_Proc)
                    strPrevious = strCurrent
                End If
            Next
    End If
Next

Set objVBCode = Nothing
Set objVBComp = Nothing
Set objVBProj = Nothing
End Sub
