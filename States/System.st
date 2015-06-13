; Initialize (at the start of the round)
[Statedef 5900]
type = S

[State 5900, 1] ;Clear all int variables
type = VarRangeSet
trigger1 = roundsexisted = 0
value = 0

[State 5900, 2] ;Clear all float variables
type = VarRangeSet
trigger1 = roundsexisted = 0
fvalue = 0


[State 5900, 3] ;Change palette
type = RemapPal
trigger1 = 1
source = 1,1
dest = 1,palno

[State 5900, 3] ;Change palette
type = VarSet
trigger1 = 1
v = 24
value = 1;000

[State 5900, 3] ;Change palette
type = VarSet
trigger1 = 1
v = 25
value = 1;000

[State 5900, 4] ;Intro for round 1
type = ChangeState
trigger1 = roundno = 1
value = 190

[State 5900, 5] ;All other rounds
type = ChangeState
trigger1 = 1
value = 0

;---------------------------------------------------------------------------
;Jump Start
[Statedef 40]
type    = S
physics = N
anim = 40
ctrl = 0
velset = 0,0

[State 40, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NA,SA,HA,NP,SP,HP

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = command = "holdfwd"-command = "holdback"

[State 40, 4]
type = VarSet
trigger1 = Time = 0
var(3) = 0

[State 40, 4]
type = VarSet
triggerall = Time = 0
triggerall = PalNo = 12
trigger1 = PrevStateNo != 100 && PrevStateNo != 105
trigger1 = Command = "longjump"
var(3) = 1

[State 40, 4]
type = VarSet
triggerall = Time = 0
trigger1 = PrevStateNo = 100 || PrevStateNo = 105
var(3) = 2

[State 40, 4]
type = VarSet
trigger1 = !Time
var(4) = 0

[State 40, 5]
type = VarSet
trigger1 = command != "holdup"
var(4) = 1

[State 40, 6]
type = VelSet
trigger1 = time = 0
x = ifelse(!sysvar(1), 0, ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))

[State 40, 8]
type = VelSet
trigger1 = time = 0
y = const(velocity.jump.y)

[State 40, Mul]
type = VelMul
trigger1 = Var(3)
trigger1 = PalNo = 12
X = IfElse((var(23) != 1 && var(3)) || (var(23) = 1 && var(3) = 2),1.5,1)
Y = IfElse( var(23) != 1 && var(3) = 1,1.5,1)
persistent = 0

[State 40, 8]
type = VelMul
trigger1 = PalNo = 12
trigger1 = var(4)
y = .64
persistent = 0

[State 40, 10]
type = PosFreeze
trigger1 = 1

[State 40, 10]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Jump Up
[Statedef 50]
type    = A
physics = N

[State 50, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43))

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3

[State -3, Variable Height]
type = PlayerPush
triggerall = statetype=A && movetype!=H && numenemy
triggerall = p2bodydist x = [-(enemynear,const(size.ground.back) + enemynear,const(size.ground.front)), 0]
trigger1 = p2statetype=S
trigger1 = p2dist y >= (enemynear,const(size.height) - 6); Value depends on each char
trigger2 = p2statetype=C
trigger2 = p2dist y >= (enemynear,const(size.height) - 14); Value depends on each char
trigger3 = p2statetype=L
trigger3 = p2dist y >= 6
value=0
ignorehitpause=1

[State 4030, Gravity]
type = VelAdd
trigger1 = var(23) != 1
trigger1 = PalNo = 12
y = ifelse(var(4),.5,.6)

[State 4030, Gravity]
type = VelAdd
trigger1 = PalNo = 12
trigger1 = var(23) = 1
y = ifelse(var(3) || var(4),.5,.6)

[State 4030, Gravity]
type = VelAdd
trigger1 = PalNo != 12
y = const(movement.yaccel)

[State 1100, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 52

;---------------------------------------------------------------------------
;Second Jump Start
[Statedef 48]
type    = A
physics = N
anim = 40
ctrl = 0
velset = 0,0

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = (command = "holdfwd"-command = "holdback")*((P2Dist X >= 0)-(P2Dist X < 0))

[State 40, 4]
type = VarSet
trigger1 = Time = 0
var(3) = 0

[State 40, 4]
type = VarSet
triggerall = Time = 0
trigger1 = Command = "longjump"
var(3) = 1

[State 40, 4]
type = VarSet
trigger1 = Time = 0
var(4) = 0

[State 40, 5]
type = VarSet
trigger1 = command != "holdup"
var(4) = 1

[State 52, 1]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 40, 6]
type = VelSet
trigger1 = time = 0
x = ifelse(!sysvar(1), 0, ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))

[State 40, 8]
type = VelSet
trigger1 = time = 0
y = const(velocity.jump.y)

[State 40, Mul]
type = VelMul
trigger1 = Var(3)
trigger1 = PalNo = 12
X = IfElse((var(23) != 1 && var(3)) || (var(23) = 1 && var(3) = 2),2,1)
Y = IfElse( var(23) != 1 && var(3) = 1,1.5,1)

persistent = 0
[State 40, 8]
type = VelMul
trigger1 = PalNo = 12
trigger1 = var(4)
y = .64
persistent = 0

[State 40, 10]
type = PosFreeze
trigger1 = 1

[State 40, 1]
type = VarSet
trigger1 = Time = 0
var(25) = 1

[State 40, 10]
type = ChangeState
trigger1 = AnimTime = 0
value = 60
ctrl = 1

;---------------------------------------------------------------------------
;Second Jump Up
[Statedef 60]
type    = A
physics = N

[State 50, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43))

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3

[State -3, Variable Height]
type = PlayerPush
triggerall = statetype=A && movetype!=H && numenemy
triggerall = p2bodydist x = [-(enemynear,const(size.ground.back) + enemynear,const(size.ground.front)), 0]
trigger1 = p2statetype=S
trigger1 = p2dist y >= (enemynear,const(size.height) - 6); Value depends on each char
trigger2 = p2statetype=C
trigger2 = p2dist y >= (enemynear,const(size.height) - 14); Value depends on each char
trigger3 = p2statetype=L
trigger3 = p2dist y >= 6
value=0
ignorehitpause=1

[State 4030, Gravity]
type = VelAdd
trigger1 = PalNo = 12
y = ifelse(var(3)||var(4),.5,.6)

[State 4030, Gravity]
type = VelAdd
trigger1 = PalNo != 12
y = const(movement.yaccel)


[State 1100, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 52

;---------------------------------------------------------------------------
;Jump Land
[Statedef 52]
type = S
physics = S
ctrl = 0
anim = 47
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, 1]
type = Turn
trigger1 = Time = 1
trigger1 = P2Dist X < 0

[State 52, 3]
type = CtrlSet
trigger1 = Time = 1
value = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 52, 0

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Run forward
[Statedef 100]
type    = S
physics = S
anim = 100
sprpriority = 1

[State 100, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x) * IfElse(PalNo = 12, 1.2, 1)

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 100, 4]
type = ChangeState
trigger1 = command != "holdfwd" && PalNo != 12
value = 0

[State 100, 4]
type = ChangeState
trigger1 = !AnimTime && PalNo = 12
value = 106

;---------------------------------------------------------------------------
; SGUARDHIT2 (knocked back)
[Statedef 151]
type    = S
movetype = H
physics = S
anim = 150+var(49)

[State 151, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 151, 2]
type = VelSet
trigger1 = Time = GetHitVar(slidetime)
trigger2 = HitOver
trigger3 = prevstateno = 810
trigger3 = numhelper(815) = 1
trigger4 = prevstateno = 811
trigger4 = numhelper(815) = 1
x = 0

[State 151, 3]
type = CtrlSet
trigger1 = Time = GetHitVar(ctrltime)
trigger1 = prevstateno != [810,811]
value = 1

[State 151, Hi to Lo]
type = StateTypeSet
trigger1 = statetype = S && command = "holddown"
statetype = C
physics = C

[State 151, Lo to Hi]
type = StateTypeSet
trigger1 = statetype = C && command != "holddown"
statetype = S
physics = S

[State 151, 4]
type = ChangeState
trigger1 = HitOver
trigger1 = prevstateno != [810,811]
trigger2 = prevstateno = [810,811]
trigger2 = !numhelper(815)
value = 130
ctrl = 1

[State 151, 5]
type = ChangeState
triggerall = numhelper(815) = 1
trigger1 = command != "holdback"
trigger1 = prevstateno = 811
trigger2 = prevstateno = 810
trigger2 = helper(13110),var(4) + helper(13110),var(5) > helper(13110),var(3)
trigger3 = prevstateno = 810
trigger3 = helper(13110),var(4) + helper(13110),var(5) > helper(13110),var(6)
value = 811

;---------------------------------------------------------------------------
; CGUARDHIT2 (knocked back)
[Statedef 153]
type = C
movetype = H
physics = C
anim = 151+var(49)

[State 153, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 153, 2]
type = VelSet
trigger1 = Time = GetHitVar(slidetime)
trigger2 = HitOver
trigger3 = prevstateno = 810
trigger3 = numhelper(815) = 1
trigger4 = prevstateno = 811
trigger4 = numhelper(815) = 1
x = 0

[State 153, 3]
type = CtrlSet
trigger1 = Time = GetHitVar(ctrltime)
trigger1 = prevstateno != [810,811]
value = 1

[State 153, Hi to Lo]
type = StateTypeSet
trigger1 = statetype = S && command = "holddown"
statetype = C
physics = C

[State 153, Lo to Hi]
type = StateTypeSet
trigger1 = statetype = C && command != "holddown"
statetype = S
physics = S

[State 153, 4]
type = ChangeState
trigger1 = HitOver
trigger1 = prevstateno != [810,811]
trigger2 = prevstateno = [810,811]
trigger2 = !numhelper(815)
value = 131
ctrl = 1

[State 153, 5]
type = ChangeState
triggerall = numhelper(815) = 1
trigger1 = command != "holdback"
trigger1 = prevstateno = 811
trigger2 = prevstateno = 810
trigger2 = helper(13110),var(4) + helper(13110),var(5) > helper(13110),var(3)
trigger3 = prevstateno = 810
trigger3 = helper(13110),var(4) + helper(13110),var(5) > helper(13110),var(6)
value = 811


;---------------------------------------------------------------------------
; Lose by Time Over
; CNS difficulty: basic
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
; Win state decider
; CNS difficulty: basic
[Statedef 180]
type = S


[State 180, winquote]
type = VictoryQuote
trigger1 = !Time
value = (Random % 6) + 1

[State 180, Magus]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Magus")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
trigger2 = (Enemy, Name = "Maou")
trigger2 = (Enemy, AuthorName = "Raisu")
value = 7 + (Random % 2)

[State 180, Crono]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Crono")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
value = 9

[State 180, Lucca]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Lucca")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
value = 10

[State 180, Marle]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Marle 2")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
value = 11

[State 181, Lavos]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Inner Lavos")
trigger2 = (Enemy, Name = "Lavos Core")
trigger3 = (Enemy, Name = "Lavos")
value = 12

[State 181, Ayla]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Ayla")
value = 13

[State 180, Slash]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Slash")
trigger1 = (Enemy, Authorname = "Xardion")
value = 14

[State 180, Frog]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Frog")
value = 15

[State 180, 1]
type = ChangeState
trigger1 = prevstateno = 183
value = 183

[State 180, 1]
type = ChangeState
trigger1 = Time = 0
value = IfElse(PalNo != 12, 181, IfElse(PrevStateNo = 15022, 183,182))

;---------------------------------------------------------------------------
;Winpose
[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
;Winpose
[Statedef 182]
type = S
ctrl = 0
anim = 14061
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 181, Snd]
trigger1 = !Time
type = PlaySnd
value = S8000,3


; Special Winpose
[Statedef 183]
type = S
ctrl = 0
movetype = I
physics = N

[State 362, Anim]
type = ChangeAnim
trigger1 = PrevStateNo = 15022
value = 15033
persistent = 0

[State 181, Snd]
trigger1 = PrevStateNo = 15022
trigger1 = AnimElem = 5
type = PlaySnd
value = S8000,2
persistent = 0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 200, 7]
type = screenbound
trigger1 = 1
value = 1
movecamera = 30,0

[State 362, win]
type = CtrlSet
trigger1 = Time > 60
value = 1


;-------------------------------------Intros: 190, 191, 193... 300-400 xD--------------------------------------

;Preintro
[Statedef 190]
type=S
ctrl=0
velset=0,0

[State 190, Crono]
type=varset
trigger1=(enemy,name="Crono")&&(enemy,authorname="Kyo Kusanagi")
var(0)=1

[State 190, Marle]
type=varset
trigger1=(enemy,name="Marle 2")&&(enemy,authorname="Kyo Kusanagi")
var(0)=2

[State 190, Lucca]
type=varset
trigger1=(enemy,name="Lucca")&&(enemy,authorname="Kyo Kusanagi")
var(0)=3

[State 190, Frog]
type=varset
trigger1=(enemy,name="Frog") || (enemy,name = "Glenn")
var(0)=4

[State 190, Robo]
type=null;varset
trigger1=(enemy,name="")&&(enemy,authorname="")
var(0)=5

[State 190, Ayla]
type=null;varset
trigger1=(enemy,name="")&&(enemy,authorname="")
var(0)=6

[State 190, Magus]
type=varset
trigger1=(enemy,name="Magus")&&(enemy,authorname="Kyo Kusanagi")
var(0)=7

[State 190, Big Magus]
type=varset
trigger1=(enemy,name="Maou")&&(enemy,authorname="Raisu")
var(0)=8

[State 190, Slash]
type=varset
trigger1=(enemy,name="Slash")&&(enemy,authorname="Xardion")
var(0)=9

[State 190, Lavos]
type=varset
trigger1=(enemy,name="Inner Lavos")&&(enemy,authorname="The Nightcrawler")
var(0)=10

[State 190, Intro]
trigger1=!time
type=changestate
value=ifelse(var(0)=0,191,300+var(0)) ;Special Intros aren't done yet :(


;Random Intro Selector xD
[Statedef 191]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 191, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 190

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, random]
type=changestate
trigger1=!time
value=192+floor(random%3)


;Weapon Intro
[Statedef 192]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 190

[State 192, 3] ;Change to stand state when done
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;Magus Intro
[Statedef 193]
type = A
ctrl = 0
anim = 193
velset = 0,0

[State 193, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 193,Jump Frog, Jump!]
type=Screenbound
trigger1=1
value=0
movecamera=0,0

[State 193, asdasd]
type = helper
trigger1 = !time
name = "Magus"
ID=7300
Stateno=7300
postype=p1
pos=0,floor(pos y)+3
ownpal=1
persistent=0

[State 193, asdasd]
type = posadd
trigger1 = !time
Y = -Screenpos Y-60
persistent=0

[State 193,fall]
type=velset
trigger1=NumHelper(7300)=1
trigger1=Helper(7300),Time>=140
trigger1=pos y < -3
y=10

[State 193,fall]
type=velset
trigger1=pos y >0
y=0

[State 193,fall]
type=Posset
trigger1=pos y >0
y=0

[State 193,fall]
type=changeanim
trigger1 = NumHelper(7300) = 1
trigger1 = Abs(Pos y - Helper(7300), Pos y)< 30
value=194
persistent =0 

[State 193, End]
type = ChangeState
trigger1 = Anim = 194 && !AnimTime
value = 0

[State 193, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 193

[State 193,fall]
type=PlaySnd
trigger1= AnimElem = 1 && Anim = 194
value =S7000,1

;Magus
[Statedef 7300]
type = S
ctrl = 0
anim = 7300
velset = 0,0
sprpriority=4

[State 7300, ouch]
type=varset
trigger1=abs(pos y -root, pos y)< 80
var(0)=32
persistent=0

[State 7300, ow]
type=ChangeAnim
trigger1=abs(pos y -root, pos y)< 80
value=7301
persistent=0

[State 7300, ow]
type=velset
trigger1=abs(pos y -root, pos y)< 80
x=-1.3

[State 3056, trans]
type=trans
trigger1=var(0)>0
trans=addalpha
alpha=256-(16-var(0)/2)*16,(16-var(0)/2)*16

[State 7300, ow]
type=varadd
trigger1=var(0)>0
v=0
value=-1

[State 7300, bye..]
type=destroyself
trigger1=var(0)=1||var(0)<0


;Cyrus Intro
[Statedef 194]
type = S
ctrl = 0
anim = 191
velset = 0,0
physics=N
sprpriority = 1

[State 194, Assert]
type = AssertSpecial
trigger1 = 1
flag = intro

[State 194, helper]
type = Helper
trigger1 = !Time
name = "Cyrus"
ID = 191
stateno = 7302
postype = p1
pos = 0, -50
ownpal = 1
persistent = 0

[State 194, anim]
type = ChangeAnim
trigger1 = Time > 0
trigger1 = !NumHelper(191)
trigger1 = Anim != 192
value = 192

[State 194, anim]
type = ChangeState
trigger1 = Anim = 192 && !AnimTime
value = 0

;Cyrus
[Statedef 7302]
type = A
physics = N
movetype = I
sprpriority = -1
anim=7310

[State 7301, float]
type = VelSet
trigger1 = 1
Y = 0.3 * Sin(Time/20.0)

[State 7301, Ghosty]
type = Trans 
trigger1 = Time = [100, 164]
trans = addalpha
alpha = 256- 4 * (Time - 100), 128 + 2 * (Time - 100)

[State 7301, Ghosty]
type = Trans 
trigger1 = Time < 100
trans = addalpha
alpha = 256, 128

[State 7302, xD]
type=AssertSpecial
trigger1=1
flag=noshadow

[State 7302, xD]
type = destroyself
trigger1 = Time >= 164
;------------------------------Special Intros :B---------------------------------------------
;Against Crono
[Statedef 301]
type = S
ctrl = 0
velset = 0,0
physics=N

[State 301, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 301, Intro]
trigger1=!time
type=changestate
value=191

;Against Marle
[Statedef 302]
type = S
ctrl = 0
velset = 0,0
physics=N

[State 302, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 302, Intro]
trigger1=!time
type=changestate
value=191

;Against Lucca
[Statedef 303]
type = S
ctrl = 0
velset = 0,0
physics=N

[State 303, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 303, Intro]
trigger1=!time
type=changestate
value=191

;Against Frog :P
[Statedef 304]
type = S
ctrl = 0
velset = 0,0
physics=N

[State 304, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 304, Intro]
trigger1=!time
type=changestate
value=191

;Against Robo
[Statedef 305]
type = S
ctrl = 0
velset = 0,0
physics=N

[State 305, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 305, Intro]
trigger1=!time
type=changestate
value=191

;Against Ayla
[Statedef 306]
type = S
ctrl = 0
velset = 0,0
physics=N

[State 306, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 306, Intro]
trigger1=!time
type=changestate
value=191

;Against Magus
[Statedef 307]
type = S
ctrl = 0
velset = 0,0
physics=N

[State 307, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 307, Intro]
trigger1=!time
type=changestate
value=191

;Against Big Magus
[Statedef 308]
type = S
ctrl = 0
velset = 0,0
physics=N

[State 308, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 308, Intro]
trigger1=!time
type=changestate
value=191

;Against Slash
[Statedef 309]
type = S
ctrl = 0
velset = 0,0
physics=N

[State 309, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 309, Intro]
trigger1=!time
type=changestate
value=191

;Against Lavos :O
[Statedef 310]
type = S
ctrl = 0
velset = 0,0
physics=N

[State 310, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 310, Intro]
trigger1=!time
type=changestate
value=191


;---------------------------------------------------------------------------
; Taunt
; CNS difficulty: easy
[Statedef 195]
type = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
physics = S
sprpriority = 2

[State 195, Sound!]
type=PlaySnd
trigger1=!time
trigger1 = PalNo != 12
value = S7015,1
channel = 0


[State 195, Sound!]
type = PlaySnd
trigger1 = !Time
trigger1 = PalNo = 12
value = S8000,(14 + Random % 2)
channel = 0

[State 195, 1]
type = CtrlSet
trigger1 = Time = 40
value = 1

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
