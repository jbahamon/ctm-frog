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
anim = 15002
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
type = VarSet
trigger1 = !Time
fv = 0
value = 16 * Random/1000.0

[State 2010, End]
type = AngleDraw
trigger1 = 1
value = Time * FVar(0)

[State 1006, End]
type = AssertSpecial
trigger1 = Time % 3
flag = invisible
flag2 = noshadow

[State 1006, End]
type = VelMul
trigger1 = !Time
X = -0.3

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
trigger1 = (Var(0) || Time > 3) && NumHelper(10000)
trigger1 = Helper(10000), StateNo != 17300
trigger2 = !NumHelper(10000)
value = 0
ctrl = 1


; Checkmate (Air, W/Stand)
[Statedef 15015]
type    = A
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 13301
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
trigger1 = Helper(10000), StateNo = 17305
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
stateno = 15016
ID = 15016
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Random % 60)
ownpal = 1

[State 1000, Knife 2]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15016
ID = 15016
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Random % 60)
ownpal = 1

[State 1000, Knife 3]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15016
ID = 15016
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Random % 60)
ownpal = 1

[State 1000, Knife 4]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15016
ID = 15016
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Random % 60)
ownpal = 1

[State 1000, Knife 5]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15016
ID = 15016
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Random % 60)
ownpal = 1

[State 1000, Knife 6]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15016
ID = 15016
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Random % 60)
ownpal = 1

[State 1000, Knife 7]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15016
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Random % 60)
ownpal = 1

[State 1000, Knife 8]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15016
ID = 15001
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Random % 60)
ownpal = 1

[State 1000, Knife 9]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15016
ID = 15016
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Random % 60)
ownpal = 1

[State 1000, Knife 1]
type = helper
trigger1 = NumHelper(10000)
trigger1 = Helper(10000), AnimElem = 5
helpertype = normal
stateno = 15016
ID = 15016
name = "Masamune Knife"
postype = p1
pos = Floor(-40 + Random % 60), Floor(- Random % 60)
ownpal = 1

[State 2010, End]
type = VarSet
trigger1 = !Time
var(1) = 0
persistent = 0

[State 2010, End]
type = VarSet
trigger1 = (Var(0) || Time > 3) && NumHelper(10000)
trigger1 = Helper(10000), StateNo != 17305
trigger2 = !NumHelper(10000)
trigger3 = Var(0) && NumHelper(10000)
trigger3 = (Helper(10000), Anim = 15010) && Helper(10000), AnimElem = 5
var(1) = 1
persistent = 0

[State 2010, End]
type = VelAdd
trigger1 = Var(1)
Y = 0.4

[State 1100, ChangeState]
type = ChangeState
triggerall = Var(1)
trigger1 = Pos Y >= -Vel Y && Vel Y > 0
value = 52

;Masamune-Knife (Air)
[Statedef 15016]
type = A
physics = N
movetype = A
anim = 15016
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 803, Pal]
type = AngleDraw
trigger1 = 1
value = -32

[State 1005, Vel]
type = velset
trigger1 = 1
x = 10
y = 6.4

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
fvar(39) = parent, Fvar(39)*0.91
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(21 * root, fvar(39)), 4
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

[State 1005, End]
type = changestate
trigger1 = Pos Y >= 0
value = 15002
ignorehitpause = 1

; Road Roller Da
[Statedef 15020]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 15020
sprpriority = 2
poweradd = -1000
facep2 = 1 	
velset = 0,0

[State 3003, fall]
type = VarSet
trigger1 = !Time
v = 0
value = 0;Random % 2

[State 3003, fall]
type = VarSet
trigger1 = !Time
trigger1 = !Var(0)
v = 1
value = 60

[State 3003, fall]
type = VarSet
trigger1 = !Time
trigger1 = Var(0)
v = 1
value = 20

[State 2010, Liftoff]
type = VelSet
trigger1 = Anim = 15020
trigger1 = AnimElemTime(1) = 5
Y = -12
persistent = 0

[State 1100, Velocity]
type = VelSet
trigger1 = Anim = 15020
trigger1 = AnimElem = 2
y = 0
persistent = 0

[State 1100, Positioning]
type = PosSet
trigger1 = Anim = 15020
trigger1 = AnimElem = 2
y = -299
persistent = 0

[State 1100, Positioning]
type = PosAdd
trigger1 = Anim = [15022, 15023]
x = (P2Dist X) - 50
persistent = 0

[State 1100, Velocity]
type = VelSet
trigger1 = Anim = [15022, 15023]
x = 5
y = 25
persistent = 0

[State 2010, Super Pause FX]
type = StateTypeSet
trigger1 = Anim = 15020
trigger1 = AnimElemTime(1) = 5
statetype = A
physics = N

[State 2010, Super Pause FX]
type = ChangeAnim
trigger1 = Anim = 15020
trigger1 = !AnimTime
value = 15022 + Var(0)

[State 2010, Super Pause FX]
type = ScreenBound
trigger1 = AnimElemTime(1) > 1 || Anim = [15022, 15023]
value = 1
movecamera = 30, 0
ignorehitpause = 1

[State 2010, Super Pause FX]
type = helper
trigger1 = AnimElem = 2
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
trigger1 = Anim = 15020
trigger1 = AnimElem = 2
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
trigger1 = Anim = 15020
trigger1 = Animelem = 2
time = 45
movetime = 45
anim = -1
sound = S7050,3
p2defmul = 1
darken = 0

[State 2010, Super Pause FX]
type = helper
trigger1 = Anim = 15020
trigger1 = AnimElem = 2
helpertype = normal
stateno = 15025 + Var(0)
ID = 7000
name = "Frog/Tank"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
pausemovetime = 9999
supermovetime = 9999

[State 3003, fall]
type = PosSet
trigger1 = Pos Y > - Vel Y - Var(1)
trigger1 = Vel Y > 0
Y = -Var(1)
ignorehitpause = 1

[State 3003, fall]
type = EnvShake
trigger1 = Pos Y > - Vel Y - Var(1)
trigger1 = Vel Y > 0
time = 12
freq = 120
ampl = 8
ignorehitpause = 1

[State 1100, ChangeState]
type = ChangeState
trigger1 = Pos Y > - Vel Y - Var(1)
trigger1 = Vel Y > 0
value = IfElse(NumTarget, 15022, 15021)
ignorehitpause = 0

[State 220, 1]
type = Hitdef
trigger1 = Anim = 15022 + Var(0)
attr = A, HA
hitflag = MAF
guardflag = HA
animtype = heavy
air.animtype = back
fall.animtype = back
priority = 5,Hit
damage = 70,0
pausetime = 7,7
guard.pausetime = 7,7
sparkno = S8204
guard.sparkno = S8100
sparkxy = -20, 100
hitsound = S1,2
guardsound = S4,0
ground.type = High
air.type = High
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = -6
guard.velocity = -5.5
air.velocity = -7.5,-5.5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getpower = 0,0
givepower = 10,0
persistent = 0
envshake.time = 24
envshake.ampl = 8
fall = 0
air.fall = 0
fall.recover = 0
yaccel = .35;44
kill = 0
guard.kill = 0
p2facing = 1

[State 901, Throw]
type = TargetState
trigger1 = time > 1 && numtarget
value = 15027
ignorehitpause = 1
persistent = 0

; Road Roller Da Miss/Block
[Statedef 15021]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 15021
sprpriority = 2
facep2 = 1
velset = 0,0

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = -4.5
y = -7.5

[State 2601, EnvShake]
type = EnvShake
trigger1 = !Time
time = 30
ampl = 5

[State 1100, Velocity]
type = VelAdd
trigger1 = animelemtime(2) > 0
y = .4

[State 1100, ChangeState]
type = ChangeState
trigger1 = animelemtime(9) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 52


; Road Roller Da Success
[Statedef 15022]
type    = A
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 15021
sprpriority = 2
facep2 = 1 	
velset = 0,0

[State 200, 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = !Time
pos = -25, -ceil(Pos Y)
ignorehitpause = 1

[State 200, 7]
type = screenbound
trigger1 = 1
value = 0

[State 170, 1]
type = NotHitBy
trigger1 = animelemtime(54) >= 0
value = SCA

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 54
x = -3.5
y = -5

[State 2601, EnvShake]
type = EnvShake
trigger1 = animelem = 1
trigger2 = animelem = 29
trigger3 = animelem = 35
trigger4 = animelem = 41
time = 25
ampl = 5

[State 2601, EnvShake]
type = EnvShake
trigger1 = animelem = 49
time = 25
ampl = 8

[State 1100, Velocity]
type = VelAdd
trigger1 = animelemtime(54) > 0
y = .3

[State 220, 1]
type = Hitdef
trigger1 = AnimElemTime(AnimElemNo(0)) = 0
trigger1 = AnimElemNo(0) = [28, 48]
trigger1 = AnimElemNo(0) % 4 = 3
attr = A, HA
hitflag = MAF
guardflag = HA
animtype = heavy
air.animtype = back
fall.animtype = back
priority = 5,Hit
damage = 16,0
pausetime = 1,64
guard.pausetime = 1,2
sparkno = S-1
guard.sparkno = S8100
sparkxy = -20, 0
hitsound = S1,1
guardsound = S4,0
ground.type = High
air.type = High
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = 0
guard.velocity = 0
air.velocity = -4,-3
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getpower = 0,0
givepower = 10,0
persistent = 1
fall = 0
air.fall = 0
fall.recover = 0
yaccel = .35;44
kill = 0
guard.kill = 0
p2facing = 1

[State 220, 1]
type = Hitdef
trigger1 = AnimElemTime(AnimElemNo(0)) = 0
trigger1 = AnimElemNo(0) = [28, 48]
trigger1 = AnimElemNo(0) % 4 = 1
attr = A, HA
hitflag = MAF
guardflag = HA
animtype = heavy
air.animtype = back
fall.animtype = back
priority = 5,Hit
damage = 0
pausetime = 1,64
guard.pausetime = 1,2
sparkno = S-1
guard.sparkno = S8100
sparkxy = -20, 0
hitsound = S1,1
guardsound = S4,0
ground.type = High
air.type = High
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = 0
guard.velocity = 0
air.velocity = -4,-3
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getpower = 0,0
givepower = 10,0
persistent = 1
fall = 0
air.fall = 0
fall.recover = 0
yaccel = .35;44
kill = 0
guard.kill = 0
p2facing = 1

[State 220, 1]
type = Hitdef
trigger1 = animelem = 50
attr = A, HA
hitflag = MAF
guardflag = HA
animtype = heavy
air.animtype = back
fall.animtype = back
priority = 5,Hit
damage = 283,0
pausetime = 6,7
guard.pausetime = 6,7
sparkno = S-1
guard.sparkno = S8100
sparkxy = -20, 0
hitsound = S1,1
guardsound = S4,0
ground.type = High
air.type = High
ground.slidetime = 11
ground.hittime = 11
air.hittime = 11
guard.ctrltime = 11
ground.velocity = -4,-3
guard.velocity = 0
air.velocity = -4,-3
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getpower = 0,0
givepower = 10,0
persistent = 0
fall = 1
air.fall = 1
fall.recover = 0
yaccel = .35;44
guard.kill = 0
p2facing = 1


[State 200, 7]
type = TargetBind
trigger1 = numtarget
trigger1 = win
trigger1 = animelemtime(50) >= 0
pos = -25,100
time = -1
ignorehitpause = 1
persistent = 0

[State 200, 7]
type = TargetState
trigger1 = numtarget
trigger1 = animelemtime(50) >= 0
value = 15030
ignorehitpause = 0
persistent = 0

[State 200, 7]
type = null;TargetState
trigger1 = numtarget
trigger1 = win
trigger1 = animelemtime(50) >= 0
value = 15029
ignorehitpause = 1
persistent = 0

[State 1100, ChangeState]
type = ChangeState
trigger1 = animelemtime(54) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
trigger1 = backedgebodydist < 0
value = 15023

[State 1100, ChangeState]
type = ChangeState
trigger1 = animelemtime(54) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 52

[State 1100, ChangeState]
type = ChangeState
trigger1 = animelem = 51
trigger1 = win
value = 15033

; Landed Off-Screen
[Statedef 15023]
type = S
movetype = I
physics = N
ctrl = 0
anim = 0
velset = 0,0

[State 200, 7]
type = screenbound
trigger1 = 1
value = 0

[State 2500, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim

[State 2500, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 200, 7]
type = ChangeState
trigger1 = backedgebodydist < 0 || frontedgebodydist < 0
value = 15024

[State 200, 7]
type = ChangeState
trigger1 = time > 3
value = 0
ctrl = 1

; Landed Off-Screen - Run
[Statedef 15024]
type = S
physics = N
velset = 0,0
ctrl = 0

[State 220, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3000, AfterImage]
type = AfterImageTime
trigger1 = time = 0
value = 0

[State 2500, ChangeAnim]
type = ChangeAnim
trigger1 = frontedgebodydist < 0
trigger1 = time = 0
value = 5

[State 2500, ChangeAnim]
type = ChangeAnim
trigger1 = frontedgebodydist >= 0
trigger1 = time = 0
trigger2 = anim = 5 && animtime = 0
value = 100

[State 100, 2]
type = turn
trigger1 = anim = 5 && animelem = 1

[State 2500, ChangeAnim]
type = ChangeAnim
triggerall = Anim = 100
triggerall = !AnimTime
trigger1 = backedgebodydist >= -50
trigger1 = frontedgebodydist >= -50
value = 15024

[State 2500, ScreenBound]
type = screenbound
trigger1 = backedgebodydist < 25 || frontedgebodydist < 25
value = 0

[State 2500, VelSet]
type = VelSet
triggerall = anim = 100
trigger1 = animelem = 3
x = 10
persistent = 0

[State 2500, VelSet]
type = VelMul
trigger1 = Anim = 15024
x = .9

[State 2500, VelSet]
type = VelSet
triggerall = Anim = 15024
trigger1 =  AnimElemTime(1) = 9
x = 0

[State 2500, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 2500, ChangeState]
type = ChangeState
trigger1 = Anim = 15024
trigger1 = !AnimTime
value = 0
ctrl = 1

;Big Frog
[Statedef 15025]
anim = 3013
sprpriority = 1

[State 3015, Fade]
type = varset
trigger1 = !Time
persistent = 0
var(1) = 0

[State 3015, PalFX]
type = VarSet
trigger1 = 1
var(0) = (32 * GameTime) % 360

[State 3015, PalFX]
type = VarSet
trigger1 = 1
fvar(1) = ((32 * GameTime) % 360)/60.0

[State 3015, PalFX]
type = VarSet
trigger1 = 1
fvar(2) = 128.0 * (fvar(1) - floor(fvar(1)))

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [0,1]
color = 0
time = 1
add = 128, floor(fvar(2)), 0
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [1,2]
color = 0
time = 1
add = 128 - floor(fvar(2)), 128, 0
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [2,3]
color = 0
time = 1
add = 0, 128, floor(fvar(2))
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [3,4]
color = 0
time = 1
add = 0, 128 - floor(fvar(2)), 128 
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [4,5]
color = 0
time = 1
add = floor(fvar(2)), 0, 128 
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [5,6]
color = 0
time = 1
add = 128, 0, 128 - floor(fvar(2))
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [5,6]
color = 0
time = 1
add = 128, 0, 128 - floor(fvar(2))
mul = 200, 200, 200

[State 3015, Fade]
type = Varset
trigger1 = Parent, StateNo != [15020, 15022]
trigger2 = Parent, StateNo = 15022
trigger2 = Parent, Anim = 15021
trigger2 = Parent, AnimElem = 54
persistent = 0
var(1) = 31

[State 3015, PalFX]
type = Trans
trigger1 = !Var(1)
trans = AddAlpha
alpha = 224, 32

[State 3015, PalFX]
type = Trans
trigger1 = Var(1) > 0
trans = AddAlpha
alpha = 7 * Var(1), 7 * (32 - Var(1))

[State 3015, telprot]
type = PosSet
trigger1 = !var(1)
X = Parent, Pos X
Y = Parent, Pos Y

[State 3015, Fade]
type = VarAdd
trigger1 = var(1) > 0
v = 1
value = -1

[State 3015, Fade]
type = DestroySelf
trigger1 = (var(1) = 1)

;Dragon Tank
[Statedef 15026]
anim = 15026
sprpriority = 1

[State 3015, Fade]
type = varset
trigger1 = !Time
persistent = 0
var(1) = 0

[State 3015, Fade]
type = null;varset
trigger1 = Parent, Stateno != 3003
persistent = 0
var(1) = 31

[State 3015, PalFX]
type = Trans
trigger1 = Var(1) > 0
trans = AddAlpha
alpha = 7 * Var(1), 7 * (32 - Var(1))

[State 3015, telprot]
type = PosSet
trigger1 = 1;!var(1)
X = Parent, Pos X
Y = Parent, Pos Y

[State 3015, Fade]
type = VarAdd
trigger1 = var(1) > 0
v = 1
value = -1

[State 3015, Fade]
type = null;DestroySelf
trigger1 = (var(1) = 1)

; Initial Gethit
[Statedef 15027]
type    = S
movetype= H
physics = N
velset = 0,0

[State 1000, 0]
type = PosSet
trigger1 = time = 0
y = 0

[State 1000, 0]
type = HitFallSet
trigger1 = time = 0
value = 0

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
value = 5002

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = time > 138
value = 15028

; Hit Slide
[Statedef 15028]
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
value = 5007

[State 5001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5001, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5001, 6]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1

;Lost by Road Roller
[Statedef 15029]
type    = L
movetype = H
physics = N
velset = 0,0
anim = 5110
sprpriority = -1

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1100, ChangeState]
type = SelfState
trigger1 = time = 1
value = 5150

;---------------------------------------------------------------------------
;Final GetHit
[Statedef 15030]
type = A
movetype = H
physics = N
velset = -5,-7.5

[State 2601, Vel]
type = PosFreeze
trigger1 = 1

[State 2601, SelfState]
type = ChangeState
triggerall = roundstate = 2
trigger1 = time = 2
value = 15031

[State 2601, SelfState]
type = SelfState
trigger1 = time = 2
value = 5050

;---------------------------------------------------------------------------
; Flying Towards Wall
[Statedef 15031]
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
value = 15032

;---------------------------------------------------------------------------
; Wall Bounce
[Statedef 15032]
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

; Special Winpose
[Statedef 15033]
type    = S
movetype = I
physics = N
anim = 3103

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 200, 7]
type = screenbound
trigger1 = 1
value = 1
movecamera = 30,0

[State 3810,5]
type = CtrlSet
trigger1 = time > 80
value = 1

[State 3810,5]
type = Changestate
trigger1 = p2movetype = A
value = 180
ctrl = 1