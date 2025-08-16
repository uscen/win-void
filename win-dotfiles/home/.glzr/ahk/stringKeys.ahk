; # =============================================================================== #
; # make a random number:                                                           #
; # =============================================================================== #
:*:rnd;;::{
    rand := random(100000,999999)
    Send(rand)
}
; # =============================================================================== #
; # Type a guid (2B59EA3C-ECC3-4F96-A400-BA705259C164):                             #
; # =============================================================================== #
:*:guid;;::{
    shellobj := ComObject("Scriptlet.TypeLib")
    gt := Trim(shellobj.GUID,"{}")
    ;g :="{text}" . gt
    Send(gt)
    shellobj := ""
}
; # =============================================================================== #
; # Personal:                                                                       #
; # =============================================================================== #
::mail;;::farah.ushen@gmail.com
::mail2;;::farah.oushen@gmail.com
; # =============================================================================== #
; # it pays to be polite:                                                           #
; # =============================================================================== #
:*c:ttyl::Talk to you later
:*c:ttyt::Talk to you then
:*c:ttyT::Talk to you tomorow
::ty::Thank you
::yw::You're welcome
; # =============================================================================== #
; # Symbol Shortcuts:                                                               #
; # =============================================================================== #
:*::!::❗
:*::?::❔
:*:~==::≈
:*:==>::⇒
:*:<==::⇐
:*:==^::⇑
:*:==v::⇓
; # =============================================================================== #
; Accents:                                                                          #
; # =============================================================================== #
:*:n;;::ñ
:*:e;;::é
::a;;::á
; # =============================================================================== #
; Symbols:                                                                          #
; # =============================================================================== #
:*:en;;::–
:*:em;;::—
:*:nbsp;;:: 
::c;;::©
::r;;::®
::tm;;::™
::deg;;::°
::pm;;::±
; # =============================================================================== #
; # Currency:                                                                       #
; # =============================================================================== #
::peso;;::
::php;;::
::p~:: {
    SendInput "₱"
    return
}
::euro;;::€
::pound;;::£
; # =============================================================================== #
; # Miscellaneous:                                                                  #
; # =============================================================================== #
::sec;;::§
::para;;::¶
::bull;;::•
::dot;;::·
::copy;;::⧉
; # =============================================================================== #
; # Type out placeholder text:                                                      #
; # =============================================================================== #
:*:lorem;;::
(
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquam, tellus quis bibendum volutpat, eros sem iaculis nisi, a dapibus mi nunc et ligula. Ut rutrum vulputate rhoncus. Curabitur quis tortor sagittis, fermentum leo vel, ornare sapien. Ut ut magna fermentum, dictum diam et, ultricies eros. Vivamus est mauris, eleifend at porta non, pharetra eget arcu. Ut iaculis egestas erat at convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam erat volutpat. Curabitur vitae massa in libero lacinia aliquet. Nam non purus lectus. Cras id justo et sem porta faucibus. Ut porta tellus semper interdum tincidunt.

Fusce id erat metus. Vestibulum vel pulvinar turpis, eget malesuada ligula. Nullam malesuada magna sed magna varius, sed maximus risus molestie. Etiam blandit tellus eu enim fermentum, vel volutpat libero tincidunt. Aenean sapien neque, congue ac tortor eu, interdum lacinia lectus. Vestibulum massa urna, scelerisque et laoreet et, commodo ac arcu. Ut maximus, leo sed molestie elementum, nulla dui eleifend nisl, sed efficitur ipsum diam et dui. Nulla facilisi. Proin eget aliquam est. Maecenas et imperdiet est, vel faucibus purus. Donec vehicula, eros ultrices pulvinar accumsan, turpis orci elementum mi, sit amet rhoncus libero nisl a erat. Quisque lectus risus, eleifend vitae commodo non, tempor non erat. Vivamus venenatis cursus molestie. Nam sapien felis, condimentum ac sagittis ut, convallis vel leo. Praesent sed turpis convallis ex accumsan cursus. Donec tempus vehicula est id semper.

Donec semper nisi sed nibh pellentesque viverra sit amet nec diam. Ut luctus augue sit amet mauris scelerisque, eu elementum tellus mollis. Proin vehicula ornare leo, non suscipit purus consequat blandit. Fusce a libero sit amet odio dictum feugiat ut vel nunc. Morbi vehicula consectetur ipsum, a finibus eros. In at nulla faucibus, euismod arcu eleifend, finibus urna. Phasellus congue ipsum ut ante tempor pellentesque. Vestibulum eget ligula quis nisi placerat dictum. Fusce consectetur maximus dui ac volutpat. Vivamus ullamcorper justo a diam semper euismod. Donec sagittis, sapien dapibus sodales consectetur, elit nunc venenatis eros, vel finibus metus lorem at nunc.
)
