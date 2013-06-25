;==========================================================
; Global Helpers
;==========================================================

;SuperPause Helper
[Statedef 7000]
type = S
physics = N
movetype = I
anim = 7400

[State 7000, Pal Down]
type = BGPalFX
trigger1 = time <= 10 ;&& root, var(10) = 5
time = 1
mul = 256 -floor(25.6 * time), 256 -floor(25.6 * time), 256
color = 256 -floor(25.6 * time)

[State 7000, Pal Static]
type = BGPalFX
trigger1 = (time = [11, 39]); && root, var(10) = 5
time = 1
mul = 0, 0, 256
color = 0

[State 7000, Pal Up]
type = BGPalFX
trigger1 = time >= 40 
time = 1
mul = ceil(51.2 * (time - 40)), ceil(51.2 * (time - 40)), 256
color = floor(51.2 * (time - 40))

[State 7000, End]
type = DestroySelf
trigger1 = Time >= 45

