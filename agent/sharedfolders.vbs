' This script was written to list all shared folders on a computer for OCS Invetory
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colShares = objWMIService.ExecQuery("Select * from Win32_Share")
For each objShare in colShares
    If objShare.Type = 0 Or objShare.Type = -2147483648 Then
    	Wscript.Echo _
		"<SHAREDFOLDERS>" & vbCrLf & _
    	"  <SHARENAME>" &  objShare.Name & "</SHARENAME>" & vbCrLf & _
    	"  <SHAREPATH>" &  objShare.Path & "</SHAREPATH>"
    	If objShare.Type = 0 Then
    		Wscript.Echo "  <SHARETYPE>User</SHARETYPE>"
    	Else
    		Wscript.Echo "  <SHARETYPE>Admin</SHARETYPE>"
    	End If
     	Wscript.Echo _
		"  <SHAREDESC>" &  objShare.Description & "</SHAREDESC>" & vbCrLf & _
    	"</SHAREDFOLDERS>"
  End If
Next