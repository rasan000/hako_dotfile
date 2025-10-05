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

; key to move 
vk1C & n::Send "{Blind}{Home}"
vk1C & m::Send "{Blind}{PgDn}"
vk1C & ,::Send "{Blind}{PgUp}"
vk1C & .::Send "{Blind}{End}"
vk1C & h::Send "{Blind}{Left}"
vk1C & j::Send "{Blind}{Down}"
vk1C & k::Send "{Blind}{Up}"
vk1C & l::Send "{Blind}{Right}"

; key to function
vk1C & 1::Send "{F1}"
vk1C & 2::Send "{F2}"
vk1C & 3::Send "{F3}"
vk1C & 4::Send "{F4}"
vk1C & 5::Send "{F5}"
vk1C & 6::Send "{F6}"
vk1C & 7::Send "{F7}"
vk1C & 8::Send "{F8}"
vk1C & 9::Send "{F10}"
vk1C & 0::Send "{F10}"
vk1C & -::Send "{F11}"
vk1C & =::Send "{F12}"

; key to num
vk1C & q::Send "{Blind}1"
vk1C & w::Send "{Blind}2"
vk1C & e::Send "{Blind}3"
vk1C & r::Send "{Blind}4"
vk1C & t::Send "{Blind}5"
vk1C & y::Send "{Blind}6"
vk1C & u::Send "{Blind}7"
vk1C & i::Send "{Blind}8"
vk1C & o::Send "{Blind}9"
vk1C & p::Send "{Blind}0"

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
