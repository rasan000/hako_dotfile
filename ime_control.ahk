#Requires AutoHotkey v2.0

; backspace
$^h::
{
    Send "{Backspace}"
}


vk1C:: {
    Send "{vk1C}"
}

; key to move 
vk1C & n::Send "{Blind}{Home}"
vk1C & m::Send "{Blind}{PgDn}"
vk1C & ,::Send "{Blind}{PgUp}"
vk1C & .::Send "{Blind}{End}"
vk1C & h::Send "{Blind}{Left}"
vk1C & j::Send "{Blind}{Down}"
vk1C & k::Send "{Blind}{Up}"
vk1C & l::Send "{Blind}{Right}"

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
vk1D & m::Send "{NumPad0}"
vk1D & 0::Send "{Backspace}"
vk1D & `;::Send "{NumPadAdd}"
vk1D & p::Send "{NumPadSub}"
vk1D & y::Send "{NumPadDiv}"
vk1D & h::Send "{NumPadMult}"
