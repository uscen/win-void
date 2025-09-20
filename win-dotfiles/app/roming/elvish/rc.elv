use platform
use readline-binding

if (eq $platform:os windows) {
  set paths = [
    C:\Windows\System32
    C:\Windows\System32\WindowsPowerShell\v1.0
    C:$E:HOMEPATH\scoop\shims
    C:$E:HOMEPATH\bin
  ]
} else {
  set paths = [
    /bin
    /usr/bin
    $E:HOME/bin
    $E:HOME/.config/bin
  ]
}
