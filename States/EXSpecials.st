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
supermovetime = 9999

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





