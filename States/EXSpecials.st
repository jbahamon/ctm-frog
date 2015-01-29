; Stand Appearance Attack
[Statedef 14000]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 13000
sprpriority = 2
poweradd = IfElse(Var(21) > 0, 0, 18)
facep2 = 1
velset = 0,0

[State 803, Safety]
type = ChangeState
triggerall = !Time
trigger1 = Var(23)
trigger2 = NumHelper(10000)
value = 0
ctrl = 1

[State 13801, Masa & Mune]
type = helper
triggerall = !NumHelper(10000)
trigger1 = !Time
stateno = 17210
ID = 10000
name = "Masa&Mune"
postype = p1
pos = 10,-20
ownpal = 1
persistent = 0

[State 803, Safety]
type = VarSet
trigger1 = NumHelper(10000)
V = 23
value = 1

[State 803, Safety]
type = ChangeState
triggerall = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17011
value = 0
ctrl = 1


; Muda Muda - No Stand
[Statedef 14010]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 13000
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 18)
facep2 = 1
velset = 0,0

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command="qcfc", 2, IfElse(Command = "qcfb", 1, 0))

[State 803, Safety]
type = ChangeState
triggerall = !Time
trigger1 = Var(23)
trigger2 = NumHelper(10000)
value = 0
ctrl = 1

[State 13801, Masa & Mune]
type = helper
triggerall = !NumHelper(10000)
trigger1 = !Time
stateno = 17220
ID = 10000
name = "Masa&Mune"
postype = p1
pos = 10,-10
ownpal = 1
persistent = 0

[State 803, Safety]
type = ChangeState
trigger1 = NumHelper(10000)
value = 0
ctrl = 1

; Muda Muda - W/Stand
[Statedef 14015]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 13300
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 18)
facep2 = 1
velset = 0,0

[State 803, Safety]
type = VarSet
trigger1 = !Time
v = 1
value = 0

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command="qcfc", 2, IfElse(Command = "qcfb", 1, 0))

[State 803, Safety]
type = VarSet
trigger1 = !Var(1)
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17225
v = 1
value = 1

[State 803, Safety]
type = VelSet
trigger1 = Var(1) = 1
x = IfElse(Var(0) = 2, 1, IfElse(Var(0) = 1, .5, 0))
ignorehitpause = 1


[State 803, Safety]
type = ChangeState
trigger1 = !NumHelper(10000)
trigger2 = Var(1) = 1
trigger2 = NumHelper(10000)
trigger2 = Helper(10000), StateNo = 17011
value = 0
ctrl = 1


; Muda Muda Air - W/Stand
[Statedef 14016]
type    = A
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 13301
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 18)
facep2 = 1

[State 1100, Velocity]
type = VelMul
triggerall = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17226
trigger1 = Helper(10000), AnimElem = 2
x = .067
y = .067

[State 1100, Velocity]
type = VarSet
triggerall = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17226
trigger1 = Helper(10000), AnimElem = 2
fvar(0) = Vel X

[State 1100, Velocity]
type = VarSet
triggerall = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17226
trigger1 = Helper(10000), AnimElem = 2
fvar(1) = Vel Y

[State 1100, Velocity]
type = VelSet
triggerall = NumHelper(10000)
trigger1 = Helper(10000), AnimElemTime(2) >= 0
trigger1 = Helper(10000), AnimElemTime(31) < 0
x = fvar(0)+(1.17*command = "holdfwd")-(.63*command = "holdback")
y = fvar(1)-(3.21*command = "holdup")

[State 1100, Velocity]
type = VelSet
triggerall = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 31
x = fvar(0)

[State 4030, Gravity]
type = VarAdd
triggerall = NumHelper(10000)
trigger1 = Helper(10000), AnimElemTime(2) >= 0
fvar(1) = IfElse(Helper(10000), AnimElemTime(31) > 0, .5, .033)

[State 1100, Velocity]
type = PosFreeze
triggerall = NumHelper(10000)
trigger1 = Helper(10000), animelemtime(2) < 0


[State 803, Safety]
type = VarSet
trigger1 = !Time
v = 1
value = 0

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command="qcfc", 2, IfElse(Command = "qcfb", 1, 0))

[State 803, Safety]
type = VarSet
trigger1 = !Var(1)
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17226
v = 1
value = 1

[State 803, Safety]
type = PosSet
trigger1 = Vel Y > 0 && Vel Y >= - Pos Y
Y = 0

[State 803, Safety]
type = ChangeState
trigger1 = Vel Y > 0 && Vel Y >= - Pos Y
value = 52
ctrl = 0

[State 803, Safety]
type = ChangeState
trigger1 = !NumHelper(10000)
trigger2 = Var(1) = 1
trigger2 = NumHelper(10000)
trigger2 = Helper(10000), StateNo = 17011
value = 50
ctrl = 0


; MUDAA - No Stand
[Statedef 14020]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 13000
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 18)
facep2 = 1
velset = 0,0

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command="qcbc", 2, IfElse(Command = "qcbb", 1, 0))

[State 803, Safety]
type = ChangeState
triggerall = !Time
trigger1 = Var(23)
trigger2 = NumHelper(10000)
value = 0
ctrl = 1

[State 13801, Masa & Mune]
type = helper
triggerall = !NumHelper(10000)
trigger1 = !Time
stateno = 17230
ID = 10000
name = "Masa&Mune"
postype = p1
pos = 10,-10
ownpal = 1
persistent = 0

[State 803, Safety]
type = ChangeState
trigger1 = NumHelper(10000)
value = 0
ctrl = 1

; MUDAA - W/Stand
[Statedef 14025]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 13300
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 18)
facep2 = 1
velset = 0,0

[State 803, Safety]
type = VarSet
trigger1 = !Time
v = 1
value = 0

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command="qcbc", 2, IfElse(Command = "qcbb", 1, 0))

[State 803, Safety]
type = VarSet
trigger1 = !Var(1)
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17235
v = 1
value = 1

[State 7010, appear]
type = VarSet
trigger1 = NumHelper(10000) 
fvar(0) = (Helper(10000), Pos X - Pos X - 12) * Facing
ignorehitpause = 1

[State 7010, appear]
type = VelSet
triggerall = NumHelper(10000) 
trigger1 = fvar(0) > 0
X = IfElse(fvar(0) > 7, 7, fvar(0))
ignorehitpause = 1

[State 803, Safety]
type = PosSet
trigger1 = NumHelper(10000) && fvar(0)
trigger1 = fvar(0) < 0
X = (Helper(10000), Pos X - 12)

[State 1100, Velocity]
type = VelSet
trigger1 = fvar(0) <= 0
x = 0

[State 803, Safety]
type = ChangeState
trigger1 = !NumHelper(10000)
trigger2 = Var(1) = 1
trigger2 = NumHelper(10000)
trigger2 = Helper(10000), StateNo = 17011
value = 0
ctrl = 1 


; MUDAA - W/Stand
[Statedef 14026]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 13300
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 18)
facep2 = 1
velset = 0,0

[State 803, Safety]
type = VarSet
trigger1 = !Time
v = 1
value = 0

[State 803, Safety]
type = VarSet
trigger1 = !Var(1)
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17236
v = 1
value = 1

[State 7010, appear]
type = VarSet
trigger1 = NumHelper(10000) 
fvar(0) = (Helper(10000), Pos X - Pos X - 12) * Facing
ignorehitpause = 1

[State 7010, appear]
type = VelSet
triggerall = NumHelper(10000) 
trigger1 = fvar(0) > 0
X = IfElse(fvar(0) > 7, 7, fvar(0))
ignorehitpause = 1

[State 803, Safety]
type = PosSet
trigger1 = NumHelper(10000) && fvar(0)
trigger1 = fvar(0) < 0
X = (Helper(10000), Pos X - 12)

[State 1100, Velocity]
type = VelSet
trigger1 = fvar(0) <= 0
x = 0

[State 803, Safety]
type = ChangeState
trigger1 = !NumHelper(10000)
trigger2 = Var(1) = 1
trigger2 = NumHelper(10000)
trigger2 = Helper(10000), StateNo = 17011
value = 0
ctrl = 1 

; The World
[Statedef 14030]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 14030
sprpriority = 2
poweradd = 0
velset = 0,0

[State 1030, whatbuttondidyoupress?]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command="dfc", 2, IfElse(Command = "dfb", 1, 0))

[State 803, Safety]
type = PosSet
trigger1 = AnimElem = 3
X = IfElse(Var(0) = 2, 100, IfElse(Var(0) = 1, 0, -100))


[State 13801, AfterImage]
type = helper
trigger1 = AnimElem = 3
stateno = 14031
ID = 14030
name = "The World Afterimage"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0

[State 9606, EnvColor]
type = palfx
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 0
add = 216,216,152
time = 1
persistent = 1
ignorehitpause = 1

[State 9606, EnvColor]
type = palfx
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(4) < 4
add = -64,-64,-64
time = 1
persistent = 1
ignorehitpause = 1

[State 9606, EnvColor]
type = palfx
trigger1 = animelemtime(4) >= 4
trigger1 = animelemtime(4) < 8
add = 120,120,192
time = 1
persistent = 1
ignorehitpause = 1

[State 803, Safety]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


; The World AfterImage
[Statedef 14031]
type    = S
movetype= I
physics = N
ctrl = 0
anim = 14031
sprpriority = 2
poweradd = 0
velset = 0,0


[State 1030, whatbuttondidyoupress?]
type = OffSet
trigger1 = 1
X = IfElse(Time % 2, -1, 1) * (10 - Time)

[State 803, Safety]
type = Turn
trigger1 = Parent, Facing != Facing


[State 9606, EnvColor]
type = palfx
trigger1 = Parent, animelemtime(3) >= 0
trigger1 = Parent, animelemtime(4) < 0
add = 216,216,152
time = 1
persistent = 1
ignorehitpause = 1

[State 9606, EnvColor]
type = palfx
trigger1 = Parent, animelemtime(4) >= 0
trigger1 = Parent, animelemtime(4) < 4
add = -64,-64,-64
time = 1
persistent = 1
ignorehitpause = 1

[State 9606, EnvColor]
type = palfx
trigger1 = Parent, animelemtime(4) >= 4
trigger1 = Parent, animelemtime(4) < 8
add = 120,120,192
time = 1
persistent = 1
ignorehitpause = 1


[State 803, Safety]
type = DestroySelf 
trigger1 = Parent, StateNo != 14030
trigger2 = Time > 10
