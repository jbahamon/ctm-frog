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

;Masa & Mune entrance
[Statedef 7010]
type = S
physics = N
movetype = I
anim = 3031
sprpriority = -2

[State 7010, appear]
type = trans
trigger1 = 1
trans = addalpha
alpha = 16 * Time, 256 - 8 * Time
ignorehitpause = 1

[State 7010, End]
type = ChangeState
trigger1 = Time >= 16
value = 7011

; Idle Masa&Mune
[Statedef 7011]
type = S
physics = N
movetype = I
anim = 3032
sprpriority = -2

[State 7011, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA
stateno = 7015
ignorehitpause = 1

[State 7011, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "var(0) = %d"
params = Var(0)

[State 7011, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/10.0
Y = (ParentDist Y - 10)/10.0
ignorehitpause = 1

[State 7011, Selector Var]
type = VarSet
trigger1 = Parent, MoveType != A
var(0) = 0

[State 7011, Light Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 200
trigger2 = Parent, StateNo = 400
trigger3 = Parent, StateNo = 600
value = 7012

[State 7011, Mid Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 210
trigger2 = Parent, StateNo = 410
trigger3 = Parent, StateNo = 610
value = 7013


[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 220
trigger2 = Parent, StateNo = 420
trigger3 = Parent, StateNo = 620
value = 7014


;Light Attack
[Statedef 7012]
type = S
physics = N
movetype = A
anim = 3033
sprpriority = -2

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 10
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7002,1
guardsound = 6,0
sparkno=s7004
sparkxy=-8,5
ground.type = High
ground.hittime  = 7
ground.velocity = 0
air.velocity = 0,4
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p1sprpriority = -3

[State 7012, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7012, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA
stateno = 7015
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/10.0
Y = (ParentDist Y - 10)/10.0
ignorehitpause = 1

[State 7012, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7011, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 7011

;Mid Attack
[Statedef 7013]
type = S
physics = N
movetype = A
anim = 3034
sprpriority = -2

[State 7013, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7013, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA
stateno = 7015
ignorehitpause = 1

[State 7013, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/10.0
Y = (ParentDist Y - 10)/10.0
ignorehitpause = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7013, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 7011

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 12
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7001,1
guardsound = 6,0
sparkno=s7006
sparkxy=-8,5
ground.type = High
ground.hittime  = 7
ground.velocity = 0
air.velocity = 0,4
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p1sprpriority = -3


;Strong Attack
[Statedef 7014]
type = S
physics = N
movetype = A
anim = 3035
sprpriority = -2

[State 7014, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7014, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA
stateno = 7015
ignorehitpause = 1

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Hard
damage    = 15
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7020,1
guardsound = 6,0
sparkno=s7006
sparkxy=-8,5
p1sprpriority = -2
p1sprpriority = -3
ground.type = High
ground.hittime  = 7
ground.velocity = 0
air.velocity = 0,4
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10


[State 7014, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/10.0
Y = (ParentDist Y - 10)/10.0
ignorehitpause = 1

[State 7014, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 7011
