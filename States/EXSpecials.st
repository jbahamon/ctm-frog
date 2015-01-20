; Throw
[Statedef 12800]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 800
sprpriority = 2
poweradd = IfElse(Var(21) > 0, 0, 18)
facep2 = 1
velset = 0,0

[State 803, Pal]
type = PalFX
trigger1 = 1
add = Floor(32 * Sin(Time * Pi/16.0)) + 32, 32 + Floor(32 * Sin(Time * Pi/16.0)), 32 + Floor(32 * Sin(Time * Pi/16.0))
mul = 256, 256, 256
time = 1