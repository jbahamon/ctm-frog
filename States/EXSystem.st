;Standing Light (w/stand)
[StateDef 13100]
anim = 13000
ctrl = 0
type = S
movetype = A
physics = S
sprpriority = 1
velset = 0,0
poweradd = 0
juggle = 3 
facep2= 1

[State 200, 1]
type = ChangeState
trigger1 = !NumHelper(10000) || !Var(23)
trigger2 = NumHelper(10000) && Helper(10000), StateNo = 17012 && !(Helper(10000), AnimTime)
trigger3 = Time > 5 && NumHelper(10000) && Helper(10000), StateNo != [17012, 17014]
value = 0
ctrl = 1

;Standing Light (w/stand)
[StateDef 13101]
ctrl = 0
type = S
movetype = A
physics = S
sprpriority = 1
velset = 0,0
poweradd = 0
juggle = 3 
facep2= 1

[State 200, 1]
type = ChangeState
trigger1 = !NumHelper(10000) || !Var(23)
trigger2 = Time > 5 && NumHelper(10000) && Helper(10000), StateNo != [17012, 17014]
trigger3 = NumHelper(10000) && Helper(10000), StateNo = 17012 && !(Helper(10000), AnimTime)
value = 0
ctrl = 1

;Standing Medium
[Statedef 13110]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
sprpriority=1
facep2= 1

[State 210, 5]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo != 13101
value = 13010

[State 210, 5]
type = ChangeState
trigger1 = !NumHelper(10000) || !Var(23)
trigger2 = NumHelper(10000) && Helper(10000), StateNo = 17013 && !(Helper(10000), AnimTime)
trigger3 = Time > 5 && NumHelper(10000) && Helper(10000), StateNo != [17012, 17014]
value = 0
ctrl = 1

;Standing Medium
[Statedef 13111]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
sprpriority=1
facep2= 1

[State 210, 5]
type = ChangeState
trigger1 = !NumHelper(10000) || !Var(23)
trigger2 = NumHelper(10000) && Helper(10000), StateNo = 17013 && !(Helper(10000), AnimTime)
trigger3 = Time > 5 && NumHelper(10000) && Helper(10000), StateNo != [17012, 17014]
value = 0
ctrl = 1

;Standing Strong
[Statedef 13120]
type = S
physics = S
movetype = A
anim = 13020
ctrl = 0
velset = 0,0
poweradd= 18
juggle = 12
sprpriority=1
facep2= 1


[State 210, 5]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo != 13101
trigger1 = PrevStateNo != 13111
trigger1 = PrevStateNo != 13110
value = 13020

[State 220, end]
type=changestate
trigger1 = !NumHelper(10000) || !Var(23)
trigger2 = NumHelper(10000) && Helper(10000), StateNo = 17014 && !(Helper(10000), AnimTime)
trigger3 = Time > 5 && NumHelper(10000) && Helper(10000), StateNo != [17013, 17014]
value = 0
ctrl = 1


;------------------------------------------------------------------------------------------

; Stand Activation
[Statedef 13195]
type = U
ctrl = 0
movetype = I
sprpriority = 2

[State 13195, Sound!]
type=PlaySnd
trigger1=!time
value = S7015,1
channel = 0

[State 13195, Physics]
type = StateTypeSet
trigger1 = !Time
trigger1 = StateType = A
physics = A

[State 13195, Vel]
type = VelSet
trigger1 = !Time
trigger1 = StateType = S
X = 0
Y = 0

[State 13195, Anim]
type = ChangeAnim
trigger1 = !Time
trigger1 = StateType = S
value = 195

[State 13195, Stand Var]
type = VarSet
triggerall = !Time
trigger1 = !Var(23)
trigger1 = !NumHelper(10000)
trigger1 = Var(27) := 39
trigger2 = !Var(27)
trigger2 = Var(23)
trigger2 = NumHelper(10000)
v = 23
value = !Var(23)

[State 13195, 2]
type = ChangeState
trigger1 = Time = 10
value = IfElse(StateType != A, 0, 50)
ctrl = 1

;Stand Meter
[Statedef 13200]
type = S
physics = N
movetype = I
anim = 13250
sprpriority = 4

[State 7200, Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 7200, Amount]
type = Helper
trigger1 = !NumHelper(13201)
name = "Stand Bar"
ID = 13201
stateno = 13201
pos = -16,0
postype = left    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 999999
;
;[State 7200, TransVar]
;type = VarSet
;trigger1 = !Time
;var(0) = 0
;
;[State 7200, FromTrans]
;type = VarAdd
;trigger1 = Root, StateType = A
;trigger1 = Var(0) < 16
;var(0) = 1
;
;[State 7200, FromTrans]
;type = VarAdd
;trigger1 = Root, StateType != A
;trigger1 = Var(0) > 0
;var(0) = -1
;
;[State 7200, Trans]
;type = Trans
;trigger1 = 1
;trans = addalpha
;alpha = var(0) * 16, 256 - var(0) * 16
;ignorehitpause = 1

[State 7200, scale]
type = AngleDraw
trigger1 = 1
scale = 0.5, 0.5
ignorehitpause = 1

[State 7200, Pos]
type = PosSet
trigger1 = 1
X = Root, Pos X 
Y = Root, Pos Y + 5
ignorehitpause = 1

; Stand Bar
[Statedef 13201]
type = S
physics = N
movetype = I
anim = 13251
sprpriority = 5

[State 7201, Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 7201, Pos]
type = PosSet
trigger1 = 1
X = Parent, Pos X - 16.5
Y = Parent, Pos Y
ignorehitpause = 1

[State 7201, scale]
type = AngleDraw
trigger1 = 1
scale = (Root, Var(24) / 1000.0)*0.5, 0.5
ignorehitpause = 1


; Stand Crash BG
[Statedef 13250]
type = S
physics = N
movetype = I
anim = 14997
sprpriority = -105

[State 7201, Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 7201, Shadow]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 7201, Pos]
type = PosAdd
trigger1 = 1
X = GameWidth/2.0 - ScreenPos X
Y = GameHeight/2.0 - ScreenPos Y
ignorehitpause = 1

[State 8520, Scale]
type = VarSet
trigger1 = !Time
v = 0
value = 4

[State 8520, Scale]
type = Trans
trigger1 = Time >= Var(0)
trans = addalpha
alpha = 256 - 16 * (Time - Var(0)), 16 * (Time - Var(0))

[State 8520, Safety]
type = DestroySelf
trigger1 = Time >= (Var(0) + 16)

; Advancing Guard
[Statedef 13300]
type    = U
movetype = I
physics = N
ctrl = 0
velset = 0,0

[State 810, 1]
type = Explod
trigger1 = time = 0
anim = 1015
pos = 15,ifelse(statetype = C && !Var(23),-7, -10)
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = 99999999

[State 810, 1]
type = helper
trigger1 = time = 0
ID = 13305
stateno = 13305
pos = -15,0
facing = 1
size.ground.back = 20
size.ground.front = 20
size.height = 240
pausemovetime = 99999999

[State 810, 1]
type = velset
trigger1 = 1
x = 0

[State 810, 2]
type = ChangeAnim
trigger1 = time >= 0 && command != "holddown"
value = 150

[State 810, 3]
type = ChangeAnim
trigger1 = time >= 0 && command = "holddown"
value = 151

[State 810, 4]
type = statetypeset
trigger1 = command != "holddown"
statetype = S
physics = S

[State 810, 5]
type = statetypeset
trigger1 = command = "holddown"
statetype = C
physics = C

[State 810, 6]
type = NotHitBy
trigger1 = time <= 1
value = SCA
time = 1

[State 810, 7]
type = ChangeState
trigger1 = time = 1
value = 151+(command = "holddown")*2

; Advancing Guard
[Statedef 13301]
type    = U
movetype = I
physics = N

[State 811, 1]
type = velset
trigger1 = 1
x = 0

[State 811, 2]
type = ChangeAnim
trigger1 = time >= 0 && command != "holddown"
value = 150

[State 811, 3]
type = ChangeAnim
trigger1 = time >= 0 && command = "holddown"
value = 15

[State 811, 4]
type = statetypeset
trigger1 = command != "holddown"
statetype = S
physics = S

[State 811, 5]
type = statetypeset
trigger1 = command = "holddown"
statetype = C
physics = C

[State 811, 6]
type = ChangeState
trigger1 = numhelper(13305) = 1
trigger1 = command = "holdback"
value = 151+(command = "holddown")*2

[State 811, 7]
type = ChangeState
trigger1 = !numhelper(13305)
value = 130+(command = "holddown")
ctrl = 1

; Advancing Guard Helper
[Statedef 13305]
type = S
movetype = I
physics = N
velset = 0,0
anim = 7401

[State 815, 1]
type = PlayerPush
trigger1 = 1
value = 1

[State 815, 2]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 815, 3]
type = velset
trigger1 = Time = 0
x = 20

[State 815, 4]
type = veladd
trigger1 = Time > 0
x = -1

[State 815, 6]
type = DestroySelf
trigger1 = Time = 15

;---------------------------------------------------------------------------
; Guard Helper
[Statedef 13310]
type = S
movetype = I
physics = N
ctrl = 0
anim = 7400

[State 8500, 1]
type = varset
trigger1 = parent,stateno != [150,815]
var(6) = 0

[State 8500, 1]
type = varset
trigger1 = parent,stateno = 150
trigger2 = parent,stateno = 152
var(6) = parent,GetHitVar(ctrltime)

[State 8500, 1]
type = varset
trigger1 = parent,stateno != [150,815]
var(5) = 0

[State 8500, 1]
type = varadd
trigger1 = parent,stateno = 153
var(5) = 1

[State 8500, 1]
type = varset
trigger1 = parent,stateno != [150,815]
var(4) = 0

[State 8500, 1]
type = varadd
trigger1 = parent,stateno = 151
var(4) = 1

[State 8500, 1]
type = varset
trigger1 = parent,stateno != [150,815]
var(3) = 0

[State 8500, 1]
type = varset
trigger1 = parent,stateno = 150
trigger2 = parent,stateno = 152
var(3) = parent,GetHitVar(hittime)



; Guard Cancel
[Statedef 13400]
type = S
movetype = A
physics = N
juggle = 0
ctrl = 0
anim = 13000
velset = 0,0

[State 13801, Masa & Mune]
type = helper
triggerall = !NumHelper(10000)
trigger1 = !Time
stateno = 17200
ID = 10000
name = "Masa&Mune"
postype = p1
pos = 0,-20
ownpal = 1
persistent = 0
supermovetime = 9999

[State 220, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 2500, NotHitBy]
type = NotHitBy
trigger1 = Time <= 10
value = SCA

[State 9606, EnvColor]
type = palfx
trigger1 = time < 10
trigger1 = time%2=1
add = 128,128,192
time = 1
persistent = 1
ignorehitpause = 1

[State 220, 3]
type = ChangeState
triggerall = time > 1
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17019 || Helper(10000), StateNo = 17011
trigger2 = NumHelper(10000)
value = 0
ctrl = 1

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
FV = 1
value = (Target, Pos X - Pos X) * Facing 
ignorehitpause = 1

[State 801, Bind]
type = TargetBind
trigger1 = NumTarget
pos = FVar(1), 0

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

;---------------------------------------------------------------------------
; Hit Selector
[Statedef 13899]
type    = U
movetype= H
physics = N
velset = 0,0

[State 13899, Safety]
type = ChangeState
trigger1 = !Time
trigger1 = !NumHelper(10000)
value = 0
ctrl = 1

[State 13899]
type = VarSet
trigger1 = !Time
var(0) = Helper(10000), Var(10)

[State 13899]
type = VarSet
trigger1 = !Time
var(1) = Helper(10000), Var(11)

[State 13899]
type = VarSet
trigger1 = !Time
var(2) = Helper(10000), Var(12)

[State 13899]
type = VarSet
trigger1 = !Time
var(3) = Helper(10000), Var(13)
[State 13899]
type = VarSet
trigger1 = !Time
var(4) = Helper(10000), Var(14)

[State 13899]
type = VarSet
trigger1 = !Time
var(5) = Helper(10000), Var(15)

[State 13899]
type = VarSet
trigger1 = !Time
var(6) = Helper(10000), Var(16)

[State 13899]
type = VarSet
trigger1 = !Time
var(7) = Helper(10000), Var(17)

[State 13899]
type = VarSet
trigger1 = !Time
fvar(0) = Helper(10000), FVar(0)

[State 13899]
type = VarSet
trigger1 = !Time
fvar(1) = Helper(10000), FVar(1)

[State 13899]
type = VarSet
trigger1 = !Time
fvar(2) = Helper(10000), FVar(2)

[State 13899, Safety]
type = LifeAdd
trigger1 = !Time
value = - Ceil(Var(2) * 1.62)

[State 17015, Vars]
type = ChangeState
trigger1 = !Time
value = IfElse(StateType = S, 13900, IfElse(StateType = C, 13910, 13920))
ignorehitpause = 1


;---------------------------------------------------------------------------
; Stand get-hit (shaking)
[Statedef 13900]
type    = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Var(1) != [3,5]
value = ifelse((Var(0) = 1),5000,5010) + Var(1)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Var(1) = [3,5]
value = 5030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (Var(1) = [4,5]) && (SelfAnimExist(5047 + Var(1)))
value = 5047 + Var(1) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = FVar(1) != 0 || Var(3)
trigger2 = Pos Y != 0
statetype = a

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 5000, 6]
type = ChangeState
trigger1 = Time > Var(6)
trigger1 = FVar(1) = 0 && !Var(3)
value = 13901 ;Stand get-hit (knocked back)

[State 5000, 7]
type = ChangeState
trigger1 = Time > Var(6)
value = 13930

;---------------------------------------------------------------------------
; Stand get-hit (knocked back)
[Statedef 13901]
type    = S
movetype= H
physics = S

[State 5001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5001, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5005 + Var(1) + (Var(0)=2)*10

[State 5001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= Var(4)
x = .6

[State 5001, 4]
type = VelSet
trigger1 = !Time
x = fvar(0)

[State 5001, 4]
type = VelSet
trigger1 = Time > Var(5)
x = 0

[State 5001, 5]
type = DefenceMulSet
trigger1 = Time > Var(5)
value = 1

[State 5001, 6]
type = ChangeState
trigger1 = Time > Var(5)
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Crouch get-hit (shaking)
[Statedef 13910]
type    = C
movetype= H
physics = N
velset = 0,0

[State 5010, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Var(1) != [3,5]
value = 5020 + Var(1)

[State 5010, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Var(1) = [3,5]
value = 5030

[State 5010, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (Var(1) = [4,5]) && (SelfAnimExist(5047 + Var(1)))
value = 5047 + Var(1) ;5051 - 4 + type

[State 5010, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5010, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
triggerall = Time = 0
trigger1 = FVar(1) != 0 || Var(3)
trigger2 = Pos Y != 0
statetype = a

[State 5010, 6]
type = ChangeState
trigger1 = Time > Var(6)
trigger1 = FVar(1) = 0 && !Var(3)
value = 13911 ;Crouch get-hit (knocked back)

[State 5010, 7]
type = ChangeState
trigger1 = Time > Var(6)
value = 13930

[State 5010, FFB Light]
type = ForceFeedback
trigger1 = anim = 5020
persistent = 0
time = 6
waveform = square

[State 5010, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5021
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5010, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5022
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; Crouch get-hit (knocked back)
[Statedef 13911]
type    = C
movetype= H
physics = C

[State 5011, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5011, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5025 + Var(1)

[State 5001, 4]
type = VelSet
trigger1 = !Time
x = fvar(0)

[State 5011, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= Var(4)
x = .6

[State 5011, 4]
type = VelSet
trigger1 = Time > Var(5)
x = 0

[State 5011, 5]
type = DefenceMulSet
trigger1 = Time > Var(5)
value = 1

[State 5011, 6]
type = ChangeState
trigger1 = Time > Var(5)
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Air get-hit (shaking)
[Statedef 13920]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5020, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Var(1) != [3,5]
value = ifelse((Var(7) = 1),5000,5010) + Var(1)

[State 5020, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Var(1) = [3,5]
value = 5030

[State 5020, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (Var(1) = [4,5]) && (SelfAnimExist(5047 + Var(1)))
value = 5047 + Var(1) ;5051 - 4 + type

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5020, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 13930

[State 5020, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5020, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5020, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
trigger4 = anim = [5051,5059]
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; Air get-hit (knocked away)
[Statedef 13930]
type    = A
movetype= H
physics = N
ctrl = 0

[State 5030, 1]
type = ChangeAnim
trigger1 = Anim != [5000, 5199]
trigger1 = SelfAnimExist(5030)
value = 5030


[State 5001, 4]
type = VelSet
trigger1 = !Time
x = fvar(0)
y = fvar(1)

[State 5030, 2]
type = VelAdd
trigger1 = 1
y = FVar(2)

[State 5030, 3]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5030, 4]
type = ChangeState
triggerall = !Var(13)
trigger1 = Time > Var(5)
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= Const(movement.air.gethit.groundlevel)
value = 5040 ;HITA_RECOV

[State 5030, 5]
type = ChangeState
triggerall = !Var(13)
trigger1 = Time > Var(5)
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= Const(movement.air.gethit.groundlevel)
value = 5050 ;HITA_FALL

[State 5030, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 13935 ;Air get-hit (transition)

;---------------------------------------------------------------------------
; Air get-hit (transition)
[Statedef 13935]
type    = A
movetype= H
physics = N

[State 5035, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059] ;Not if in hit up anim
trigger1 = Anim != 5090 ;Not if hit off ground anim
value = 5035

[State 5035, 2]
type = VelAdd
trigger1 = 1
y = FVar(2)

[State 5035, 3]
type = ChangeState
triggerall = !Var(13)
trigger1 = Time > Var(5) ;Hit is over
trigger2 = AnimTime = 0 ;Animation over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= Const(movement.air.gethit.groundlevel)
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 5040 ;Air get-hit (recovering in air, not falling)

[State 5035, 4]
type = ChangeState
triggerall = Var(13)
trigger1 = Time > Var(5)  ;Hit is over
trigger2 = AnimTime = 0 ;Anim is over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= Const(movement.air.gethit.groundlevel)
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 5050 ;Air get-hit (falling)
