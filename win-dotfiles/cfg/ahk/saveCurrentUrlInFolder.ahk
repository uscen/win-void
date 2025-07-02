; # =============================================================================== #
; # Save current web url to pre-selected folder:                                    #
; # =============================================================================== #
; # Source:         mikeyww        https://www.autohotkey.com/boards/viewtopic.php?t=129379
; # Adapted from:   anonymous1184  https://gist.github.com/anonymous1184/7cce378c9dfdaf733cb3ca6df345b140
; # =============================================================================== #
!^s::{
    ;replace the following placeholder with the directory that should contain the links:
    ; # =============================================================================== #
    path := "C:\Users\lli\Favorites\"

    filename := RegExReplace(WinGetTitle("A"),'[>:\"\/\\|?]',"") ".url"          ;these characters are not allowed in file names
    url := getUrl()
    if (!url) {
        MsgBox("Couldn't retrieve an URL from the active window.", "Error")
        return
    }
    try
        FileAppend("[InternetShortcut]`nURL=" url, path filename)
    catch
        FileAppend("[InternetShortcut]`nURL=" url, path filename:=A_Now ".url")  ;if the regex doesn't cut it: file name is current time

    if FileExist(path filename)
        TrayTip('Saved link as `n"' filename '"')
}
; # =============================================================================== #
; # Get URL of the active Web browser window:                                       #
; # =============================================================================== #
getUrl() {
 Static TreeScope_Descendants     := 4
      , UIA_ControlTypePropertyId := 30003
      , UIA_DocumentControlTypeId := 50030
      , UIA_EditControlTypeId     := 50004
      , UIA_ValueValuePropertyId  := 30045
 IUIAutomation := ComObject('{FF48DBA4-60EF-4201-AA87-54103EEF594E}'
                          , '{30CBE57D-D9D0-452A-AB13-7AC5AC4825EE}')
 eRoot         := ComValue(13, 0)
 If HRESULT    := ComCall(6, IUIAutomation, 'Ptr', WinGetID('A'), 'Ptr*', eRoot)
  Throw Error('IUIAutomation::ElementFromHandle()', -1, HRESULT)
 ctrlTypeId    := WinGetClass('A') ~= 'Chrome' ? UIA_DocumentControlTypeId : UIA_EditControlTypeId
 value         := Buffer(8 + 2 * A_PtrSize, 0)
 NumPut('UShort', 3, value, 0), NumPut('Ptr', ctrlTypeId, value, 8)
 condition     := ComValue(13, 0)
 If HRESULT    := A_PtrSize = 8
  ? ComCall(23, IUIAutomation, 'UInt', UIA_ControlTypePropertyId, 'Ptr', value, 'Ptr*', condition)
  : ComCall(23, IUIAutomation
     , 'UInt'  , UIA_ControlTypePropertyId
     , 'UInt64', NumGet(value, 0, 'UInt64')
     , 'UInt64', NumGet(value, 8, 'UInt64')
     , 'Ptr*'  , condition
    )
  Throw Error('IUIAutomation::CreatePropertyCondition()', -1, HRESULT)
 eFirst := ComValue(13, 0)
 If HRESULT := ComCall(5, eRoot, 'UInt', TreeScope_Descendants, 'Ptr', condition, 'Ptr*', eFirst)
  Throw Error('IUIAutomationElement::GetRootElement()', -1, HRESULT)
 propertyValue := Buffer(8 + 2 * A_PtrSize)
 If HRESULT := ComCall(10, eFirst, 'UInt', UIA_ValueValuePropertyId, 'Ptr', propertyValue)
  Throw Error('IUIAutomationElement::GetCurrentPropertyValue()', -1, HRESULT)
 ObjRelease(eFirst.Ptr), ObjRelease(eRoot.Ptr)
 Try {
  pProperty := NumGet(propertyValue, 8, 'Ptr')
  Return StrGet(pProperty, 'UTF-16')
 }
}
