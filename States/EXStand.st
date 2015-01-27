;Masa & Mune entrance
[Statedef 17010]
type = S
physics = N
movetype = I
anim = 3031
sprpriority = -2

[State 7010, appear]
type = assertspecial
trigger1 = Time % 2
flag = invisible
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7010, End]
type = ChangeState
trigger1 = Time >= 16
trigger2 = Parent, StateType = A
value = 17011

; Idle Masa&Mune
[Statedef 17011]
type = S
physics = N
movetype = I
anim = 3032
sprpriority = -2

[State 7010, appear]
type = StateTypeSet
trigger1 = Parent, StateType = S
statetype = A
physics = N
ignorehitpause = 1

[State 7010, appear]
type = StateTypeSet
trigger1 = Parent, StateType = C
statetype = C
physics = N
ignorehitpause = 1

[State 7010, appear]
type = StateTypeSet
trigger1 = Parent, StateType = A
statetype = A
physics = N
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7011, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = ,AT
ignorehitpause = 1

[State 7011, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/2.0
Y = (ParentDist Y - 10)/2.0
ignorehitpause = 1

[State 7011, Selector Var]
type = VarSet
trigger1 = Parent, MoveType != A
var(0) = 0

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1


[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA,AA,AP
stateno = 17015
ignorehitpause = 1

[State 130, Stop Guarding]
type = HitOverride
trigger1 = command = "holdback" && inguarddist && EnemyNear, MoveType = A
trigger2 = Parent, StateNo = [120, 155]
time = -1
attr = SCA,AA,AP
stateNo = 17016
ignorehitpause = 1

[State 7011, Ded]
type = ChangeState
trigger1 = !Parent, Var(23)
value = 17018

[State 7011, Light Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 200
trigger2 = Parent, StateNo = 400
trigger3 = Parent, StateNo = 600
trigger4 = (Parent, StateNo = [1000, 1001]) && Parent, Var(1) = 1
trigger5 = (Parent, StateNo = 1020) && Parent, Var(1) = 1
trigger6 = (Parent, StateNo = 1040) && Parent, Var(1) = 1
value = 17012

[State 7011, Mid Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 210
trigger2 = Parent, StateNo = 410
trigger3 = Parent, StateNo = 610
trigger4 = (Parent, StateNo = [1000, 1001]) && Parent, Var(1) = 2
trigger5 = (Parent, StateNo = 1020) && Parent, Var(1) = 2
trigger6 = (Parent, StateNo = 1040) && Parent, Var(1) = 2
value = 17013

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 220
trigger2 = Parent, StateNo = 420
trigger3 = Parent, StateNo = 620
trigger4 = (Parent, StateNo = [1000, 1001]) && Parent, Var(1) = 3
trigger5 = (Parent, StateNo = 1020) && Parent, Var(1) = 3
trigger6 = (Parent, StateNo = 1040) && Parent, Var(1) = 3
value = 17014

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13801
value = 17100

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13400
value = 17200

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 14015
value = 17225

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 14025
value = 17235

;Light Attack
[Statedef 17012]
type = S
physics = N
movetype = A
anim = 3033
sprpriority = -2
facep2= 1

[State 7010, appear]
type = StateTypeSet
trigger1 = !Time
trigger1 = Parent, StateType = C
statetype = C
physics = N
ignorehitpause = 1

[State 7010, appear]
type = StateTypeSet
trigger1 = !Time
trigger1 = Parent, StateType = A
statetype = A
physics = N
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = AnimElemNo(0) = 1
X = (ParentDist X)/5.0
Y = (ParentDist Y - 10)/5.0
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VelSet
trigger1 = AnimElem = 2
X = 2.5
Y = IfElse(Root, StateType = A, 3, IfElse(Root, StateType = C, -3, 0))
ignorehitpause = 1

[State 7021, hit]
type = HitDef
trigger1 = !Time
trigger1 = Parent, StateType = S
attr = S, NA
animtype  = Medium
damage    = 45
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7002,1
guardsound = 6,0
sparkno=s7004
sparkxy=-8,5
ground.type = High
ground.hittime  = 7
ground.velocity = -2
air.velocity = -2,-2
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p2sprpriority = -3
fall = 0


[State 7021, hit]
type = HitDef
trigger1 = !Time
trigger1 = Parent, StateType = C
attr = C, NA
animtype  = Medium
damage    = 45
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7002,1
guardsound = 6,0
sparkno=s7004
sparkxy=-8,5
ground.type = High
ground.hittime  = 7
ground.velocity = -2
air.velocity = -2,-2
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p2sprpriority = -3
fall = 0


[State 7021, hit]
type = HitDef
trigger1 = !Time
trigger1 = Parent, StateType = A
attr = A, NA
animtype  = Medium
damage    = 45
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7002,1
guardsound = 6,0
sparkno=s7004
sparkxy=-8,5
ground.type = High
ground.hittime  = 7
ground.velocity = -2
air.velocity = -2,-2
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p2sprpriority = -3
fall = 0

[State 7012, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 7012, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7011, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

;Mid Attack
[Statedef 17013]
type = S
physics = N
movetype = A
anim = 3034
sprpriority = -2
facep2= 1

[State 7010, appear]
type = StateTypeSet
trigger1 = !Time
trigger1 = Parent, StateType = C
statetype = C
physics = N
ignorehitpause = 1

[State 7010, appear]
type = StateTypeSet
trigger1 = !Time
trigger1 = Parent, StateType = A
statetype = A
physics = N
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7013, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = AnimElemNo(0) = 1
X = (ParentDist X)/5.0
Y = (ParentDist Y - 10)/5.0
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VelSet
trigger1 = AnimElem = 2
X = 3
Y = IfElse(Root, StateType = A, 3, IfElse(Root, StateType = C, -3, 0))
ignorehitpause = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7013, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 64
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7001,1
guardsound = 6,0
sparkno=s7006
sparkxy=-8,5
ground.type = High
ground.hittime  = 7
ground.velocity = -2.5
air.velocity = 0,10
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
envshake.time = 10
envshake.freq = 120
envshake.ampl = 6
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p2sprpriority = -3
fall = 0


;Strong Attack
[Statedef 17014]
type = S
physics = N
movetype = A
anim = 3035
sprpriority = -2
facep2= 1

[State 7010, appear]
type = StateTypeSet
trigger1 = !Time
trigger1 = Parent, StateType = C
statetype = C
physics = N
ignorehitpause = 1

[State 7010, appear]
type = StateTypeSet
trigger1 = !Time
trigger1 = Parent, StateType = A
statetype = A
physics = N
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = AnimElemNo(0) = 1
X = (ParentDist X)/5.0
Y = (ParentDist Y - 10)/5.0
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = !Time
value = S7000,1

[State 7014, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Hard
damage    = 75
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7020,1
guardsound = 6,0
sparkno=s7006
sparkxy=-8,5
p1sprpriority = -2
p2sprpriority = -3
ground.type = High
ground.hittime  = 7
ground.velocity = 0,-6
air.velocity = 0,-6
animtype=Medium
air.animtype=Medium
getpower = 0, 0
id = 7014
nochainID = 7014
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 8
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
fall = 1
fall.recover = 0

[State 7014, FollowPlayer]
type = PosAdd
trigger1 = AnimElemNo(0) = 1
X = (ParentDist X)/5.0
Y = (ParentDist Y - 10)/5.0
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VelSet
trigger1 = AnimElem = 2
X = 3.5
Y = IfElse(Root, StateType = A, 3, IfElse(Root, StateType = C, -3, 0))
ignorehitpause = 1

[State 7014, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

; Masa & Mune Gethit
[Statedef 17015]
MoveType = H
poweradd = 0

[State 17015, Vars]
type = ParentVarSet
trigger1 = !Time
v = 26
value = 1
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
v = 10
value = GetHitVar(groundtype)
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
v = 11
value = GetHitVar(animtype)
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
v = 12
value = GetHitVar(damage)
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
v = 13
value = GetHitVar(fall)
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
v = 14
value = GetHitVar(slidetime)
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
v = 15
value = GetHitVar(hittime)
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
v = 16
value = GetHitVar(hitshaketime)
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
v = 17
value = GetHitVar(airtype)
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
fv = 0
value = GetHitVar(xvel)
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
fv = 1
value = GetHitVar(yvel)
ignorehitpause = 1

[State 17015, Vars]
type = VarSet
trigger1 = !Time
fv = 2
value = GetHitVar(yaccel)
ignorehitpause = 1


[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7010, appear]
type = Offset
trigger1 = 1
X = IfElse(Time % 2, -2, 2)
ignorehitpause = 1

[State 7015, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA,AA, AP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 7015, NotHitBy]
type = NotHitBy
trigger1 = !Time
time = 10
value = SCA ,AA, AP
time = 1
ignorehitpause = 1

[State 7015, LifeAdd]
type = ParentVarAdd
trigger1 = Time = 0
v = 24
value = - 5 * floor(gethitvar(damage)) 
ignorehitpause = 1

[State 0, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = 1
text = "Var(1) = %d"
params = var(1)
ignorehitpause = 1

[State 7015, ChangeAnim]
type = ChangeAnim
trigger1 = Time < floor(gethitvar(hittime) * 0.8)
value = Anim
elem = AnimElemNo(0)
ignorehitpause = 1

[State 7015, End]
type = ChangeState
triggerall = Time >= floor(gethitvar(hittime) * 0.8)
trigger1 = (var(1) = [17011,17014]) || var(1) = 17225
value = 17011
ignorehitpause = 1

[State 7015, End]
type = ChangeState
triggerall = Time >= floor(gethitvar(hittime) * 0.8)
trigger1 = var(1) = 17200 && !(Parent, Var(23))
trigger2 = var(1) = 17220
value = 17019
ignorehitpause = 1


; Masa & Mune Guard
[Statedef 17016]
MoveType = H
poweradd = 0

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7010, appear]
type = Offset
trigger1 = 1
X = IfElse(Time % 2, -1, 1)
ignorehitpause = 1

[State 7015, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA,AA, AP
stateno = 17016
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 7015, NotHitBy]
type = NotHitBy
trigger1 = !Time
time = 5
value = SCA ,AA, AP
time = 1
ignorehitpause = 1

[State 7015, ChangeAnim]
type = ChangeAnim
trigger1 = Time < floor(gethitvar(hittime) * 0.8)
value = Anim
elem = AnimElemNo(0)
ignorehitpause = 1

[State 7015, End]
type = ChangeState
trigger1 = Time >= floor(gethitvar(hittime) * 0.8)
value = 17011
ignorehitpause = 1

;Masamune End
[Statedef 17018]
type = S
physics = N
movetype = I
velset = 0,0
anim = 3031

[State 7010, End]
type = DestroySelf
trigger1 = 1

;Masamune Fancy End
[Statedef 17019]
type = S
physics = N
movetype = I
velset = 0,0
anim = 3031
sprpriority = 2

[State 7010, appear]
type = assertspecial
trigger1 = Time % 2
trigger1 = Time < 20
flag = invisible
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 17018, Scale]
type = AngleDraw
trigger1 = Time > 20
scale = 1 - 0.1 * (Time - 20), 1 + 0.2 * (Time - 20)

[State 7010, End]
type = DestroySelf
trigger1 = Time > 30


; Throw
[Statedef 17100]
type = S
physics = N
movetype = A
anim = 13802
sprpriority = -2

[State 7010, appear]
type = Turn
trigger1 = !Time
trigger1 = Parent, Var(0) < 0
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosSet
trigger1 = !Time
X = (Parent, Pos X + (Parent, FVar(1) - 40 * Parent, Var(0)) * (Parent, Facing))
Y = (Parent, Pos Y - 10)
ignorehitpause = 1

[State 7010, appear]
type = PosFreeze	
trigger1 = 1
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = !Time
value = S7000,1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,AA, AP, AT
ignorehitpause = 1

[State 7014, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = IfElse(!(Parent, Var(23)), 17019, 17011)

;Guard Cancel
[Statedef 17200]
type = S
physics = N
movetype = A
anim = 13401
sprpriority = -2
facep2= 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 9606, EnvColor]
type = palfx
trigger1 = time < 10
trigger1 = time%2=1
add = 128,128,192
time = 1
persistent = 1
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7013, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = AnimElemNo(0) = 1
X = (ParentDist X)/5.0
Y = (ParentDist Y - 10)/5.0
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VelSet
trigger1 = AnimElem = 2
X = 3
Y = IfElse(Root, StateType = A, 3, IfElse(Root, StateType = C, -3, 0))
ignorehitpause = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = IfElse(!(Parent, Var(23)), 17019, 17011)

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 18
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7001,1
guardsound = 6,0
sparkno=s7006
sparkxy=-8,5
ground.type = High
ground.hittime  = 7
ground.velocity = -4.5,-3
air.velocity = -5,-7
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p2sprpriority = -3
fall = 0

;Appearance Attack
[Statedef 17210]
type = S
physics = N
movetype = A
anim = 14001
sprpriority = -2
facep2= 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 9606, EnvColor]
type = palfx
trigger1 = Anim = 14001
trigger1 = AnimElemNo(0) < 3
trigger1 = time%2=0
add = 128,128,192
time = 1
ignorehitpause = 1

[State 17210, Shake]
type = EnvShake
trigger1 = !Time
time = 12
freq = 120
ampl = 8

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7013, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 7014, Light Hit]
type = PosFreeze
trigger1 = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 111
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7001,1
guardsound = 6,0
sparkno=s7006
sparkxy=-8,5
ground.type = Low
ground.hittime  = 12
ground.slidetime = 30
ground.velocity = -7.5
air.velocity = -5,-7
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p2sprpriority = -3
fall = 0

; Muda Muda (No Stand)
[Statedef 17220]
type = S
physics = N
movetype = A
anim = 14010
velset = 0,0
sprpriority = -2
facep2= 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7010, appear]
type = VelSet
trigger1 = !NumTarget
trigger2 = NumTarget && FrontEdgeDist > 70
X = IfElse(Var(3) = 2, 0.8, IfElse(Var(3) = 1, 0.4, 0))
ignorehitpause = 1

[State 7010, appear]
type = VelSet
trigger1 = NumTarget && FrontEdgeDist < 50
X = -1.7
ignorehitpause = 1

[State 9606, EnvColor]
type = palfx
trigger1 = Anim = 14010
trigger1 = AnimElemNo(0) < 3
trigger1 = time%2=0
add = 128,128,192
time = 1
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1 

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = ,NT,ST,HT 
ignorehitpause = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
var(3) = Parent, Var(0)


[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17019

[State 3010, HitDef]
type = HitDef
trigger1 = AnimElemNo(0) % 2 != 0
trigger1 = AnimElemTime(AnimElemNo(0)) = 1
attr = S, SA
hitflag = MAF
guardflag = M
animtype = heavy
air.animtype = back
fall.animtype = back
damage = Ceil(20 * Parent, FVar(39)),2
pausetime = 7,8
guard.pausetime = 7,8
sparkno = S7006
sparkxy = -4, -10+(random%30)
hitsound = S1,4
guardsound = S4,0
ground.type = High
air.type = High
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = -4.5
guard.velocity = -5
air.velocity = -2.5, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 40,0
givepower = 20,0
air.fall = 1
fall.recover = 1
yaccel = .35
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=6

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(4) = 0

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
trigger1 = Var(4) != HitCount
trigger1 = (Var(4) := HitCount)
fvar(39) = Parent, fvar(39)*0.9
ignorehitpause = 1


; Muda Muda (W/Stand)
[Statedef 17225]
type = S
physics = N
movetype = A
anim = 14010
velset = 0,0
sprpriority = 2
facep2= 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(2) = 16
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VarAdd
trigger1 = var(2) >= 0
var(2) = -1
ignorehitpause = 1

[State 1100, VarSet]
type = VarSet
triggerall = var(2) > 0
triggerall = animelemtime(2) >= 0
triggerall = animelemtime(25) < 0
trigger1 = Parent, command = "a"
trigger2 = Parent, command = "b"
trigger3 = Parent, command = "c"
var(2) = 16
ignorehitpause = 1

[State 1040,ChangeAnim]
type = ChangeAnim
trigger1 = !var(2)
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(31) < 0
value = anim
elem = 31
ignorehitpause = 0
persistent = 0

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7010, appear]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/2.0
Y = (ParentDist Y - 10)/2.0

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1 

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = ,NT,ST,HT 
ignorehitpause = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

[State 3010, HitDef]
type = HitDef
trigger1 = AnimElemNo(0) % 2 != 0
trigger1 = AnimElemTime(AnimElemNo(0)) = 1
attr = S, SA
hitflag = MAF
guardflag = M
animtype = heavy
air.animtype = back
fall.animtype = back
damage = Ceil(20 * Parent, FVar(39)),2
pausetime = 7,!(random%8=0)*8
guard.pausetime = 7,!(random%8=0)*8
sparkno = S7006
sparkxy = -4, -10+(random%30)
hitsound = S1,4
guardsound = S4,0
ground.type = High
air.type = High
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = -5.5
guard.velocity = -5
air.velocity = -2.5, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 40,0
givepower = 20,0
air.fall = 1
fall.recover = 1
yaccel = .35
guard.kill = 0
p1sprpriority = 2
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=6


[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(3) = 0

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
trigger1 = Var(3) != HitCount
trigger1 = (Var(3) := HitCount)
fvar(39) = Parent, fvar(39)*0.9
ignorehitpause = 1


; MUDAA (No Stand)
[Statedef 17230]
type = S
physics = N
movetype = A
anim = 14020
velset = 0,0
sprpriority = -2
facep2= 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7010, appear]
type = VelSet
trigger1 = !MoveContact
trigger1 = AnimElemNo(0) = 2
X = 10 + 5*IfElse(Var(3) = 2, 0.8, IfElse(Var(3) = 1, 0.4, 0))
ignorehitpause = 1

[State 17225, Anim]
type = ChangeAnim
trigger1 = animelemtime(2) > 0
trigger1 = animelemtime(3) < 0
trigger1 = P2bodydist x < 30
value = 14020
elem = 3

[State 17210, Shake]
type = EnvShake
trigger1 = AnimElem = 3
time = 12
freq = 120
ampl = 8

[State 7010, appear]
type = VelSet
trigger1 = MoveContact
trigger2 = FrontEdgeDist < 50
trigger3 = AnimElemNo(0) >= 3
X = 0
ignorehitpause = 1

[State 9606, EnvColor]
type = palfx
trigger1 = Anim = 14020
trigger1 = AnimElemNo(0) < 3
trigger1 = time%2=0
add = 64,64,96
time = 1
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1 

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = ,NT,ST,HT 
ignorehitpause = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
var(3) = Parent, Var(0)

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17019

[State 3010, HitDef]
type = HitDef
trigger1 = !Time
attr = S, SA
hitflag = MAF
guardflag = M
animtype = hard
ground.type = Low
air.animtype = back
fall.animtype = back
damage = Ceil(120 * Parent, FVar(39)),2
pausetime = 7,8
guard.pausetime = 7,8
sparkno = S7006
sparkxy = -4, -20
hitsound = S1,4
guardsound = S4,0
ground.type = High
air.type = High
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = -4.5
guard.velocity = -5
air.velocity = -2.5, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 40,0
givepower = 20,0
air.fall = 1
fall.recover = 1
yaccel = .35
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=6

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(4) = 0

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
trigger1 = Var(4) != HitCount
trigger1 = (Var(4) := HitCount)
fvar(39) = Parent, fvar(39)*0.8
ignorehitpause = 1


; MUDAA (W/Stand)
[Statedef 17235]
type = S
physics = N
movetype = A
anim = 14020
velset = 0,0
sprpriority = -2
facep2= 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7010, appear]
type = VelSet
trigger1 = !MoveContact
trigger1 = AnimElemNo(0) = 2
X = IfElse(Var(3) = 2, 20, IfElse(Var(3) = 1, 15, 10))
ignorehitpause = 1

[State 17225, Anim]
type = ChangeAnim
trigger1 = animelemtime(2) > 0
trigger1 = animelemtime(3) < 0
trigger1 = P2bodydist x < 30
value = 14020
elem = 3

[State 7010, appear]
type = VelSet
trigger1 = MoveContact
trigger2 = FrontEdgeDist < 50
trigger3 = AnimElemNo(0) >= 3
X = 0
ignorehitpause = 1

[State 17210, Shake]
type = EnvShake
trigger1 = AnimElem = 3
time = 12
freq = 120
ampl = 8


[State 9606, EnvColor]
type = palfx
trigger1 = Anim = 14020
trigger1 = AnimElemNo(0) < 3
trigger1 = time%2=0
add = 64,64,96
time = 1
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1 

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = ,NT,ST,HT 
ignorehitpause = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
var(3) = Parent, Var(0)

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

[State 3010, HitDef]
type = HitDef
trigger1 = !Time
attr = S, SA
hitflag = MAF
guardflag = M
animtype = heavy
ground.type = Low
air.animtype = back
fall.animtype = back
damage = Ceil(120 * Parent, FVar(39)),2
pausetime = 7,8
guard.pausetime = 7,8
sparkno = S7006
sparkxy = -4, -20
hitsound = S1,4
guardsound = S4,0
ground.type = High
air.type = High
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = -4.5
guard.velocity = -5
air.velocity = -2.5, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 40,0
givepower = 20,0
air.fall = 1
fall.recover = 1
yaccel = .35
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=6


[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
fvar(39) = Parent, fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 200, Dampen]
Type = ChangeState
trigger1 = Parent, StateNo = 14026
value = 17236
ignorehitpause = 1

; MUDAA 2nd Hit (W/Stand)
[Statedef 17236]
type = S
physics = N
movetype = A
anim = 14021
velset = 0,0
sprpriority = -2
facep2= 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7010, appear]
type = VelSet
trigger1 = !MoveContact
trigger1 = AnimElemNo(0) = 2
X = 15
ignorehitpause = 1

[State 7010, appear]
type = VelSet
trigger1 = MoveContact
trigger2 = FrontEdgeDist < 50
trigger3 = AnimElemNo(0) >= 3
X = 0
ignorehitpause = 1

[State 17210, Shake]
type = EnvShake
trigger1 = AnimElem = 3
time = 12
freq = 120
ampl = 8

[State 9606, EnvColor]
type = palfx
trigger1 = Anim = 14021
trigger1 = AnimElemNo(0) < 3
trigger1 = time%2=0
add = 64,64,96
time = 1
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1 

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = ,NT,ST,HT 
ignorehitpause = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

[State 220, 1]
type = Hitdef
trigger1 = !Time
attr = S, SA
hitflag = MAF
guardflag = L
animtype = heavy
air.animtype = back
fall.animtype = back
priority = 5,Hit
damage = Floor(56 * Parent, FVar(39))
pausetime = 0, 15
guard.pausetime = 0, 15
sparkno = S8204
guard.sparkno = S8100
sparkxy = -20, -40
hitsound = S1,4
guardsound = S4,0
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 17
air.hittime = 17
guard.ctrltime = 17
ground.velocity = -18.5,10
guard.velocity = -12
air.velocity = -18.5,10
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 60,0
givepower = 30,0
persistent = 0
fall = 1
air.fall = 1
fall.recover = 0
yaccel = .35;44
guard.kill = 0
p2stateno = 17237
p2facing = 1


[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
fvar(39) = Parent, fvar(39)*0.8
persistent = 0
ignorehitpause = 1

;---------------------------------------------------------------------------
; MUDAA 2nd Hit GetHit
[Statedef 17237]
type = A
movetype = H
physics = N
velset = -12,0
anim = 5012

[State 2600, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim

[State 2601, Push]
type = PlayerPush
trigger1 = 1
value = 0

[State 2500, ScreenBound]
type = screenbound
trigger1 = time >= 30
value = 0

[State 2600, ChangeState]
type = ChangeState
trigger1 = backedgebodydist <= 0
trigger2 = time >= 60
value = 17238

;---------------------------------------------------------------------------
;MUDAA 2nd Hit GetHit - Flying
[Statedef 17238]
type = A
movetype = H
physics = N
velset = 0,0

[State 2500, ScreenBound]
type = screenbound
trigger1 = 1
value = 0

[State 2601, Position]
type = PosAdd
trigger1 = Time < 12
x = ceil((12-ifelse(time%2=0,time,time-1))/4)*ifelse(time%2=1,1,-1)

[State 2600, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 5012

[State 2600, ChangeAnim]
type = ChangeAnim
trigger1 = Time < 12
value = anim

[State 2601, ChangeAnim] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = time = 12
trigger1 = SelfAnimExist(5051)
value = 5051

[State 2601, ChangeAnim] ;Change anim when done with transition
type = ChangeAnim
trigger1 = time = 12
trigger1 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger1 = Anim != 5090 ;Not if hit off ground anim
value = 5050
persistent = 0

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = time >= 12
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 2601, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 20

[State 2601, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 10


[State 1027, Spark]
type = Explod
trigger1 = time = 12
anim = F72
pos = 0, floor (screenpos y) + Const(size.mid.pos.y)
postype = back
sprpriority = 3

[State 100, 2]
type = turn
trigger1 = backedgebodydist <= 0
trigger1 = time = 12

[State 2601, Vel]
type = VelSet
trigger1 = time = 12
x = -3.5
y = -4.3

[State 2601, Vel]
type = VelAdd
trigger1 = time > 12
y = .47

[State 2601, SelfState]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100