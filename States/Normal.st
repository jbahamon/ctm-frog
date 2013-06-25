;===========================================================================
; Standing Moves
;===========================================================================

;Standing Light
[StateDef 200]
anim = 200
ctrl = 0
type = S
movetype = A
physics = S
sprpriority = 1
velset = 0,0
poweradd = 0
juggle = 2 

[State 200, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000,0

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7020
ID = 200
pos = 4, -35
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 200, HitDef]
type = HitDef
trigger1 = !Time
attr = S, NA      
damage = 20,0
animtype=Light   
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8,8
sparkno=S7001
sparkxy= 0,-40
hitsound = S7001,0
guardsound = 6,0         
ground.type = High    
ground.slidetime = 4  
ground.hittime  = 9  
ground.velocity = -2
air.velocity = -2,-2
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
getpower=72, 36
givepower=36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 200, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl=1

;Standing Medium
[Statedef 210]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 18
ctrl = 0
velset = 0,0
anim = 210
sprpriority=1

[State 200, Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,1

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 7021
ID = 210
pos = 10, 4
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 210, hit]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA
animtype  = Medium
damage    = 41
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7001,1
guardsound = 6,0
sparkno=s7002
sparkxy=-8,5
ground.type = High
ground.slidetime = 7
ground.hittime  = 13
ground.velocity = -1
air.velocity = 0,4
animtype=Medium
air.animtype=Medium
getpower = ifelse(p2movetype = H, 72, 144), 36
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 210, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Standing Strong
[Statedef 220]
type=S
physics=N
movetype=A
anim=220
ctrl=0
velset=0,0
poweradd=18
juggle = 8
sprpriority=1

[State 220, vel]
type=velset
trigger1=animelem=2
X = 2
y=-8

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7022
ID = 220
pos = 20, -28
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1
removeongethit = 1

[State 200, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000,1

[State 220, hit]
type = HitDef
trigger1 = AnimElem = 2
attr = A, NA
animtype=Diagup
air.animtype=Diagup
damage    = 72
guardflag = MA
pausetime = 12,12
hitsound = S7001,3
guardsound = 6,0
sparkno=s7003
sparkxy=0,0
air.type = Low
ground.slidetime = 11
ground.velocity = 0,-6
air.velocity = 0,-6
fall=1
fall.recover = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=12
getpower = ifelse(p2movetype = H, 72, 144), 36
givepower = 36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 220, change]
type=statetypeset
trigger1=animelemtime(2)>=0
statetype=A
physics=A

[State 220, end]
type=changestate
trigger1= animelem=4 && pos y >= 0
value=52

;===========================================================================
; Crouching Moves
;===========================================================================

;Crouching Light
[StateDef 400]
anim = 400
ctrl=0
type= C 
movetype = A
physics = C
sprpriority=2
velset=0,0
poweradd=0
juggle=2 

[State 400, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,0  

[State 400, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7020
ID = 400
pos = 4, -35
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 400, HitDef]
type = HitDef
trigger1 = Animelem=2   
attr = S, NA           
damage = 23     
priority = 3, Hit       
pausetime = 8,8
sparkno=S7001;
sparkxy= 0,-30
hitsound = S6,1      
guardsound = 6,0         
hitflag = MAF
guardflag = M
ground.type = Low
ground.slidetime = 4 
ground.hittime  = 9  
ground.velocity = -2.3
air.velocity = -2,-2
animtype=Light
air.animtype=Light
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
getpower=72, 36
givepower=36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 400, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Crouching Medium
[StateDef 410]
anim = 410
ctrl=0
type = C
movetype = A
physics = C
sprpriority=1
velset=0,0
poweradd=18
juggle=4 

[State 410, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 420, Explod]
type = Explod
trigger1 = !Time
anim = 7023
ID = 410
pos = 23, 4
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1
removeongethit = 1

[State 410, HitDef]
type = HitDef
trigger1 = Animelem = 2   
attr = S, NA           
damage = 43   
priority = 3, Hit       
pausetime = 12,12
sparkno=S7006
sparkxy=-10,0
hitsound = S6,1      
guardsound = 6,0         
hitflag = MAF
guardflag = L
ground.type = Low
ground.slidetime = 6 
ground.hittime  = 9  
ground.velocity = -2
air.velocity = -2,-2
animtype=Light
air.animtype=Light
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
getpower=72, 36
givepower=36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 410, 1]
type = VelSet
trigger1 = AnimElem = 3
x = 3.5

[State 410, 1]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 420, 1]
type = RemoveExplod
trigger1 = NumExplod(410) && !AnimTime
ID = 410

[State 410, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl=1

;Crouching Strong
[StateDef 420]
anim = 420
ctrl=0
type = C
movetype = A
physics = C
sprpriority=2
velset=0,0
poweradd = 18
juggle=8 

[State 420, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 420, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7023
ID = 420
pos = 35, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1
removeongethit = 1

[State 420, HitDef]
type = HitDef
trigger1 = Animelem=2   
attr = S, NA           
damage = 50
priority = 3, Hit       
pausetime = 15,15
sparkno=S7004
sparkxy=-10,0
hitsound = S6,1      
guardsound = 6,0         
guardflag = L
hitflag = MAF
ground.type = Trip   
ground.slidetime = 6
ground.hittime  = 10
ground.velocity = -3.6
air.velocity = -3,-1.6
animtype=Hard
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
getpower=216, 36
givepower=36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 420, 1]
type = VelSet
trigger1 = AnimElem = 2
x = 5.5

[State 420, 1]
type = VelSet
trigger1 = AnimElem = 3
x = 0

[State 420, 1]
type = RemoveExplod
trigger1 = NumExplod(420) && AnimElem = 3
ID = 420

[State 420, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl=1

;===========================================================================
; Air Moves
;===========================================================================

;Light Air
[Statedef 600]
type=A
physics=A
movetype=A
anim=600
ctrl=0
poweradd=0
juggle=4
sprpriority = 1

[State 600, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,0

[State 600, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7020
ID = 600
pos = 4, -35
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 600, Hitdef]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 20
guardflag = HA
priority = 3
pausetime = 8,8
sparkno=s7001
sparkxy= 0,-40
hitsound   = S7001,0
guardsound = 6,0
ground.type = High
air.type = High
ground.slidetime = 7
ground.hittime  = 5
ground.velocity = -5
air.velocity = -1.3,-5
animtype=Light
air.animtype=Light
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=12
getpower = 72, 36
givepower = 36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

;Medium Air
[Statedef 610]
type=A
physics=A
movetype=A
anim=610
ctrl=0
poweradd=18
juggle=4
sprpriority = 1

[State 610, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 610,freeze]
type=velset
trigger1 = PrevStateNo = 1040
trigger1 = AnimElemNo(0) = 1
x=(vel x)/2
Y = 0

[State 610,freeze]
type = VelSet
trigger1 = !Time
trigger1 = command = "holddownb"
X = 0


[State 610,freeze]
type = VelAdd
trigger1 = !Time
trigger1 = command = "holddownb"
Y = 7

[State 610, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7021
ID = 610
pos = 12, -3
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 610, HitDef]
type = HitDef
trigger1 = time=0;
attr = A, NA          
damage = 42           
pausetime = 10,10    
hitsound   = S7001,1    
guardsound = 6,0
sparkno=s7002
sparkxy=-10,5
guardflag = HA
ground.type = High    
air.type = High 
ground.slidetime = 9  
ground.hittime  = 12  
ground.velocity = -2.5
air.velocity = 0,10
animtype=Hard
air.animtype=Hard
fall=0
air.fall=1
down.bounce =1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=9
getpower = ifelse(p2movetype = H, 72, 144), 36
givepower = 36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.86
persistent = 0
ignorehitpause = 1

;Strong Air
[Statedef 620]
type=A
physics=A
movetype=A
anim=620
ctrl=0
velset=0,0
poweradd=18
juggle=16
sprpriority = 1

[State 620, vel]
type=velset
trigger1=animelem=2
x=3
y=-8

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7022
ID = 220
pos = 20, -35
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 620, hit]
type = HitDef
trigger1 = AnimElem = 2
attr = A, NA
animtype=Diagup
air.animtype=Diagup
damage    = 80
guardflag = MA
pausetime = 15,15
hitsound   = S7001,3
guardsound = 6,0
sparkno=s7003
sparkxy=4,0   
ground.type = High
air.type = High
fall=1
ground.velocity = -3,-6
air.velocity = -3,-6
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=15
getpower = ifelse(p2movetype = H, 72, 216), 36
givepower = 36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 620, end]
type=changestate
trigger1= animelem=4&&pos y =0
value=0


