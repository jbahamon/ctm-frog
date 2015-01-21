
; Roll
[Statedef 13500]
type = U
movetype = I
physics = N
anim = 13500
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 0
facep2 = 0
hitdefpersist = 0
movehitpersist = 0
hitcountpersist = 0
sprpriority = 0

[State 17100: SprPriority]
type = StateTypeSet
trigger1 = !Time
trigger1 = StateType = C
statetype = S

[State 17100: SprPriority]
type = SprPriority
trigger1 = (Vel X != 0)
value = -2

[State 17100: NotHitBy]
type = NotHitBy
trigger1 = (AnimElemNo(0) = [2,5])
value = , NA, SA, HA, NP, SP, HP

[State 17100: VelSet]
type = VelSet
trigger1 = (AnimElem = 2)
x = 2.9

[State 17100: VelSet]
type = VelSet
trigger1 = (AnimElem = 5)
x = 0

[State 17100: PlayerPush]
type = PlayerPush
trigger1 = (Vel X != 0)
value = 0

[State 17100: AfterImage]
type = AfterImage
trigger1 = (AnimElem = 2)
length = 8
palbright = 0, 0, 0
palcolor = 256
paladd = 0, 0, 0
palcontrast = 256, 256, 256
palmul = 1,1,1
trans = none
timegap  = 4
framegap = 4
time = 2; only 2 ticks!!!
ignorehitpause = 1
persistent = 0

[State 17100: AfterImage]
type = AfterImageTime
trigger1 = (Vel X != 0)
time = 2

[State 17100: ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 52
ctrl = 0

; Throw
[Statedef 13800]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 13800
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

[State 800, Direction]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "holdback", -1, 1)

[State 800, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 800, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 800, Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000,1

[State 800, Hit]
type = hitdef
trigger1 = !time
attr = S, NT 
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = s7000, 0
p1facing = 1
p2facing = Var(0)
p1stateno = 13801
p2stateno = 13802
guard.dist = 0
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Throw - Success
[Statedef 13801]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 13801
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
velset = 0,0

[State 13801, Masa & Mune]
type = helper
triggerall = !NumHelper(10000)
trigger1 = !Time
stateno = 17100
ID = 10000
name = "Masa&Mune"
postype = p1
pos = 0,-20
ownpal = 1
persistent = 0
supermovetime = 9999

[State 801, Bind]
type = VarSet
trigger1 = !Time
trigger1 = NumTarget
V = 1
value = (Target, Pos X - Pos X) * Facing 
ignorehitpause = 1

[State 801, Bind]
type = TargetBind
trigger1 = NumTarget
pos = Var(1), 0

[State 3001, Stop]
type = Pause
trigger1 = Time < 80
time = 2
movetime = 2

[State 3001, BGPalFX]
type = BGPalFX
trigger1 =  Time < 80
time = 1
mul = 0, 120, 256
sinadd = 20,20,20,10
invertall = 1
color = 0

[State 801, Throw Enemy]
type = TargetState
trigger1 = NumTarget
trigger1 = Time >= 80
value = 13803
persistent = 0

[State 801, Throw Enemy]
type = TargetState
trigger1 = NumTarget
trigger1 = Time >= 100
value = 13804
persistent = 0

[State 801, Throw Enemy]
type = TargetDrop
trigger1 = NumTarget
trigger1 = Time >= 100

[State 801, End]
type = ChangeState
trigger1 = !NumTarget
value = 0
ctrl = 1

; Throw - Gethit
[Statedef 13802]
type = S
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

; Throw - Gethit
[Statedef 13803]
type = S
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 802, Shake]
type = EnvShake
trigger1 = !Time
time = 20
freq = 120
ampl = 4

[State 802, LifeAdd]
type = LifeAdd
trigger1 = !Time
value = -81
kill = 1

[State 802, Shake]
type = PalFX
trigger1 = !Time
add = 200, 200, 200
mul = 256, 256, 256
time = 8

[State 802, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 806

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;Throw - Air
[Statedef 13804]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 803, Vel]
type = VelSet
trigger1 = !Time
y = -6
x = -4

[State 803, Vel]
type = VelAdd
trigger1 = 1
y = .56

[State 803, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 807

[State 803, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 808

[State 803, Pal]
type = PalFX
trigger1 = (Vel y > 0) && (Pos y >= 0)
add = 200, 200, 200
mul = 256, 256, 256
time = 8

[State 803, Life]
type = PosSet
trigger1 = (Vel y > 0) && (Pos y >= 0)
y = 0

[State 803, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100
ctrl = 0