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
trigger1 = Var(23) = 1
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
trigger1 = Var(23) = 1
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
trigger1 = Var(23) = 1
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
X = (Helper(10000), Pos X - 12) * Facing

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
