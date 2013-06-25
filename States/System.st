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
trigger1 = Time = 0
value = 181

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


;"..." Intro
[Statedef 192]
type = S
ctrl = 0
anim = 190
velset = 0,0

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

[State 193, asdasdasdas :D]
type=Changestate
trigger1= Anim = 194 && !AnimTime
value=0

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


;Gate Intro
[Statedef 194]
type = S
ctrl = 0
anim = 191
velset = 0,0
physics=N

[State 194, Assert]
type=AssertSpecial
trigger1=1
flag=intro

[State 194, helper]
type = helper
trigger1 = !time
Name="TimeGate"
ID=7302
Stateno=7302
postype=left
pos=floor(screenpos x),-100
ownpal=1
persistent=0

[State 194, pos]
type=Screenbound
trigger1=1
value=0
movecamera=0,0

[State 194, Assert]
type=AssertSpecial
trigger1=time<150
flag=invisible

[State 194, pos]
type=posadd
trigger1=time=150
y=-90

[State 194, grav]
type=velset
trigger1=time>150&&pos y <0
y=2.9

[State 194, floor]
type=posset
trigger1=pos y>0
y=0

[State 194, floor]
type=velset
trigger1=pos y>0
y=0

[State 194, anim]
type=changeanim
trigger1=time>150&&pos y =0
value=7307
persistent=0

[State 194, anim]
type=changestate
trigger1=anim=7307&&!animtime
value=192

;Gate
[Statedef 7302]
anim=7303

[State 7302, :P]
type=changeanim
trigger1=time=70
value=7304

[State 7302, Opening]
type = PlaySnd
trigger1 = Time = 70
value = S7015,2

[State 7302, :P]
type=changeanim
trigger1=anim=7304&&!animtime
value=7302
elem=9

[State 7302, :P]
type=changeanim
trigger1=time=190
value=7305


[State 7302, Opening]
type = PlaySnd
trigger1 = Time = 190
value = S7016,2

[State 7302, xD]
type=AssertSpecial
trigger1=1
flag=noshadow

[State 7302, xD]
type=destroyself
trigger1=anim=7305&&!animtime

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
value = S7015,1
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