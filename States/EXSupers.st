; Checkmate
[Statedef 15000]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 15000
sprpriority = 2
poweradd = -1000
facep2 = 1 	
velset = 0,0

[State 2500, NotHitBy]
type = NotHitBy
trigger1 = Anim = 15000
trigger1 = AnimElemNo(0) = 1
value = SCA

[State 2500, NotHitBy]
type = NotHitBy
trigger1 = NumHelper(7000)
value = SCA

[State 2010, Super Pause FX]
type = helper
trigger1 = AnimElem = 4
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
trigger1 = AnimElem = 4
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

[State 2010, Super Pause]
type = superpause
trigger1 = Animelem = 4
time = 45
movetime = 45
anim = -1
sound = S7050,3
p2defmul = 1
darken = 0

[State 2010, End]
type = VelSet
trigger1 = AnimElem = 6
Y = -8

[State 2010, End]
type = StateTypeSet
trigger1 = AnimElem = 6
statetype = A
physics = N

[State 2010, End]
type = VelAdd
trigger1 = Anim = 15000 && AnimElemNo(0) >= 6
trigger2 = Anim = 15004
Y = IfElse(Vel Y > 0, 0.6, 0.4)

[State 2010, End]
type = ChangeAnim
trigger1 = Vel Y > 0
value = 15004
persistent = 0

[State 1000, Knife 1]
type = helper
trigger1 = AnimElemTime(6) = 3
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = 4, -48
ownpal = 1

[State 1000, Knife 2]
type = helper
trigger1 = AnimElemTime(6) = 3
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = 16, -43
ownpal = 1

[State 1000, Knife 3]
type = helper
trigger1 = AnimElemTime(6) = 3
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = 12, -37
ownpal = 1

[State 1000, Knife 4]
type = helper
trigger1 = AnimElemTime(6) = 3
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = 22, -13
ownpal = 1

[State 1000, Knife 5]
type = helper
trigger1 = AnimElemTime(6) = 3
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = 16, 0
ownpal = 1

[State 1000, Knife 6]
type = helper
trigger1 = AnimElemTime(6) = 3
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = 8, 12
ownpal = 1

[State 1000, Knife 7]
type = helper
trigger1 = AnimElemTime(6) = 3
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = 11, 5
ownpal = 1

[State 1000, Knife 8]
type = helper
trigger1 = AnimElemTime(6) = 3
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = 17, -26
ownpal = 1

[State 1000, Knife 9]
type = helper
trigger1 = AnimElemTime(6) = 3
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = 17, -18
ownpal = 1

[State 2010, End]
type = ChangeState
trigger1 = Pos Y >= -Vel Y && Vel Y >= 0
trigger1 = Anim = 15004
value = 52
ctrl = 0

;Masamune-Knife
[Statedef 15001]
type = S
physics = N
movetype = A
anim = 15001
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 803, Pal]
type = PalFX
trigger1 = Time < 8
add = Floor(128 * Cos(Time * Pi/8.0)) + 128, Floor(128 * Cos(Time * Pi/8.0)) + 128, Floor(128 * Cos(Time * Pi/8.0)) + 128
mul = 256, 256, 256
time = 1

[State 803, Pal]
type = PalFX
trigger1 = !Time
add = 256, 256, 256
mul = 256, 256, 256
time = 1

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 15002
ignorehitpause = 1

[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1005, timevar]
type = varadd
trigger1 = time && var(1) < 25
var(1) = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = 7
y = 0

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = S7020,5
channel = 1
persistent = 0
ignorehitpause = 1

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
trigger1 = !(target, time) && target, movetype = H
fvar(39) = parent, Fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(31 * root, fvar(39)), 4
animtype = Heavy
hitflag = MAF
guardflag = MA
air.animtype = back
fall.animtype = back
pausetime = 0, 4
sparkno = -1
guardsound = s2, 0
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 17
air.hittime = 17
guard.ctrltime = 17
ground.velocity = -1.8,-8.6
guard.velocity = -8
air.velocity = -1.8,-8.6
airguard.velocity = -4.2,-3.2
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0,0
givepower = 10,0
fall = 1
air.fall = 1
fall.recover = 1
yaccel = .35
guard.kill = 0
p2facing = 1
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(21)), -4, -8) * 0.6, -1.5 * 0.6
forcestand = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 15003
ignorehitpause = 1

[State 1006, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

; Knife GetHit/Block
[Statedef 15002]
type = A
physics = N
movetype = I
anim = 15001
velset = Vel X, -3 - (Random % 4)
ctrl = 0
sprpriority = 4
movehitpersist = 1

[State 1005, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1


[State 2010, End]
type = AngleDraw
trigger1 = 1
value = Time * 12

[State 1006, End]
type = AssertSpecial
trigger1 = Time % 2
flag = invisible
flag2 = noshadow

[State 1006, End]
type = VelMul
trigger1 = !Time
X = -0.6

[State 1006, End]
type = VelAdd
trigger1 = 1
Y = 0.5

[State 1006, End]
type = destroyself
trigger1 = !animtime
trigger2 = Pos Y >= - Vel Y && Vel Y >= 0


; Knife Hit
[Statedef 15003]
type = A
physics = N
movetype = I
anim = 15003
velset = 0,0
ctrl = 0
sprpriority = 4
movehitpersist = 1

[State 1006, End]
type = ChangeState
trigger1 = !AnimTime
value = 15002
ctrl = 0

; Checkmate (W/Stand)
[Statedef 15010]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 13000
sprpriority = 2
poweradd = -1000
facep2 = 1 	
velset = 0,0

[State 2010, Super Pause FX]
type = VarSet
trigger1 = !Time
v = 0
value = 0

[State 2010, Super Pause FX]
type = VarSet
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17300
v = 0
value = 1
persistent = 0

[State 2010, Super Pause FX]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 3
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999


[State 2010, Super Pause FX]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 3
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
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 3
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

[State 2010, Super Pause]
type = superpause
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 3
time = 45
movetime = 45
anim = -1
sound = S7050,3
p2defmul = 1
darken = 0

[State 1000, Knife 1]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 2]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 3]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 4]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 5]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 6]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 7]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 8]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 9]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 1]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1


[State 2010, End]
type = ChangeState
trigger1 = Var(0) && NumHelper(10000)
trigger1 = Helper(10000), StateNo != 17300
trigger2 = !NumHelper(10000)
value = 0
ctrl = 1


; Checkmate (Air, W/Stand)
[Statedef 15015]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 13000
sprpriority = 2
poweradd = -1000
facep2 = 1 	
velset = 0,0

[State 2010, Super Pause FX]
type = VarSet
trigger1 = !Time
v = 0
value = 0

[State 2010, Super Pause FX]
type = VarSet
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), StateNo = 17300
v = 0
value = 1
persistent = 0

[State 2010, Super Pause FX]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 3
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999


[State 2010, Super Pause FX]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 3
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
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 3
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

[State 2010, Super Pause]
type = superpause
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 3
time = 45
movetime = 45
anim = -1
sound = S7050,3
p2defmul = 1
darken = 0

[State 1000, Knife 1]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 2]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 3]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 4]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 5]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 6]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 7]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 8]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 9]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1

[State 1000, Knife 1]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15001
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Pos Y - Random % 60)
ownpal = 1


[State 2010, End]
type = ChangeState
trigger1 = Var(0) && NumHelper(10000)
trigger1 = Helper(10000), StateNo != 17300
trigger2 = !NumHelper(10000)
value = 0
ctrl = 1

