; backspace
$^h::
{
    Send "{Backspace}"
}

; space key to type space
Space::Send("{Space}")
^Space::Send("^{Space}")
+Space::Send("+{Space}")
^+Space::Send("^+{Space}")

; space key to move 
Space & y::Send "{Home}"
Space & u::Send "{PgDn}"
Space & i::Send "{PgUp}"
Space & o::Send "{End}"
Space & h::Send "{left}"
Space & j::Send "{down}"
Space & k::Send "{up}"
Space & l::Send "{right}"

; space key to function
Space & 1::Send "{F1}"
Space & 2::Send "{F2}"
Space & 3::Send "{F3}"
Space & 4::Send "{F4}"
Space & 5::Send "{F5}"
Space & 6::Send "{F6}"
Space & 7::Send "{F7}"
Space & 8::Send "{F8}"
Space & 9::Send "{F9}"
Space & 0::Send "{F10}"
Space & -::Send "{F11}"
Space & ^::Send "{F12}"
