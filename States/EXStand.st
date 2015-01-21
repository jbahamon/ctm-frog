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
value = 17011

; Idle Masa&Mune
[Statedef 17011]
type = S
physics = N
movetype = I
anim = 3032
sprpriority = -2

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
type = HitOverride
trigger1 = 1
time = -1
attr = SCA,AA,AP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = ,AT
ignorehitpause = 1

[State 7011, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "var(0) = %d"
params = Var(0)

[State 7011, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X - 20)/2.0
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

[State 7011, Ded]
type = ChangeState
trigger1 = !Parent, Var(23)
trigger2 = Parent, Var(23) = 2
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

;Light Attack
[Statedef 17012]
type = S
physics = N
movetype = A
anim = 3033
sprpriority = -2
facep2= 1

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
X = (ParentDist X - 20)/5.0
Y = (ParentDist Y - 10)/5.0
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VelSet
trigger1 = AnimElem = 2
X = 2.5
Y = IfElse(Root, StateType = A, 3, IfElse(Root, StateType = C, -3, 0))
ignorehitpause = 1

[State 7015, ChangeAnim]
type = ParentVarAdd
trigger1 = !Time
trigger1 = Root, PalNo != 12
trigger1 = PrevStateNo != 17015
var(22) = -240
ignorehitpause = 1

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 15 * (1 + 2 * (Root, Var(23) = 1))
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
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p1sprpriority = -3
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
X = (ParentDist X - 20)/5.0
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
damage    = 18 * (1 + 2 * (Root, Var(23) = 1))
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
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p1sprpriority = -3
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
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = AnimElemNo(0) = 1
X = (ParentDist X - 20)/5.0
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
damage    = 25 * (1 + 2 * (Root, Var(23) = 1))
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
ground.velocity = 0,-6
air.velocity = 0,-6
animtype=Medium
air.animtype=Medium
getpower = 0, 0
id = 7014
nochainID = 7014
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
fall = 1
fall.recover = 0

[State 7014, FollowPlayer]
type = PosAdd
trigger1 = AnimElemNo(0) = 1
X = (ParentDist X - 20)/5.0
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
stateno = 7015
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

[State 7015, ChangeAnim]
type = ChangeAnim
trigger1 = Time < floor(gethitvar(hittime) * 0.8)
value = Anim
elem = AnimElemNo(0)
ignorehitpause = 1
     
[State 7015, End]
type = ChangeState
trigger1 = Time >= floor(gethitvar(hittime) * 0.8)
trigger1 = var(1) = [17011,17014]
value = 17011
ignorehitpause = 1

[State 7015, End]
type = ChangeState
trigger1 = Time >= floor(gethitvar(hittime) * 0.8)
trigger1 = var(1) != [17011,17014]
value = var(1)
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
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 17018, Scale]
type = AngleDraw
trigger1 = 1
scale = 1 - 0.1 * Time, 1 + 0.2*Time

[State 7010, End]
type = DestroySelf
trigger1 = Time > 10


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
X = (Parent, Pos X + (Parent, Var(1) - 40 * Parent, Var(0)) * (Parent, Facing))
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
value = IfElse(Parent, Var(23) = 0 || Parent, Var(23) = 2, 17019, 17011)

