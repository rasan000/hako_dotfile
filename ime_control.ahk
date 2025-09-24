; backspace
$^h::
{
    Send "{Backspace}"
}

; muhenkan(vk1D) numpad
vk1D & j::Send "{Numpad1}"
vk1D & k::Send "{Numpad2}" 
vk1D & l::Send "{Numpad3}"
vk1D & u::Send "{Numpad4}"
vk1D & i::Send "{Numpad5}"
vk1D & o::Send "{Numpad6}"
vk1D & 7::Send "{Numpad7}"
vk1D & 8::Send "{Numpad8}"
vk1D & 9::Send "{Numpad9}"
vk1D & m::Send "{Numpad0}"
vk1D & n::Send "{NumLock}"

; henkan(vd1C) move vim style
vk1C & h::Send "{Left}"
vk1C & j::Send "{Down}"
vk1C & k::Send "{Up}"
vk1C & l::Send "{Right}"
vk1C & y::Send "{Home}"
vk1C & u::Send "{PgDn}"
vk1C & i::Send "{PgUp}"
vk1C & o::Send "{End}"
