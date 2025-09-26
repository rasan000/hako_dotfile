; backspace
$^h::
{
    Send "{Backspace}"
}

; henkan key to shift down
vk1D::Send("{Shift down}")
vk1D up::Send("{Shift up}")

; vk1C to vk1D key down
vk1C::Send("{vk1C}")

; key to move 
vk1C & n::Send "{Home}"
vk1C & m::Send "{PgDn}"
vk1C & ,::Send "{PgUp}"
vk1C & .::Send "{End}"
vk1C & h::Send "{Left}"
vk1C & j::Send "{Down}"
vk1C & k::Send "{Up}"
vk1C & l::Send "{Right}"

; key to function
vk1C & 1::Send "{F1}"
vk1C & 2::Send "{F2}"
vk1C & 3::Send "{F3}"
vk1C & 4::Send "{F4}"
vk1C & 5::Send "{F5}"
vk1C & 6::Send "{F6}"
vk1C & 7::Send "{F7}"
vk1C & 8::Send "{F8}"
vk1C & 9::Send "{F9}"
vk1C & 0::Send "{F10}"
vk1C & -::Send "{F11}"
vk1C & =::Send "{F12}"

; key to num
vk1C & q::Send "1"
vk1C & w::Send "2"
vk1C & e::Send "3"
vk1C & r::Send "4"
vk1C & t::Send "5"
vk1C & y::Send "6"
vk1C & u::Send "7"
vk1C & i::Send "8"
vk1C & o::Send "9"
vk1C & p::Send "0"
