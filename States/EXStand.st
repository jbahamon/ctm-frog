;Masa & Mune entrance
[Statedef 17010]
type = S
physics = N
movetype = I
anim = 3031
sprpriority = -2

[State 620, Snd]
type = PlaySnd
trigger1 = !Time
value = S7015,3
volumescale = 128

[State 7014, End]
type = VarSet
trigger1 = !Time
var(6) = 0

[State 7014, End]
type = VarSet
trigger1 = !Time
var(6) = 0

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


[State 7011, HitOverride]
type = NotHitBy
trigger1 = Parent, StateType = L
time = 1
value = SCA
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
time = 1
attr = SCA,AA,AP
stateno = 17015
ignorehitpause = 1

[State 130, Stop Guarding]
type = HitOverride
trigger1 = command = "holdback" && inguarddist && EnemyNear, MoveType = A
trigger2 = Parent, StateNo = [120, 155]
time = 1
attr = SCA,AA,AP
stateNo = 17016
ignorehitpause = 1

[State 7011, Ded]
type = ChangeState
trigger1 = !Parent, Var(23)
value = 17018

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, MoveType = H
value = 17017

[State 7011, Light Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13140
value = 17030

[State 7011, Mid Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13150
value = 17031

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13160
value = 17032

[State 7011, Light Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13130
value = 17020

[State 7011, Mid Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13131
value = 17021

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13132
value = 17022


[State 7011, Light Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13100
value = 17012

[State 7011, Mid Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13110
value = 17013

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 13120
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

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 14016
value = 17226

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 14040
value = 17240

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 15010
value = 17300

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 15015
value = 17305

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 15040
value = 17310

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 15060
trigger1 = Parent, Time >= 3
value = 17320

;Light Attack
[Statedef 17012]
type = S
physics = N
movetype = A
anim = 13001
velset = 0,0
sprpriority = -2
facep2= 0


[State 7014, End]
type = ChangeState
trigger1 = Parent, StateNo = 15045
value = 17311
ignorehitpause = 1

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7011, Heavy Hit]
type = ChangeAnim
trigger1 = !Time
value = IfElse(NumHelper(15060), 13003, 13001)

[State 7014, End]
type = VarSet
trigger1 = !Time
var(6) = IfElse(PrevStateNo = 17012, 1, IfElse((Root, PrevStateNo = [100,105]), 2, 0))

[State 7011, Light Hit]
type = ChangeState
trigger1 = AnimElemTime(4) > 0	
trigger1 = !NumHelper(15060)
trigger1 = Root, StateNo = 13140 && Var(6) = 0
value = 17030

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13150,13151]
value = 17031

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13160,13161]
value = 17032

[State 7014, End]
type = ChangeAnim
trigger1 = !Time
trigger1 = Var(6)
trigger1 = !NumHelper(15060)
value = 13002

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, MoveType = H
value = 17015

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, StateNo = 13101
trigger1 = !Var(6)
value = 17012
ignorehitpause = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, StateNo = 13110
trigger1 = Var(6) = 1
value = 17013
ignorehitpause = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, StateNo = 13111
trigger1 = !Var(6)
trigger1 = (Var(6) := 2)
value = 17013
ignorehitpause = 1


[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, StateNo = 13120
trigger1 = Var(6) = 1
value = 17014
ignorehitpause = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,0

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = !NumHelper(15060)
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 7015, Damage]
type = VarSet
trigger1 = !Time
fvar(0) = IfElse(!NumHelper(15060) && (Root, Prevstateno = [100,105]), 28, 35) * IfElse(NumHelper(15060), .25,1) * Parent, FVar(39)
ignorehitpause = 1

[State 200, 1]
type = Hitdef
trigger1 = !Time
attr = S, NA
hitflag = MAF
guardflag = M
animtype = Light
air.animtype = back
fall.animtype = back
priority = 3,Hit
damage = Ceil(fvar(0)), Ceil(fvar(0) *.25)
pausetime = 0,11
guard.pausetime = 0,11
sparkno = -1
guard.sparkno = -1
sparkxy = -5,-22
hitsound = S7001,0
guardsound = -1
ground.type = Low
air.type = Low
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = -3
guard.velocity = -2.7
air.velocity = -0.8, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 40),0
givepower = 20,0
persistent = 0
air.fall = 1
fall.recover = 1
yaccel = .35;44
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
envshake.time = 6
envshake.freq = 120
envshake.ampl = 4


[State 7012, Turn]
type = Turn
trigger1 = !NumHelper(15060)
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
stateno = 17015
time = 1
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

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(4) = 0

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
trigger1 = Var(4) != HitCount
trigger1 = (Var(4) := HitCount)
fvar(39) = Parent, fvar(39)*0.95
ignorehitpause = 1


[State 7014, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumHelper(15060)
trigger1 = Var(5) < 29
trigger1 = Helper(15060), Var(Var(5) + 1) > 0
trigger1 = (Var(5) := (Var(5) + 1))
value = Helper(15060), Var(Var(5))

[State 7011, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = IfElse(Root, Var(23), 17011, 17019)

;Mid Attack
[Statedef 17013]
type = S
physics = N
movetype = A
anim = 13011
velset = 0,0
sprpriority = -2
facep2= 0

[State 7014, End]
type = ChangeState
trigger1 = Parent, StateNo = 15045
value = 17311
ignorehitpause = 1


[State 7014, End]
type = VarSet
trigger1 = !Time
var(6) = IfElse(PrevStateNo = 17012 && Var(6) = 1, 1, IfElse(PrevStateNo = 17013 || (PrevStateNo = 17012 && Var(6) = 2), 2, 0))

[State 7011, Heavy Hit]
type = ChangeAnim
trigger1 = !Time
value = IfElse(NumHelper(15060), 13015, 13011)

[State 7014, End]
type = ChangeAnim
triggerall = !Time
triggerall = !NumHelper(15060)
trigger1 = Root, PrevStateNo = 100
trigger2 = Root, PrevStateNo = 105
value = 13012


[State 7011, Light Hit]
type = ChangeState
trigger1 = AnimElemTime(4) > 0	
trigger1 = !NumHelper(15060)
trigger1 = (Root, StateNo = [13140, 13141])
value = 17030

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13150,13151]
value = 17031

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13160,13161]
value = 17032

[State 7014, End]
type = ChangeAnim
triggerall = !Time
trigger1 = PrevStateNo = 17012
value = IfElse(NumHelper(15060), 13016, 13013)

[State 7014, End]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 17013
value = IfElse(NumHelper(15060), 13017, 13014)

[State 220, Position]
type = PosAdd
trigger1 = PrevStateNo != 17013
trigger1 = NumHelper(15060)
trigger1 = AnimElem = 2
x = 3

[State 220, Position]
type = PosAdd
trigger1 = PrevStateNo != 17013
triggerall = NumHelper(15060)
trigger1 = AnimElem = 2 || AnimElem = 4
x = 2

[State 220, Position]
type = PosAdd
trigger1 = PrevStateNo != 17013
trigger1 = NumHelper(15060)
trigger1 = AnimElemTime(1) = 1
x = 6

[State 220, Position]
type = PosAdd
trigger1 = PrevStateNo != 17013
trigger1 = NumHelper(15060)
trigger1 = AnimElemTime(2) = 8
x = 1

[State 1100, Velocity]
type = VelSet
trigger1 = PrevStateNo != 17013
trigger1 = NumHelper(15060)
trigger1 = time = 0
x = 0.5

[State 1100, Velocity]
type = VelSet
trigger1 = PrevStateNo != 17013
trigger1 = Time = 0
y = 0

[State 220, Position]
type = PosAdd
triggerall = PrevStateNo = 17013
trigger1 = AnimElemTime(2) = 8
trigger2 = AnimElem = 4
x = 1

[State 220, Position]
type = PosAdd
trigger1 = PrevStateNo = 17013
trigger1 = AnimElem = 3
x = 7

[State 220, Position]
type = PosAdd
trigger1 = PrevStateNo = 17013
trigger1 = AnimElemTime(3) = 1
x = 3

[State 220, Position]
type = PosAdd
trigger1 = PrevStateNo = 17013
trigger1 = AnimElem = 2
x = 7

[State 1100, Velocity]
type = VelSet
trigger1 = time = 0
x = 1.35

[State 1100, Velocity]
type = VelSet
trigger1 = PrevStateNo = 17013
trigger1 = AnimElemTime(2) = 3
x = 0.5

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, StateNo = 13111
trigger1 = Var(6) = 1
value = 17013
ignorehitpause = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, StateNo = 13120
trigger1 = Var(6) = 2 || Var(6) = 1
value = 17014
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
trigger1 = !NumHelper(15060)
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
time = 1
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = !NumHelper(15060)
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7014, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumHelper(15060)
trigger1 = Var(5) < 29
trigger1 = Helper(15060), Var(Var(5) + 1) > 0
trigger1 = (Var(5) := (Var(5) + 1))
value = Helper(15060), Var(Var(5))

[State 7011, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = IfElse(Root, Var(23), 17011, 17019)

[State 7015, Damage]
type = VarSet
trigger1 = !Time
fvar(0) = 64 * Parent, FVar(39) * IfElse(NumHelper(15060), 0.25, 1);* Root, Var(??)
ignorehitpause = 1

[State 220, 1]
type = Hitdef
trigger1 = !Time
attr = S, NA
hitflag = MAF
guardflag = M
animtype = medium
air.animtype = back
fall.animtype = back
priority = 5,Hit
damage = ceil(fvar(0)), ceil(fvar(0)*.25)
pausetime = 0,13
guard.pausetime = 0,13
sparkno = S8201
guard.sparkno = S8100
sparkxy = -20,-65
hitsound = S7001,1
guardsound = S4,0
ground.type = Low
air.type = Low
ground.slidetime = IfElse(NumHelper(15060), 11, IfElse(PrevStateNo = 17013, 17, 14))
ground.hittime = IfElse(NumHelper(15060), 11, IfElse(PrevStateNo = 17013, 17, 14))
air.hittime = IfElse(NumHelper(15060), 11, IfElse(PrevStateNo = 17013, 17, 14))
guard.ctrltime = IfElse(NumHelper(15060), 11, IfElse(PrevStateNo = 17013, 17, 14))
ground.velocity = IfElse(NumHelper(15060), -3,-5)
guard.velocity = IfElse(NumHelper(15060), -2.7,-4)
air.velocity = IfElse(PrevStateNo = 17013, -1.7, -.48), IfElse(PrevStateNo = 17013, -3.7, -4.7)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 30),0
givepower = 15,0
persistent = 0
air.fall = 1
fall.recover = 1
yaccel = .35;44
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4

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


;Strong Attack
[Statedef 17014]
type = S
physics = N
movetype = A
anim = 13021
velset = 0,0
sprpriority = -2
facep2= 0

[State 7014, End]
type = ChangeState
trigger1 = Parent, StateNo = 15045
value = 17311
ignorehitpause = 1


[State 7011, Light Hit]
type = ChangeState
trigger1 = AnimElemTime(4) > 0	
trigger1 = !NumHelper(15060)
trigger1 = Root, StateNo = 13140 && Var(6) = 0
value = 17030

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13150,13151]
value = 17031

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13160,13161]
value = 17032

[State 1100, Position]
type = PosAdd
triggerall = AnimElem = 3
trigger1 = NumHelper(15060) 
x = 13

[State 1100, Velocity]
type = VelSet
trigger1 = NumHelper(15060) 
trigger1 = time = 0
x = 0.5

[State 1100, Velocity]
type = VelSet
trigger1 = Time = 0
y = 0

[State 7014, End]
type = VarSet
trigger1 = !Time
var(6) = IfElse(PrevStateNo = 17012, 1, IfElse(PrevStateNo = 17013, 2, 0))

[State 7011, Heavy Hit]
type = ChangeAnim
trigger1 = !Time
value = IfElse(NumHelper(15060), 13024, 13021)

[State 7014, End]
type = ChangeAnim
triggerall = !Time
triggerall = !NumHelper(15060)
trigger1 = Root, PrevStateNo = 100
trigger2 = Root, PrevStateNo = 105
value = 13022

[State 7014, End]
type = ChangeAnim
triggerall = !Time
trigger1 = PrevStateNo = 17012
value = IfElse(NumHelper(15060), 13025, 13023)

[State 7014, End]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 17013
value = 13022

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7010, appear]
type = StateTypeSet
trigger1 = !Time
trigger1 = !NumHelper(15060)
trigger1 = Parent, StateType = C
statetype = C
physics = N
ignorehitpause = 1

[State 7010, appear]
type = StateTypeSet
trigger1 = !Time
trigger1 = !NumHelper(15060)
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
trigger1 = !NumHelper(15060)
X = (ParentDist X)
Y = (ParentDist Y - 10)
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
trigger1 = !NumHelper(15060)
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 17015
time = 1
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 7015, Damage]
type = VarSet
trigger1 = !Time
fvar(0) = IfElse((Root,  prevstateno = [100,105]) && !NumHelper(15060), 70, 91) * Parent, FVar(39) * IfElse(NumHelper(15060), 0.25, 1);* Root, Var(??)
ignorehitpause = 1

[State 220, 1]
type = Hitdef
trigger1 = !Time
attr = S, NA
hitflag = MAF
guardflag = M
animtype = medium
air.animtype = back
fall.animtype = back
priority = 5,Hit
damage = ceil(fvar(0)), ceil(fvar(0)*.25)
pausetime = 0,13
guard.pausetime = 0,13
sparkno = S8201
guard.sparkno = S8100
sparkxy = -20,-65
hitsound = S7001,3
guardsound = S4,0
ground.type = Low
air.type = Low
ground.slidetime = IfElse(NumHelper(15060), 11, IfElse(PrevStateNo = 17013, 17, 14))
ground.hittime = IfElse(NumHelper(15060), 11, IfElse(PrevStateNo = 17013, 17, 14))
air.hittime = IfElse(NumHelper(15060), 11, IfElse(PrevStateNo = 17013, 17, 14))
guard.ctrltime = IfElse(NumHelper(15060), 11, IfElse(PrevStateNo = 17013, 17, 14))
ground.velocity = IfElse(NumHelper(15060), -3,-5)
guard.velocity = IfElse(NumHelper(15060), -2.7,-4)
air.velocity = IfElse(PrevStateNo = 17013, -1.7, -.48), IfElse(PrevStateNo = 17013, -3.7, -4.7)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 30),0
givepower = 15,0
persistent = 0
air.fall = 1
fall.recover = 1
yaccel = .35;44
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4

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

[State 7014, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7014, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumHelper(15060)
trigger1 = Var(5) < 29
trigger1 = Helper(15060), Var(Var(5) + 1) > 0
trigger1 = (Var(5) := (Var(5) + 1))
value = Helper(15060), Var(Var(5))

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

; Masa & Mune Gethit
[Statedef 17015]
MoveType = H
poweradd = 0

[State 17015, Shut up]
type = StopSnd
trigger1 = !Time
channel = 0
ignorehitpause = 1

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
trigger1 = Time < floor(gethitvar(hittime) * 0.8)
X = IfElse(Time % 2, -2, 2)
ignorehitpause = 1

[State 7015, PosFreeze]
type = PosFreeze
trigger1 = Time < floor(gethitvar(hittime) * 0.8)
value = 1
ignorehitpause = 1

[State 7015, End]
type = PosAdd
trigger1 = Time >= floor(gethitvar(hittime) * 0.8)
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
time = 1
attr = SCA,AA, AP
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
time = 1
value = , AT
ignorehitpause = 1

[State 7015, NotHitBy]
type = NotHitBy
trigger1 = !Time
time = 10
value = SCA
ignorehitpause = 1


[State 7011, HitOverride]
type = NotHitBy
trigger1 = Time > 10
trigger1 = Parent, StateType = L
time = 1
value = SCA
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
triggerall = Time >= floor(gethitvar(hittime) * 0.8)
trigger1 = var(1) = 17200 && !(Parent, Var(23))
trigger2 = var(1) = 17210
trigger3 = var(1) = 17220
trigger4 = var(1) = 17230
trigger5 = var(1) = 17310 && !(Parent, Var(23))
value = 17019
ignorehitpause = 1

[State 7015, End]
type = ChangeState
trigger1 = Time >= floor(gethitvar(hittime) * 0.8)
value = 17011
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
trigger1 = Time < floor(gethitvar(hittime) * 0.8)
value = 1
ignorehitpause = 1

[State 7015, End]
type = PosAdd
trigger1 = Time >= floor(gethitvar(hittime) * 0.8)
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
time = 1
attr = SCA,AA, AP
stateno = 17016
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = Time >= 5
time = 1
value = , AT
ignorehitpause = 1

[State 7015, NotHitBy]
type = NotHitBy
trigger1 = !Time
time = 5
value = SCA
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = Parent, StateType = L
time = 1
value = SCA
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

; Masa & Mune Gethit from Parent
[Statedef 17017]
MoveType = I
Anim = 3032
poweradd = 0

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 7010, appear]
type = Offset
trigger1 = Time < floor(Root, gethitvar(hittime) * 0.8)
X = IfElse(Time % 2, -2, 2)
ignorehitpause = 1

[State 7015, End]
type = PosAdd
trigger1 = 1
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
time = 1
value = , AT
ignorehitpause = 1

[State 7015, NotHitBy]
type = NotHitBy
trigger1 = !Time
time = 10
value = SCA ,AA, AP, AT
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = Root, StateType = L
time = 1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
time = 1
attr = SCA, AA, AP
stateno = 17015
ignorehitpause = 1

[State 7015, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = Anim
elem = AnimElemNo(0)
ignorehitpause = 1

[State 7015, End]
type = ChangeState
triggerall = Parent, MoveType != H
trigger1 = var(1) = 17200 && !(Parent, Var(23))
trigger2 = var(1) = 17210
trigger3 = var(1) = 17220
trigger4 = var(1) = 17230
trigger5 = var(1) = 17310 && !(Parent, Var(23))
value = 17019
ignorehitpause = 1

[State 7015, End]
type = ChangeState
trigger1 = Parent, MoveType != H
trigger1 = Parent, StateType != L
value = 17011
ignorehitpause = 1

;Masamune End
[Statedef 17018]
type = S
physics = N
movetype = I
velset = 0,0
anim = 3031


[State 620, Snd]
type = PlaySnd
trigger1 = !Time
value = S7015,3
volumescale = 128

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


[State 620, Snd]
type = PlaySnd
trigger1 = !Time
value = S7015,3
volumescale = 128

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


;Light Air Attack
[Statedef 17020]
type = A
physics = N
movetype = A
anim = 13201
velset = 0,0
sprpriority = -2
facep2= 0

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, MoveType = H
value = 17015

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,0

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 7015, Damage]
type = VarSet
trigger1 = !Time
fvar(0) = 28 * Parent, FVar(39)
ignorehitpause = 1

[State 200, 1]
type = Hitdef
trigger1 = !Time
attr = A, NA
hitflag = MAF
guardflag = M
animtype = Light
air.animtype = back
fall.animtype = back
priority = 3,Hit
damage = Ceil(fvar(0)), Ceil(fvar(0) *.25)
pausetime = 0,11
guard.pausetime = 0,11
sparkno = -1
guard.sparkno = -1
sparkxy = -5,-22
hitsound = S7001,0
guardsound = -1
ground.type = Low
air.type = Low
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = -6
guard.velocity = -5.5
air.velocity = -12.5, -4.2
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.velocity = -3.5,-3.2
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 40),0
givepower = 20,0
persistent = 0
air.fall = 1
fall.recover = 1
yaccel = .35;44
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
envshake.time = 6
envshake.freq = 120
envshake.ampl = 4

[State 7012, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
stateno = 17015
time = 1
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

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(4) = 0

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
trigger1 = Var(4) != HitCount
trigger1 = (Var(4) := HitCount)
fvar(39) = Parent, fvar(39)*0.95
ignorehitpause = 1

[State 7011, Light Hit]
type = ChangeState
trigger1 = Root, StateNo != 13130
value = IfElse(Root, Var(23), 17011, 17019)


;Mid Air Attack
[Statedef 17021]
type = A
physics = N
movetype = A
anim = 13211
velset = 0,0
sprpriority = -2
facep2= 0

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, MoveType = H
value = 17015

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
trigger1 = 1
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 105, 1]
type = statetypeset
trigger1 = movetype = A
trigger1 = AnimElemTime(2) > 0
movetype = I

[State 7015, Damage]
type = VarSet
trigger1 = !Time
fvar(0) = 49 * Parent, FVar(39)
ignorehitpause = 1

[State 200, 1]
type = Hitdef
trigger1 = !Time
attr = A, NA
hitflag = MAF
guardflag = HA
animtype = medium
air.animtype = back
fall.animtype = back
priority = 3,Hit
damage = Ceil(fvar(0)), Ceil(fvar(0) *.25)
pausetime = 0,11
guard.pausetime = 0,11
sparkno = -1
guard.sparkno = -1
sparkxy = -5,-22
hitsound = S7001,1
guardsound = -1
ground.type = Low
air.type = Low
ground.slidetime = 14
ground.hittime = 14
air.hittime = 14
guard.ctrltime = 14
ground.velocity = -6
guard.velocity = -5.5
air.velocity = -3.5, -6.5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 50),0
givepower = 25,0
persistent = 0
air.fall = 1
fall.recover = 1
yaccel = .35;44
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
envshake.time = 6
envshake.freq = 120
envshake.ampl = 4

[State 7012, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
stateno = 17015
time = 1
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

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(4) = 0

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
trigger1 = Var(4) != HitCount
trigger1 = (Var(4) := HitCount)
fvar(39) = Parent, fvar(39)*0.95
ignorehitpause = 1

[State 7011, Light Hit]
type = ChangeState
trigger1 = Root, StateNo != 13131
value = IfElse(Root, Var(23), 17011, 17019)

;Strong Air Attack
[Statedef 17022]
type = A
physics = N
movetype = A
anim = 13221
velset = 0,0
sprpriority = -2
facep2= 0

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, MoveType = H
value = 17015

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
trigger1 = 1
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 105, 1]
type = statetypeset
trigger1 = movetype = A
trigger1 = AnimElemTime(2) > 0
movetype = I

[State 7015, Damage]
type = VarSet
trigger1 = !Time
fvar(0) = 77 * Parent, FVar(39)
ignorehitpause = 1

[State 200, 1]
type = Hitdef
trigger1 = !Time
attr = A, NA
hitflag = MAF
guardflag = HA
animtype = heavy
air.animtype = back
fall.animtype = back
priority = 3,Hit
damage = Ceil(fvar(0)), Ceil(fvar(0) *.25)
pausetime = 0,14
guard.pausetime = 0,14
sparkno = -1
guard.sparkno = -1
sparkxy = -5,-22
hitsound = S7001,3
guardsound = -1
ground.type = Low
air.type = Low
ground.slidetime = 14
ground.hittime = 14
air.hittime = 14
guard.ctrltime = 14
ground.velocity = -6
guard.velocity = -5.5
air.velocity = -3.5, -6.5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 60),0
givepower = 30,0
persistent = 0
air.fall = 1
fall.recover = 1
yaccel = .35;44
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
envshake.time = 6
envshake.freq = 120
envshake.ampl = 4

[State 7012, Turn]
type = Turn
trigger1 = !NumHelper(15060)
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
stateno = 17015
time = 1
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

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(4) = 0

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
trigger1 = Var(4) != HitCount
trigger1 = (Var(4) := HitCount)
fvar(39) = Parent, fvar(39)*0.95
ignorehitpause = 1

[State 7011, Light Hit]
type = ChangeState
trigger1 = Root, StateNo != 13132
value = IfElse(Root, Var(23), 17011, 17019)


;Light Crouch Attack
[Statedef 17030]
type = C
physics = N
movetype = A
anim = 13101
velset = 0,0
sprpriority = -2
facep2= 0

[State 7011, Light Hit]
type = ChangeState
trigger1 = AnimElemTime(4) > 0	
trigger1 = !NumHelper(15060)
trigger1 = Root, StateNo = [13100, 13101]
value = 17012

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13110,13111]
value = 17013

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13120,13121]
value = 17014

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13150,13151]
value = 17031

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13160,13161]
value = 17032

[State 7014, End]
type = VarSet
trigger1 = !Time
var(6) = IfElse(PrevStateNo = 17014, 1,IfElse(Root, PrevStateNo = 100 || Root, PrevStateNo = 105, 2, 0))

[State 7011, Heavy Hit]
type = ChangeAnim
trigger1 = !Time
value = IfElse(NumHelper(15060), 13104, 13101)

[State 7014, End]
type = ChangeAnim
triggerall = !Time
triggerall = !NumHelper(15060)
trigger1 = Root, PrevStateNo = 100
trigger2 = Root, PrevStateNo = 105
value = 13102

[State 7014, End]
type = ChangeAnim
triggerall = !Time
trigger1 = PrevStateNo = 17014
value = 13103

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = !NumHelper(15060)
trigger1 = Parent, StateNo = 13111
trigger1 = !Var(6)
trigger1 = (Var(6) := 2)
value = 17013
ignorehitpause = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, MoveType = H
value = 17015

[State 1100, Velocity]
type = VelSet
trigger1 = NumHelper(15060)
trigger1 = time = 0
x = 1

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,0

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = !NumHelper(15060)
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 7015, Damage]
type = VarSet
trigger1 = !Time
fvar(0) = 28 * Parent, FVar(39)
ignorehitpause = 1

[State 200, 1]
type = Hitdef
trigger1 = !Time
attr = C, NA
hitflag = MAF
guardflag = L
animtype = Light
air.animtype = back
fall.animtype = back
priority = 3,Hit
damage = Ceil(fvar(0)), Ceil(fvar(0) *.25)
pausetime = 0,11
guard.pausetime = 0,11
sparkno = -1
guard.sparkno = -1
sparkxy = -5,-22
hitsound = S7001,0
guardsound = -1
ground.type = Low
air.type = Low
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = -6
guard.velocity = -5.5
air.velocity = -1.6,0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.velocity = -3.5,-3.2
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 40),0
givepower = 20,0
persistent = 0
air.fall = 1
fall.recover = 1
yaccel = .35;44
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
envshake.time = 6
envshake.freq = 120
envshake.ampl = 4


[State 7012, Turn]
type = Turn
trigger1 = !NumHelper(15060)
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
stateno = 17015
time = 1
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

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(4) = 0

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
trigger1 = Var(4) != HitCount
trigger1 = (Var(4) := HitCount)
fvar(39) = Parent, fvar(39)*0.95
ignorehitpause = 1

[State 7011, Light Hit]
type = ChangeState
trigger1 = AnimElemTime(4) > 0	
trigger1 = !NumHelper(15060)
trigger1 = Root, StateNo = 13100 && Var(6) = 0
value = 17012

[State 7014, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumHelper(15060)
trigger1 = Var(5) < 29
trigger1 = Helper(15060), Var(Var(5) + 1) > 0
trigger1 = (Var(5) := (Var(5) + 1))
value = Helper(15060), Var(Var(5))

[State 7011, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = IfElse(Root, Var(23), 17011, 17019)

;Mid Crouch Attack
[Statedef 17031]
type = C
physics = N
movetype = A
anim = 13111
velset = 0,0
sprpriority = -2
facep2= 0


[State 1100, Velocity]
type = VelSet
trigger1 = NumHelper(15060)
trigger1 = time = 0
x = 1

[State 7011, Light Hit]
type = ChangeState
trigger1 = AnimElemTime(4) > 0	
trigger1 = !NumHelper(15060)
trigger1 = Root, StateNo = 13140
value = 17030

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13160,13161]
value = 17032

[State 7011, Light Hit]
type = ChangeState
trigger1 = AnimElemTime(4) > 0	
trigger1 = !NumHelper(15060)
trigger1 = Root, StateNo = [13100, 13101]
value = 17012

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13110,13111]
value = 17013

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13120,13121]
value = 17014

[State 7014, End]
type = VarSet
trigger1 = !Time
var(6) = IfElse(PrevStateNo = 17014, 1, 0)

[State 7011, Heavy Hit]
type = ChangeAnim
trigger1 = !Time
value = IfElse(NumHelper(15060), 13114, 13111)

[State 7014, End]
type = ChangeAnim
triggerall = !Time
triggerall = !NumHelper(15060)
trigger1 = Root, PrevStateNo = 100
trigger2 = Root, PrevStateNo = 105
value = 13112

[State 7014, End]
type = ChangeAnim
triggerall = !Time
trigger1 = PrevStateNo = 17030 || PrevStateNo = 17012
value = IfElse(NumHelper(15060), 13115, 13113)

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, MoveType = H
value = 17015

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
trigger1 = !NumHelper(15060)
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 7015, Damage]
type = VarSet
trigger1 = !Time
fvar(0) = 70 * Parent, FVar(39)
ignorehitpause = 1

[State 200, 1]
type = Hitdef
trigger1 = !Time
attr = C, NA
hitflag = MAF
guardflag = M
animtype = medium
air.animtype = back
fall.animtype = back
priority = 3,Hit
damage = Ceil(fvar(0)), Ceil(fvar(0) *.25)
pausetime = 0,13
guard.pausetime = 0,13
sparkno = -1
guard.sparkno = -1
sparkxy = -5,-22
hitsound = S7001,1
guardsound = -1
ground.type = Low
air.type = Low
ground.slidetime = 14
ground.hittime = 14
air.hittime = 14
guard.ctrltime = 14
ground.velocity = -4.6
guard.velocity = -4
air.velocity = -.85, -6
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 50),0
givepower = 25,0
persistent = 0
air.fall = 1
fall.recover = 1
yaccel = .35;44
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
envshake.time = 6
envshake.freq = 120
envshake.ampl = 4

[State 7012, Turn]
type = Turn
trigger1 = !NumHelper(15060)
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
stateno = 17015
time = 1
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

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(4) = 0

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
trigger1 = Var(4) != HitCount
trigger1 = (Var(4) := HitCount)
fvar(39) = Parent, fvar(39)*0.95
ignorehitpause = 1

[State 7011, Light Hit]
type = ChangeState
trigger1 = !NumHelper(15060)
trigger1 = Root, StateNo != [13150, 13151]
value = IfElse(Root, Var(23), 17011, 17019)

[State 7014, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumHelper(15060)
trigger1 = Var(5) < 29
trigger1 = Helper(15060), Var(Var(5) + 1) > 0
trigger1 = (Var(5) := (Var(5) + 1))
value = Helper(15060), Var(Var(5))

[State 7011, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = IfElse(Root, Var(23), 17011, 17019)

;Strong Crouch Attack
[Statedef 17032]
type = C
physics = N
movetype = A
anim = 13121
velset = 0,0
sprpriority = -2
facep2= 0

[State 1100, Velocity]
type = VelSet
trigger1 = NumHelper(15060)
trigger1 = time = 0
x = 1

[State 7011, Light Hit]
type = ChangeState
trigger1 = AnimElemTime(4) > 0	
trigger1 = !NumHelper(15060)
trigger1 = Root, StateNo = 13140
value = 17030

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13150,13151]
value = 17031

[State 7011, Light Hit]
type = ChangeState
trigger1 = AnimElemTime(4) > 0	
trigger1 = !NumHelper(15060)
trigger1 = Root, StateNo = [13100, 13101]
value = 17012

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13110,13111]
value = 17013

[State 7011, Light Hit]
type = ChangeState
triggerall = AnimElemTime(4) > 0	
triggerall = !NumHelper(15060)
trigger1 = Root, StateNo = [13120,13121]
value = 17014

[State 7014, End]
type = VarSet
trigger1 = !Time
var(6) = IfElse(PrevStateNo = 17014, 1, 0)

[State 7011, Heavy Hit]
type = ChangeAnim
trigger1 = !Time
value = IfElse(NumHelper(15060), 13124, 13121)

[State 7014, End]
type = ChangeAnim
triggerall = !Time
triggerall = !NumHelper(15060)
trigger1 = Root, PrevStateNo = 100
trigger2 = Root, PrevStateNo = 105
value = 13122

[State 7014, End]
type = ChangeAnim
triggerall = !Time
trigger1 = PrevStateNo = 17012 || PrevStateNo = 17013
trigger2 = PrevStateNo = 17030 || PrevStateNo = 17031
value = IfElse(NumHelper(15060), 13125, 13123)

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 7011, Heavy Hit]
type = ChangeState
trigger1 = Parent, MoveType = H
value = 17015

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
trigger1 = !NumHelper(15060)
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 7015, Damage]
type = VarSet
trigger1 = !Time
fvar(0) = 91 * Parent, FVar(39)
ignorehitpause = 1

[State 200, 1]
type = Hitdef
trigger1 = !Time
attr = C, NA
hitflag = MAF
guardflag = L
animtype = heavy
air.animtype = back
fall.animtype = back
priority = 3,Hit
damage = Ceil(fvar(0)), Ceil(fvar(0) *.25)
pausetime = 0,11
guard.pausetime = 0,11
sparkno = -1
guard.sparkno = -1
sparkxy = -5,-22
hitsound = S7001,3
guardsound = -1
ground.type = Low
air.type = Low
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = -4.5, 10
guard.velocity = -4
air.velocity = -4.5, 10
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 60),0
givepower = 30,0
persistent = 0
fall = 1
air.fall = 1
fall.recover = 0
yaccel = .35;44
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
envshake.time = 6
envshake.freq = 120
envshake.ampl = 4

[State 7012, Turn]
type = Turn
trigger1 = !NumHelper(15060)
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
stateno = 17015
time = 1
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

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(4) = 0

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
trigger1 = Var(4) != HitCount
trigger1 = (Var(4) := HitCount)
fvar(39) = Parent, fvar(39)*0.95
ignorehitpause = 1

[State 7014, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumHelper(15060)
trigger1 = Var(5) < 29
trigger1 = Helper(15060), Var(Var(5) + 1) > 0
trigger1 = (Var(5) := (Var(5) + 1))
value = Helper(15060), Var(Var(5))

[State 7011, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = IfElse(Root, Var(23), 17011, 17019)

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


[State 620, Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = S7001,1
channel = 0

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
time = 1
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
time = 1
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
facep2= 0

[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

[State 1040,ChangeAnim]
type = ChangeAnim
trigger1 = NumHelper(15060)
trigger1 = !Time
value = 14011

[State 7015, ChangeAnim]
type = VarSet
trigger1 = NumHelper(15060)
trigger1 = !Time
var(2) = 16
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VarAdd
trigger1 = NumHelper(15060)
trigger1 = var(2) >= 0
var(2) = -1
ignorehitpause = 1

[State 1040,ChangeAnim]
type = ChangeAnim
trigger1 = NumHelper(15060)
trigger1 = !Var(2)
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(31) < 0
value = anim
elem = 31
ignorehitpause = 0
persistent = 0

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
trigger2 = NumTarget && FrontEdgeDist > 60
X = IfElse(Var(3) = 2, 0.8, IfElse(Var(3) = 1, 0.4, 0))
ignorehitpause = 1

[State 7010, appear]
type = VelSet
trigger1 = NumTarget && FrontEdgeDist < 50
X = IfElse(NumHelper(15060), Vel X * 0.9,-1.5)
ignorehitpause = 1

[State 9606, EnvColor]
type = palfx
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
time = 1
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
trigger1 = NumHelper(15060)
var(3) = Helper(15060), Var(Var(5) + 29)

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
trigger1 = !NumHelper(15060)
var(3) = Parent, Var(0)

[State 7014, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumHelper(15060)
trigger1 = Var(5) < 29
trigger1 = Helper(15060), Var(Var(5) + 1) > 0
trigger1 = (Var(5) := (Var(5) + 1))
value = Helper(15060), Var(Var(5))

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
trigger2 = Parent, MoveType = H
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
hitsound = S7001,1
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
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 10),0
givepower = 20,0
air.fall = 1
fall.recover = 1
yaccel = .35
guard.kill = 0
p2facing = 1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=6



[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S8000,5
channel = 0
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=7 || MoveContact
value = S8000,6
loop = 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=30
value = S8000,7
channel = 0
ignorehitpause = 1

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
type = Turn
trigger1 = Facing != Parent, Facing
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
time = 1
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

[State 620, Snd]
type = PlaySnd
trigger1 = !Time 
value = S8000,5
channel = 0
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=7 || MoveContact
value = S8000,6
loop = 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=31
trigger2 = Parent, StateNo != 14015
trigger2 = (Parent, MoveType != H)
value = S8000,7
channel = 0
ignorehitpause = 1

[State 7014, Light Hit]
type = StopSnd
trigger1 = Parent, StateNo != 14015
channel = 0
ignorehitpause = 1

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
trigger2 = Parent, StateNo != 14015
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
hitsound = S7001,1
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
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 10),0
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


; Muda Muda Air(W/Stand)
[Statedef 17226]
type = A
physics = N
movetype = A
anim = 14010
velset = 0,0
sprpriority = 2
facep2= 1

[State 7010, appear]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

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
triggerall = animelemtime(16) < 0
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
time = 1
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


[State 620, Snd]
type = PlaySnd
trigger1 = !Time 
value = S8000,5
channel = 0
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=7 || MoveContact
value = S8000,6
loop = 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=31
trigger2 = Parent, StateNo != 14016
trigger2 = (Parent, MoveType != H)
value = S8000,7
channel = 0
ignorehitpause = 1


[State 7014, Light Hit]
type = StopSnd
trigger1 = Parent, StateNo != 14016
trigger1 = (Parent, MoveType = H)
channel = 0
ignorehitpause = 1

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
trigger2 = Parent, StateNo != 14016
value = 17011

[State 3010, HitDef]
type = HitDef
trigger1 = AnimElemNo(0) % 2 != 0
trigger1 = AnimElemTime(AnimElemNo(0)) = 1
attr = A, SA
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
hitsound = S7001,1
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
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 10),0
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
velset = 0,0
sprpriority = -2
facep2= NumHelper(15060)

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
trigger1 = NumHelper(15060)
var(3) = Helper(15060), Var(Var(5) + 29)

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
trigger1 = !NumHelper(15060)
var(3) = Parent, Var(0)


[State 7015, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = !NumHelper(15060)
value = IfElse(Var(3) = 2, 14022, IfElse(Var(3) = 1, 14021, 14020))
ignorehitpause = 1


[State 7015, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = NumHelper(15060)
value = IfElse(Var(3) = 2, 14028, IfElse(Var(3) = 1, 14027, 14026))
ignorehitpause = 1


[State 7014, Light Hit]
type = PlayerPush
trigger1 = 1
value = 1

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
value = Anim
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
time = 1
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

[State 7014, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumHelper(15060)
trigger1 = Var(5) < 29
trigger1 = Helper(15060), Var(Var(5) + 1) > 0
trigger1 = (Var(5) := (Var(5) + 1))
value = Helper(15060), Var(Var(5))

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
trigger2 = Parent, MoveType = H
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
hitsound = S7001,3
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
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 40),0
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
velset = 0,0
sprpriority = -2
facep2= 1


[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
var(3) = Parent, Var(0)

[State 7010, appear]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

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

[State 7015, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = IfElse(Var(3) = 2, 14025, IfElse(Var(3) = 1, 14024, 14023))
ignorehitpause = 1


[State 7010, appear]
type = VelSet
trigger1 = !MoveContact
trigger1 = AnimElemNo(0) = 2
X = IfElse(Var(3) = 2, 15, IfElse(Var(3) = 1, 10, 5))
ignorehitpause = 1

[State 17225, Anim]
type = ChangeAnim
trigger1 = animelemtime(2) > 0
trigger1 = animelemtime(3) < 0
trigger1 = P2bodydist x < 30
value = Anim
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
time = 1
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
trigger2 = Parent, StateNo != [14025, 14026]
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
hitsound = S7001,3
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
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 40),0
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
trigger1 = !NumHelper(15060)
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
velset = 0, 0

[State 7010, appear]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

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
time = 1
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
trigger2 = Parent, StateNo != [14025, 14026]
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
hitsound = S7001,3
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
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 60),0
givepower = 30,0
persistent = 0
fall = 1
air.fall = 1
fall.recover = 0
yaccel = .35;44
guard.kill = 0
p2stateno = IfElse(Var(29) > 0, 17237, -1)
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

; Shinei! 
[Statedef 17240]
type = S
physics = N
movetype = A
anim = 14040
velset = 0,0
sprpriority = -2
facep2= 1
velset = 0, 0

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
time = 1
stateno = 17241
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

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 1
x = abs(root,p2dist x*.02)

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 7
x = 9.2

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 12
x = .83

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 13
x = -.83

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 14
x = -3.5

[State 1100, Velocity]
type = VelMul
trigger1 = animelemtime(7) > 0
trigger1 = animelemtime(11) < 0
x = .96

[State 1100, Velocity]
type = VelMul
trigger1 = animelemtime(14) > 0
trigger1 = animelemtime(15) < 0
x = .96

[State 220, Position]
type = PosSet
trigger1 = AnimElem = 7
x = enemynear,pos x-(72*facing)

[State 1100, PowerAdd]
type = PowerAdd
trigger1 = AnimElem = 7
value = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 60)

[State 220, Effect]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1200, 3
channel = 0

[State -2, CornerPush]
type = VarSet
trigger1 = !Time
var(2) = 0
persistent = 0
ignorehitpause = 1

[State -2, CornerPush]
type = VarSet
trigger1 = movecontact
trigger1 = time > 1
var(2) = 15
persistent = 0
ignorehitpause = 1

[State 105, 1]
type = VarAdd
trigger1 = var(2) > 0
v = 2
value = -1
ignorehitpause = 1

[State -2, CornerPush]
type = PosFreeze
trigger1 = var(2)
ignorehitpause = 1

[State 0]
type = changeanim
triggerall = var(2)
trigger1 = AnimElem = 16
value = anim
elem = 15
persistent = 1

[State 220, 1]
type = Hitdef
trigger1 = AnimElem = 14
attr = S, SA
hitflag = MAF
guardflag = M
animtype = heavy
air.animtype = back
fall.animtype = back
priority = 5,Hit
damage = Floor(119 * Root, FVar(39)),7
pausetime = 0,15
guard.pausetime = 0,15
sparkno = S8204
guard.sparkno = S8100
sparkxy = -10, -74
hitsound = S7001,2
guardsound = S4,0
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 17
air.hittime = 17
guard.ctrltime = 17
ground.velocity = -.65, -4
guard.velocity = -8
air.velocity = -.83, -4.3
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(Root, Var(29) > 0 || NumHelper(15060), 0, 50),0
givepower = 25,0
persistent = 0
fall = 1
air.fall = 1
fall.recover = 1
yaccel = .35;44
guard.kill = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=6
envshake.time = 12
envshake.freq = 120
envshake.ampl = 8
p2facing = 1

[State 7014, Light Hit]
type = ChangeState
trigger1 = Parent, StateNo != 14040
value = IfElse(Parent, MoveType = H, 17241, 17019)

[State 7011, FollowPlayer]
type = PosAdd
trigger1 = !AnimTime
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
fvar(39) = Parent, fvar(39)*0.9
persistent = 0
ignorehitpause = 1


[State -2, CornerPush]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause = 1

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

; Shinei! Got Hit
[Statedef 17241]
type = S
physics = N
movetype = H
velset = 0,0
anim = 3031
sprpriority = 2

[State 7015, LifeAdd]
type = ParentVarAdd
trigger1 = Time = 0
v = 24
value = - 5 * floor(gethitvar(damage)) 
ignorehitpause = 1

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
type = ParentVarSet
trigger1 = !Time
v = 23
value = 0
ignorehitpause = 1

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


; Checkmate (W/Stand)
[Statedef 17300]
type = S
physics = N
movetype = A
anim = 15010
sprpriority = 3
facep2= !NumHelper(15060)
velset = 0,0


[State 7014, End]
type = ChangeState
trigger1 = AnimElemTime(5) >= 7 || (!Time && Root, Power < 1000)
trigger1 = NumHelper(15060)
trigger1 = Var(5) < 29
trigger1 = Helper(15060), Var(Var(5) + 1) > 0
trigger1 = (Var(5) := (Var(5) + 1))
value = Helper(15060), Var(Var(5))

[State 7014, End]
type = ChangeState
triggerall = NumHelper(15060)
trigger1 = AnimElemTime(5) >= 7
trigger2 = !Time
trigger2 = Root, Power < 1000
value = 17011

[State 7014, End]
type = PowerAdd
triggerall = !Time
trigger1 =  NumHelper(15060)
value = -1000
persistent = 0

[State 1000, Knife 1]
type = helper
trigger1 = numhelper(15060)
trigger1 = AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y + 10 - Random % 60)
ownpal = 1

[State 1000, Knife 2]
type = helper
trigger1 = numhelper(15060)
trigger1 = AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y + 10 - Random % 60)
ownpal = 1

[State 1000, Knife 3]
type = helper
trigger1 = numhelper(15060)
trigger1 = AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y + 10 - Random % 60)
ownpal = 1

[State 1000, Knife 4]
type = helper
trigger1 = numhelper(15060)
trigger1 = AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y + 10 - Random % 60)
ownpal = 1

[State 1000, Knife 5]
type = helper
trigger1 = numhelper(15060)
trigger1 = AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y + 10 - Random % 60)
ownpal = 1

[State 1000, Knife 6]
type = helper
trigger1 = numhelper(15060)
trigger1 = AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y + 10 - Random % 60)
ownpal = 1

[State 1000, Knife 7]
type = helper
trigger1 = numhelper(15060)
trigger1 = AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y + 10 - Random % 60)
ownpal = 1

[State 1000, Knife 8]
type = helper
trigger1 = numhelper(15060)
trigger1 = AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y + 10 - Random % 60)
ownpal = 1

[State 1000, Knife 9]
type = helper
trigger1 = numhelper(15060)
trigger1 = AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y + 10 - Random % 60)
ownpal = 1

[State 1000, Knife 1]
type = helper
trigger1 = numhelper(15060)
trigger1 = AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y + 10 - Random % 60)
ownpal = 1

[State 2010, Super Pause]
type = superpause
trigger1 = numhelper(15060)
trigger1 = AnimElem = 3
time = 45
movetime = 0
anim = -1
sound = -1
p2defmul = 1
darken = 0

[State 2010, Super Pause]
type = ChangeAnim
trigger1 = numhelper(15060)
trigger1 = AnimElemTime(3) = 1
value = 15010
elem = 4
persistent = 0

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=5
value = S7000,1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = !Time
trigger1 = !NumHelper(15060)
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1
persistent = 0

[State 7012, Turn]
type = Turn
trigger1 = !NumHelper(15060)
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
time = 1
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


[State 1000, Knife 1]
type = helper
trigger1 = AnimElemTime(1) = [2, 5]
trigger1 = NumHelper(17301) < 4
trigger1 = NumHelper(15060)
helpertype = normal
stateno = 17301
ID = 17301
name = "Masamune Knife"
postype = p1
pos = 31, -34
ownpal = 1
supermovetime = 99999

[State 1000, Knife 1]
type = helper
trigger1 = AnimElemTime(1) = [2, 5]
trigger1 = NumHelper(17302) < 4
trigger1 = NumHelper(15060)
helpertype = normal
stateno = 17302
ID = 17302
name = "Masamune Knife"
postype = p1
pos = -7, -22
ownpal = 1
supermovetime = 99999

[State 2010, Super Pause FX]
type = helper
trigger1 = !Time
trigger1 = NumHelper(15060)
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3250, Super Pause FX]
type = helper
trigger1 = !Time
trigger1 = NumHelper(15060)
helpertype = normal
stateno = 7001
ID = 7001
name = "Super BG"
postype = p1
pos = -34, -63
ownpal = 1
persistent = 0
pausemovetime = 9999
supermovetime = 9999

[State 7014, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumHelper(15060)
trigger1 = Var(5) < 29
trigger1 = Helper(15060), Var(Var(5) + 1) > 0
trigger1 = (Var(5) := (Var(5) + 1))
value = Helper(15060), Var(Var(5))

[State 7011, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011


; Knife in Hand
[Statedef 17301]
type = A
physics = N
movetype = I
anim = 15011
velset = 0,0
ctrl = 0
sprpriority = 4
movehitpersist = 1


[State 1006, End]
type = VarSet
trigger1 = !Time
fv = 0
value = 120 - Parent, NumHelper(17301) * 20

[State 17301, Angle]
type = AngleDraw
trigger1 = 1
value = FVar(0)

[State 17301, Angle]
type = AssertSpecial
trigger1 = Parent, NumHelper(17301) < 4
flag = invisible

[State 1006, End]
type = DestroySelf
trigger1 = Parent, AnimElemNo(0) > 3
trigger2 = Parent, Anim != 15010

; Knife in Other Hand
[Statedef 17302]
type = A
physics = N
movetype = I
anim = 15011
velset = 0,0
ctrl = 0
sprpriority = 4
movehitpersist = 1


[State 1006, End]
type = VarSet
trigger1 = !Time
fv = 0
value = 120 - Parent, NumHelper(17302) * 20

[State 17301, Angle]
type = AssertSpecial
trigger1 = Parent, NumHelper(17302) < 4
flag = invisible


[State 17301, Angle]
type = AngleDraw
trigger1 = 1
value = FVar(0)

[State 1006, End]
type = DestroySelf
trigger1 = Parent, AnimElemNo(0) > 3
trigger2 = Parent, Anim != 15010

; Checkmate (Air, W/Stand)
[Statedef 17305]
type = A
physics = N
movetype = A
anim = 15010
sprpriority = 3
facep2= 1
velset = 0,0

[State 7010, appear]
type = trans
trigger1 = 1
trans = none
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=5
value = S7000,1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = !Time
X = (ParentDist X)
Y = (ParentDist Y - 10)
ignorehitpause = 1
persistent = 0

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/5.0
Y = (ParentDist Y - 10)/5.0
ignorehitpause = 1

[State 7012, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
time = 1
stateno = 17015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = AnimElemTime(2) >= 7
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 2500, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
value = SCA
ignorehitpause = 1

[State 2500, NotHitBy]
type = NotHitBy
trigger1 = AnimElem = 2
value = SCA
time = 8

[State 7012, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 1000, Knife 1]
type = helper
trigger1 = AnimElemTime(1) = [2, 5]
trigger1 = NumHelper(17301) < 4
helpertype = normal
stateno = 17301
ID = 17301
name = "Masamune Knife"
postype = p1
pos = 31, -34
ownpal = 1
supermovetime = 99999

[State 1000, Knife 1]
type = helper
trigger1 = AnimElemTime(1) = [2, 5]
trigger1 = NumHelper(17302) < 4
helpertype = normal
stateno = 17302
ID = 17302
name = "Masamune Knife"
postype = p1
pos = -7, -22
ownpal = 1
supermovetime = 99999

[State 7011, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 17011

; Chi no Shoukan
[Statedef 17310]
type = S
movetype = A
physics = N
juggle = 0
ctrl = 0
anim = 15041
velset = 0,0
sprpriority = 2


[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
time = 1
stateno = 17015
ignorehitpause = 1

[State 7012, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7010, appear]
type = PosAdd
trigger1 = 1
X = (ParentDist X + 15)/2.0
Y = (ParentDist Y - 5)/2.0

[State 2500, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
value = SCA
ignorehitpause = 1

[State 2500, NotHitBy]
type = NotHitBy
trigger1 = AnimElem = 6
value = SCA
time = 10


[State 7011, HitOverride]
type = NotHitBy
trigger1 = AnimElemTime(6) >= 10
value = ,NT,ST,HT 
ignorehitpause = 1

[State 9606, EnvColor]
type = palfx
trigger1 = Time < 10
trigger1 = Time % 2
add = 128,128,192
time = 1
persistent = 1
ignorehitpause = 1

[State 7014, End]
type = ChangeState
trigger1 = Parent, StateNo = 15045
value = 17311

[State 7014, End]
type = ChangeState
trigger1 = Parent, StateNo != [15040, 15049]
value = IfElse(!(Parent, Var(23)), 17019, 17011)


; Chi no Shoukan - Success (Invisible)
[Statedef 17311]
type = S
movetype = A
physics = N
juggle = 0
ctrl = 0
anim = 7400
velset = 0,0
sprpriority = 2

[State 7011, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/2.0
Y = (ParentDist Y - 10)/2.0
ignorehitpause = 1

[State 7014, End]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 7014, End]
type = ChangeState
trigger1 = Parent, StateNo != [15040, 15049]
value = IfElse(!(Parent, Var(23)), 17019, 17011)


; Tandem Combo Initialization
[Statedef 17320]
type = S
movetype = I
physics = N
juggle = 0
ctrl = 0
anim = 7400
velset = 0,0
sprpriority = 2

[State 7014, End]
type = VarSet
trigger1 = !Time
var(6) = 0

[State 7014, End]
type = ChangeState
trigger1 = !Time && NumHelper(15060)
trigger2 = Root, MoveType = H
trigger3 = Time > 1 && !NumHelper(15060)
value = IfElse(!(Parent, Var(23)), 17019, 17011)

[State 2010, Super Pause FX]
type = helper
trigger1 = !Time
helpertype = normal
stateno = 17325
ID = 15060
name = "Tandem Combo"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 99999999

[State 7014, End]
type = VarSet
trigger1 = !Time
var(5) = 0

[State 7014, End]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 7014, End]
type = ChangeState
trigger1 = NumHelper(15060)
trigger1 = Root, StateNo != 15060
value = 17321

[State 7014, End]
type = ChangeState
trigger1 = !NumHelper(15060)
trigger1 = Root, StateNo != 15060
value = 17011



;---------------------------------------------------------------------------
; Tandem Combo (Advancing)
[Statedef 17321]
type = U
movetype = I
physics = N
ctrl = 0
anim = 15061
velset = 7.5,0

[State 10000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 10000, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP

[State 10000, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1

[State 10000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State 10000, HitOverride] 
type = HitOverride
trigger1 = 1
stateno = 17015
attr = SCA, NA, SA, HA, NP, SP, HP
time = 1


[State 10000, StateTypeSet]
type = StateTypeSet
trigger1 = root,statetype = S
statetype = S
ignorehitpause = 1

[State 10000, StateTypeSet]
type = StateTypeSet
trigger1 = root,statetype = C
statetype = C
ignorehitpause = 1

[State 10000, StateTypeSet]
type = StateTypeSet
trigger1 = root,statetype = A
statetype = A
ignorehitpause = 1

[State 10000, ChangeState]
type = ChangeState
trigger1 = root,movetype = H
value = 17017

[State 7014, End]
type = ChangeState
trigger1 = NumHelper(15060)
trigger1 = P2bodydist x <= 15
trigger1 = Helper(15060), Var(0) > 0
value = Helper(15060), Var(0)

[State 10000, ChangeState]
type = ChangeState
trigger1 = NumHelper(15060)
triggerall = Time > 3
trigger1 = P2bodydist x <= 15
trigger2 = Root,command = "x"
trigger2 = !Root,NumHelper(7000) && !Root,NumHelper(7001)
trigger3 = Time >= 43
value = ifelse(root,command="qcfx",17210,17011)

; Tandem Combo Initialization
[Statedef 17325]
type = S
movetype = I
physics = N
juggle = 0
ctrl = 0
anim = 7400
velset = 0,0
sprpriority = 2

[State 7014, End]
type = VarRangeSet
trigger1 = !Time
value = -1

[State 7014, End]
type = VarSet
trigger1 = !Time
v = 59
value = 0

[State 7014, End]
type = VarSet
trigger1 = !Time
v = 58
value = 0

[State 7014, End]
type = VarAdd
trigger1 = Var(58) > 0
v = 58
value = -1


[State 7014, End]
type = VarSet
trigger1 = Root, StateNo = 15060
trigger1 = Time > 4
trigger1 = !Var(58)
trigger1 = Root, Command = "qcf2p"
trigger1 = Var(59) < 29
trigger1 = (Var(59) := (Var(59) + 1))
trigger1 = Var(58) := 3
v = var(59) - 1
value = 17300

[State 7014, End]
type = VarSet
trigger1 = Root, StateNo = 15060
trigger1 = Time > 4
trigger1 = !Var(58)
trigger1 = Root, Command = "qcba" || Root, Command = "qcbb" || Root, Command = "qcbc"
trigger1 = Var(59) < 29
trigger1 = (Var(59) := (Var(59) + 1))
trigger1 = Var(58) := 3
trigger1 = (Var(Var(59) - 1 + 29) := IfElse(Root, Command="qcbc", 2, IfElse(Root, Command = "qcbb", 1, 0))) + 1
v = var(59) - 1
value = 17230


[State 7014, End]
type = VarSet
trigger1 = Root, StateNo = 15060
trigger1 = Time > 4
trigger1 = !Var(58)
trigger1 = Root, Command = "qcfa" || Root, Command = "qcfb" || Root, Command = "qcfc" 
trigger1 = Var(59) < 29
trigger1 = (Var(59) := (Var(59) + 1))
trigger1 = Var(58) := 3
trigger1 = (Var(Var(59) - 1 + 29) := IfElse(Root, Command="qcfc", 2, IfElse(Root, Command = "qcfb", 1, 0))) + 1
v = var(59) - 1
value = 17220

[State 7014, End]
type = VarSet
trigger1 = Root, StateNo = 15060
trigger1 = Time > 4
trigger1 = !Var(58)
trigger1 = Root, Command = "a"
trigger1 = Root, Command != "holddown"
trigger1 = Var(59) < 29
trigger1 = (Var(59) := (Var(59) + 1))
trigger1 = Var(58) := 3
v = var(59) - 1
value = 17012

[State 7014, End]
type = VarSet
trigger1 = Root, StateNo = 15060
trigger1 = Time > 4
trigger1 = !Var(58)
trigger1 = Root, Command = "b"
trigger1 = Root, Command != "holddown"
trigger1 = Var(59) < 29
trigger1 = (Var(59) := (Var(59) + 1))
trigger1 = Var(58) := 3
v = var(59) - 1
value = 17013

[State 7014, End]
type = VarSet
trigger1 = Root, StateNo = 15060
trigger1 = Time > 4
trigger1 = !Var(58)
trigger1 = Root, Command = "c"
trigger1 = Root, Command != "holddown"
trigger1 = Var(59) < 29
trigger1 = (Var(59) := (Var(59) + 1))
trigger1 = Var(58) := 3
v = var(59) - 1
value = 17014


[State 7014, End]
type = VarSet
trigger1 = Root, StateNo = 15060
trigger1 = Time > 4
trigger1 = !Var(58)
trigger1 = Root, Command = "a"
trigger1 = Root, Command = "holddown"
trigger1 = Var(59) < 29
trigger1 = (Var(59) := (Var(59) + 1))
trigger1 = Var(58) := 3
v = var(59) - 1
value = 17030

[State 7014, End]
type = VarSet
trigger1 = Root, StateNo = 15060
trigger1 = Time > 4
trigger1 = !Var(58)
trigger1 = Root, Command = "b"
trigger1 = Root, Command = "holddown"
trigger1 = Var(59) < 29
trigger1 = (Var(59) := (Var(59) + 1))
trigger1 = Var(58) := 3
v = var(59) - 1
value = 17031

[State 7014, End]
type = VarSet
trigger1 = Root, StateNo = 15060
trigger1 = Time > 4
trigger1 = !Var(58)
trigger1 = Root, Command = "c"
trigger1 = Root, Command = "holddown"
trigger1 = Var(59) < 29
trigger1 = (Var(59) := (Var(59) + 1))
trigger1 = Var(58) := 3
v = var(59) - 1
value = 17032


[State 0, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = Var(59) > 0
text = "Last Index = %d, Last Input = %d"
params = (Var(59) - 1), Var(Var(59) - 1)

[State 0, DisplayToClipboard]
type = DestroySelf
trigger1 = Root, StateNo != 15060
trigger1 = Parent, StateNo != [17012, 17014]
trigger1 = Parent, StateNo != [17030, 17032]
trigger1 = Parent, StateNo != 17220
trigger1 = Parent, StateNo != 17230
trigger1 = Parent, StateNo != 17320
trigger1 = Parent, StateNo != 17321
trigger1 = Parent, StateNo != 17300
