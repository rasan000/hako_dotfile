#Requires AutoHotkey v2.0

; windows側のstartupフォルダにコピーして使ってください

; backspace
$^h::
{
    Send "{Backspace}"
}

; https://scrapbox.io/koji-loilo/ESC%E3%82%92%E6%8A%BC%E3%81%97%E3%81%9F%E3%81%A8%E3%81%8D%E3%81%ABAutoHotkey%E3%81%A7IME%E3%82%92%E8%87%AA%E5%8B%95%E3%81%A7%E3%82%AA%E3%83%95%E3%81%AB%E3%81%99%E3%82%8B(Windows)
; ──────────────────────────────────────────────
; IMEを明示的にON/OFFする関数
;   isOn := 0  → IME OFF（英数）
;   isOn := 1  → IME ON（ひらがな）
; WinTitle := "A"  → アクティブウィンドウが対象
; ──────────────────────────────────────────────
IME_SET(isOn := 0, WinTitle := "A") {
    hwnd := WinGetID(WinTitle)
    if !hwnd
        return

    ; ImmGetDefaultIMEWnd で IMEウィンドウのハンドルを取得
    ctl := DllCall("imm32\ImmGetDefaultIMEWnd", "Ptr", hwnd, "Ptr")
    if !ctl
        return

    WM_IME_CONTROL     := 0x283
    IMC_SETOPENSTATUS  := 0x006

    ; SendMessage( IMEウィンドウ, WM_IME_CONTROL, IMC_SETOPENSTATUS, isOn )
    ; isOn = 0 → IME OFF,  isOn = 1 → IME ON
    DllCall("SendMessage", "Ptr", ctl
                           , "UInt", WM_IME_CONTROL
                           , "Ptr",  IMC_SETOPENSTATUS
                           , "Ptr",  isOn)
}

; ──────────────────────────────────────────────
; Escキーで「IMEをオフ」にしてから、Esc本来の動作を行う
; ──────────────────────────────────────────────
Esc:: {
    IME_SET(0)             ; 0でIMEをOFFにする
    Hotkey("Esc", "Off")   ; 一時的にホットキーを無効化（再帰ループ防止）
    Send("{Esc}")          ; Esc本来の動作を送信
    Hotkey("Esc", "On")    ; ホットキーを再度有効化
}
