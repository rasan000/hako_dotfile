; backspace
$^h::
{
    Send "{Backspace}"
}

; zenhan to esc and muhenkan 
sc029:: {
    Send "{Esc}{vk1D}"
}
$Esc:: {
    Send "{Esc}{vk1D}"
}

; Space with timeout control
Space::
{
    if KeyWait("Space", "T0")  ; no timeout
        Send "{Space}"  ; single press
    ; if timeout occurs, do nothing (combination key was pressed)
}
^Space::Send("^{Space}")
+Space::Send("+{Space}")
^+Space::Send("^+{Space}")

; key to move 
Space & n::Send "{Blind}{Home}"
Space & m::Send "{Blind}{PgDn}"
Space & ,::Send "{Blind}{PgUp}"
Space & .::Send "{Blind}{End}"
Space & h::Send "{Blind}{Left}"
Space & j::Send "{Blind}{Down}"
Space & k::Send "{Blind}{Up}"
Space & l::Send "{Blind}{Right}"

; key to function
Space & 1::Send "{F1}"
Space & 2::Send "{F2}"
Space & 3::Send "{F3}"
Space & 4::Send "{F4}"
Space & 5::Send "{F5}"
Space & 6::Send "{F6}"
Space & 7::Send "{F7}"
Space & 8::Send "{F8}"
Space & 9::Send "{F10}"
Space & 0::Send "{F10}"
Space & -::Send "{F11}"
Space & =::Send "{F12}"

; key to num
Space & q::Send "{Blind}1"
Space & w::Send "{Blind}2"
Space & e::Send "{Blind}3"
Space & r::Send "{Blind}4"
Space & t::Send "{Blind}5"
Space & y::Send "{Blind}6"
Space & u::Send "{Blind}7"
Space & i::Send "{Blind}8"
Space & o::Send "{Blind}9"
Space & p::Send "{Blind}0"

; send muenkan
vk1D:: {
    Send "{vk1D}"
}
; key to numpad
vk1D & n::Send "{NumLock}"
vk1D & j::Send "{NumPad1}"
vk1D & k::Send "{NumPad2}"
vk1D & l::Send "{NumPad3}"
vk1D & u::Send "{NumPad4}"
vk1D & i::Send "{NumPad5}"
vk1D & o::Send "{NumPad6}"
vk1D & 7::Send "{NumPad7}"
vk1D & 8::Send "{NumPad8}"
vk1D & 9::Send "{NumPad9}"
vk1D & 0::Send "{Backspace}"
vk1D & `;::Send "{NumPadAdd}"
vk1D & p::Send "{NumPadSub}"
vk1D & y::Send "{NumPadDiv}"
vk1D & h::Send "{NumPadMult}"
