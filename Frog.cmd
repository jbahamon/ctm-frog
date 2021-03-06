; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below. 
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------

[Command]
name = "2qcfa"
command = ~D, DF, F, D, DF, F, a
time = 30

[Command]
name = "2qcfb"
command = ~D, DF, F, D, DF, F, b
time = 30

[Command]
name = "2qcfc"
command = ~D, DF, F, D, DF, F, c
time = 30

[Command]
name = "2qcfa"
command = ~D, DF, F, D, DF, F, ~a
time = 30

[Command]
name = "2qcfb"
command = ~D, DF, F, D, DF, F, ~b
time = 30

[Command]
name = "2qcfc"
command = ~D, DF, F, D, DF, F, ~c
time = 30

; ---

[Command]
name = "2qcba"
command = ~D, DB, B, D, DB, B, a
time = 30

[Command]
name = "2qcbb"
command = ~D, DB, B, D, DB, B, b
time = 30

[Command]
name = "2qcbc"
command = ~D, DB, B, D, DB, B, c
time = 30

[Command]
name = "2qcba"
command = ~D, DB, B, D, DB, B, ~a
time = 30

[Command]
name = "2qcbb"
command = ~D, DB, B, D, DB, B, ~b
time = 30

[Command]
name = "2qcbc"
command = ~D, DB, B, D, DB, B, ~c
time = 30

; ---

[Command]
name = "qcbhcfa"
command = ~D, B, D, F, a
time = 40
[Command]
name = "qcbhcfb"
command = ~D, B, D, F, b
time = 40
[Command]
name = "qcbhcfc"
command = ~D, B, D, F, c
time = 40
[Command]
name = "qcbhcfa"
command = ~D, B, D, F, ~a
time = 40
[Command]
name = "qcbhcfb"
command = ~D, B, D, F, ~b
time = 40
[Command]
name = "qcbhcfc"
command = ~D, B, D, F, ~c
time = 40

; ---

[Command]
name = "qcfhcba"
command = ~D, F, D, B, a
time = 40
[Command]
name = "qcfhcbb"
command = ~D, F, D, B, b
time = 40
[Command]
name = "qcfhcbc"
command = ~D, F, D, B, c
time = 40
[Command]
name = "qcfhcba"
command = ~D, F, D, B, ~a
time = 40
[Command]
name = "qcfhcbb"
command = ~D, F, D, B, ~b
time = 40
[Command]
name = "qcfhcbc"
command = ~D, F, D, B, ~c
time = 40

[Command]
name = "qcf2p"
command = ~D, DF, F, a+b
time=25

[Command]
name = "qcf2p"
command = ~D, DF, F, b+c
time=25

[Command]
name = "qcf2p"
command = ~D, DF, F, a+c
time=25

[Command]
name = "qcf2p"
command = ~D, DF, F, ~a+b
time=25

[Command]
name = "qcf2p"
command = ~D, DF, F, ~b+c
time=25

[Command]
name = "qcf2p"
command = ~D, DF, F, ~a+c
time=25


[Command]
name = "qcb2p"
command = ~D, DB, B, a+b
time=25

[Command]
name = "qcb2p"
command = ~D, DB, B, b+c
time=25

[Command]
name = "qcb2p"
command = ~D, DB, B, a+c
time=25

[Command]
name = "qcb2p"
command = ~D, DB, B, ~a+b
time=25

[Command]
name = "qcb2p"
command = ~D, DB, B, ~b+c
time=25

[Command]
name = "qcb2p"
command = ~D, DF, F, ~a+c
time=25

[Command]
name = "Chi no Shoukan"
command =  ~b, a, F, a, ~c
time = 50

[Command]
name = "Chi no Shoukan"
command =  ~b, a, F, a, c
time = 50


[Command]
name = "Chi no Shoukan"
command =  b, a, F, a, ~c
time = 50

[Command]
name = "Chi no Shoukan"
command =  b, a, F, a, c
time = 50

[Command]
name = "Toki wo Tomare"
command = ~F, c, a, F, x
time = 40


;-| Special Motions |------------------------------------------------------


[Command]
name = "Space Ripper Stingy Eyes"
command =  ~F, c, b, a, F
time=30

[Command]
name = "Space Ripper Stingy Eyes"
command =  ~F, c, b, a, ~F
time=30

[Command]
name = "qcba"
command =  ~D, DB, B, a
time=15

[Command]
name = "qcbb"
command = ~D, DB, B, b	
time=15

[Command]
name = "qcbc"
command = ~D, DB, B, c
time=15

[Command]
name = "qcba"
command =  ~D, DB, B, ~a
time=15

[Command]
name = "qcbb"
command = ~D, DB, B, ~b	
time=15

[Command]
name = "qcbc"
command = ~D, DB, B, ~c
time=15


; ---

[Command]
name = "dfa"
command = ~F, D, DF, a
time=15

[Command]
name = "dfb"
command =  ~F, D, DF, b
time=15

[Command]
name = "dfc"
command = ~F, D, DF, c
time=15

[Command]
name = "dfa"
command = ~F, D, DF, ~a
time=15

[Command]
name = "dfb"
command =  ~F, D, DF, ~b
time=15

[Command]
name = "dfc"
command = ~F, D, DF, ~c
time=15

; ---

[Command]
name = "qcfa"
command = ~D, DF, F, a
time=15

[Command]
name = "qcfb"
command = ~D, DF, F, b
time=15

[Command]
name = "qcfc"
command = ~D, DF, F, c
time=15

[Command]
name = "qcfa"
command = ~D, DF, F, ~a
time=15

[Command]
name = "qcfb"
command = ~D, DF, F, ~b
time=15

[Command]
name = "qcfc"
command = ~D, DF, F, ~c
time=15

[Command]
name = "qcfx"
command = ~D, DF, F, ~x
time=15

[Command]
name = "qcfx"
command = ~D, DF, F, x
time=15


[Command]
name = "qcbx"
command = ~D, DB, B, ~x
time=15

[Command]
name = "qcbx"
command = ~D, DB, B, x
time=15

;-| Double Tap |-----------------------------------------------------------

[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10


[Command]
name = "longjump"
command = ~D,/$U
time = 25



;-| 2/3 Button Combination |-----------------------------------------------

[Command]
name = "recovery";Required (do not remove)
command = a+b
time = 1

[Command]
name = "2p"
command = b+c
time = 1

[Command]
name = "2p"
command = b+c
time = 1

[Command]
name = "a+c"
command = a+c
time = 1

[Command]
name = "2p"
command = a+b
time = 1


[Command]
name = "3p"
command = a+b+c
time = 1

;-| Dir + Button |---------------------------------------------------------

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1


;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================


[State -1, Frog Squash Da]
type = ChangeState
value = 3000
triggerall = StateType != A
triggerall = Command = "qcbhcfa" || Command = "qcbhcfb" || Command = "qcbhcfc"
triggerall = Var(21) > 0 && NumHelper(3030)
triggerall = PalNo != 12
trigger1= Ctrl 	


[State -1, Toki wo Tomare]
type = ChangeState
value = 15070
triggerall = StateType != A
triggerall = Command = "Toki wo Tomare"
triggerall = PalNo = 12
triggerall= Power >= 500
triggerall = !Var(29) 	
trigger1 = !Var(23) && !NumHelper(10000)
trigger1 = (Ctrl || StateNo = 220)
trigger2 = Var(23) && NumHelper(10000) 
trigger2 = (Ctrl && Helper(10000), StateNo = 17011) || (Helper(10000), StateNo = 17014)

;----------------------Supers----------------------

[State -1, Masamune]
type = ChangeState
value = 3060
triggerall = StateType != A && Power >= 1000
triggerall = Command = "qcfhcba" || Command = "qcfhcbb" || Command = "qcfhcbc"
triggerall = !Var(21) && !NumHelper(3030)
triggerall = PalNo != 12
trigger1= Ctrl 			

[State -1, Bubbles]
type = ChangeState
value = 3110
triggerall = !NumHelper(3111) && Power >= 1000
triggerall = Command = "2qcfa" || Command = "2qcfb" || Command = "2qcfc" 
triggerall = PalNo != 12
trigger1 = Ctrl
trigger2 = ( StateNo = 3100 ) && NumHelper(3100)
trigger3 = ( StateNo = [200,299] ) && MoveHit
trigger4 = ( StateNo = [400,499] ) && MoveHit
trigger5 = ( StateNo = [600,699] ) && MoveHit
trigger6 = ( StateNo = 1040 ) && MoveHit

[State -1, Water Pillar]
type = ChangeState
value = 3100
triggerall = Power>=1000
triggerall = Command = "2qcba" || Command = "2qcbb" || Command = "2qcbc" 
triggerall = PalNo != 12
trigger1 = Ctrl 
trigger2 = (Stateno=3050) && !NumExplod(3700)
trigger3 = ( StateNo = [200,299] ) && MoveHit
trigger4 = ( StateNo = [400,499] ) && MoveHit
trigger5 = ( StateNo = [600,699] ) && MoveHit
trigger6 = ( StateNo = 1020) && MoveHit

[State -1, Chi no Shoukan]
type = ChangeState
triggerall = PalNo = 12 
triggerall = Command = "Chi no Shoukan"
triggerall = StateType != A
triggerall = !Var(29)
trigger1 = ctrl || (!MoveContact && StateNo = [200, 220])
trigger1 = !Var(23) && !NumHelper(10000)
trigger2 = Var(23) && NumHelper(10000) 
trigger2 = (ctrl && Helper(10000), StateNo = 17011)  || (!(Helper(10000), MoveContact) && Helper(10000), StateNo = [17012, 17014])
value = 15040

[State -1, Road Rolla Da]
type = ChangeState
triggerall = PalNo = 12 
triggerall = ctrl
triggerall = Command = "qcb2p"
triggerall = Power >= 1000
trigger1 = !Var(23) && !NumHelper(10000)
value = 15020

[State -1, Checkmate]
type = ChangeState
triggerall = PalNo = 12 
triggerall = ctrl
triggerall = Command = "qcf2p"
triggerall = Power >= 1000
trigger1 = Var(23) && NumHelper(10000) 
trigger1 = Helper(10000), StateNo = 17011
trigger2 = !Var(23) && !NumHelper(10000) && StateType != A
value = IfElse(Var(23) && NumHelper(10000), IfElse(StateType = A, 15015, 15010), 15000)



;----------------------Specials----------------------

[State -1, Leap Slash]
type = ChangeState
value = 1020
triggerall = PalNo != 12
triggerall = StateType != A 
triggerall = Command = "dfa" || Command = "dfb" || Command = "dfc"
trigger1 = Ctrl

[State -1, Slurp Cut]
type = ChangeState
value = 1030
triggerall = PalNo != 12
triggerall = StateType != A && Power >=500
triggerall = Command = "qcfa" || Command = "qcfb" || Command = "qcfc"
trigger1 = Ctrl

[State -1, Line Slash]
type = ChangeState
value = 1040
triggerall = PalNo != 12
triggerall = Command = "qcfa" || Command = "qcfb" || Command = "qcfc" 
trigger1 = StateType = A 
trigger1 = Ctrl
trigger2 = StateNo = 220 || StateNo = 610 || StateNo = 620
trigger2 = MoveContact

[State -1, Water Magic]
type = ChangeState
value = 1000
triggerall = !NumHelper(1010) 
triggerall = PalNo != 12
triggerall = Command = "qcba" || Command = "qcbb" || Command = "qcbc"
trigger1 = Ctrl
trigger1 = StateType != A
trigger2 = (StateNo = [400, 499]) || (StateNo = [200, 210])
trigger2 = movecontact

[State -1, Water Magic - Air]
type = ChangeState
value = 1001
triggerall = !NumHelper(1010) 
triggerall = Command = "qcba" || Command = "qcbb" || Command = "qcbc" 
triggerall = PalNo != 12
trigger1 = Ctrl
trigger1 = StateType = A
trigger2 = (StateNo = [600, 699])
trigger2 = movecontact
trigger3 = (StateNo = 220) || (stateno = 1020)
trigger3 = movecontact

[State -1, Blade Strike]
type = ChangeState
trigger1 = (command = "recovery" || command = "2p") && (command = "holdfwd" || command = "holdback")
trigger1 = PalNo != 12
trigger1 = roundstate = 2 && ctrl && statetype = S && stateno != 100
value = 800

;Grand Dream Activation
[State -1, Grand Dream]
type = ChangeState
value = 3030
triggerall = Command = "a+c" 
triggerall = PalNo != 12
triggerall = Power >= 3000
triggerall = Var(21) = 0
trigger1 = StateType != A
trigger1 = ctrl 

;---------------------------------------------------------------------------

[State -1, Space Ripper Stingy Eyes!]
type = ChangeState
triggerall = PalNo = 12
triggerall = StateType != A 
triggerall = ctrl || StateNo = [200, 220]
triggerall = !Var(23) && !NumHelper(10000)
triggerall = !Var(29) || Power > 0
trigger1 = Command = "Space Ripper Stingy Eyes"
value = 14050

[State -1, Shinei!]
type = ChangeState
triggerall = PalNo = 12
triggerall = StateType != A 
triggerall = ctrl
triggerall = Var(23) && NumHelper(10000)
triggerall = !Var(29) || Power > 0
trigger1 = Helper(10000), StateNo = 17011
trigger1 = Command = "dfa" || Command = "dfb" || Command = "dfc"
value = 14040

[State -1, The World]
type = ChangeState
triggerall = PalNo = 12
triggerall = !Var(29) || Power > 0
triggerall = StateType != A 
triggerall = ctrl
triggerall = !Var(23) && !NumHelper(10000)
trigger1 = Command = "dfa" || Command = "dfb" || Command = "dfc"
value = 14030

[State -1, MUDAA - Second Hit]
type = ChangeState
triggerall = PalNo = 12
triggerall = !Var(29) || Power > 0
triggerall = StateNo = 14025
triggerall = (Var(23) && NumHelper(10000))  
triggerall = Command = "qcba" || Command = "qcbb" || Command = "qcbc" 
trigger1 = Helper(10000), StateNo = 17235
trigger1 = Helper(10000), MoveContact
value = 14026

[State -1, MUDAA]
type = ChangeState
triggerall = PalNo = 12
triggerall = !Var(29) || Power > 0
triggerall = StateType != A 
triggerall = Ctrl || StateNo = 195 || StateNo = 200 || StateNo = 210 || StateNo = 220 || StateNo = 400 || StateNo = 410 || StateNo = 420
triggerall = Command = "qcba" || Command = "qcbb" || Command = "qcbc"
trigger1 = !Var(23) && !NumHelper(10000)
trigger2 = Var(23) && NumHelper(10000) 
trigger2 = Helper(10000), StateNo = 17011
value = IfElse(Var(23), 14025, 14020)


[State -1, Muda Muda - Air]
type = ChangeState
triggerall = PalNo = 12
triggerall = !Var(29) || Power > 0
triggerall = StateType = A 
triggerall = Command = "qcfa" || Command = "qcfb" || Command = "qcfc"
triggerall = Ctrl
trigger1 = Var(23) && NumHelper(10000) 
trigger1 = Helper(10000), StateNo = 17011
trigger2 = !Var(23) && !NumHelper(10000)
value = 14016

[State -1, Muda Muda]
type = ChangeState
triggerall = PalNo = 12
triggerall = !Var(29) || Power > 0
triggerall = StateType != A 
triggerall = Command = "qcfa" || Command = "qcfb" || Command = "qcfc"
triggerall = Ctrl || StateNo = 195 || StateNo = 200 || StateNo = 210 || StateNo = 220 || StateNo = 400 || StateNo = 410 || StateNo = 420
trigger1 = Var(23) && NumHelper(10000) 
trigger1 = Helper(10000), StateNo = 17011
trigger2 = !Var(23) && !NumHelper(10000)
value = IfElse(Var(23) && NumHelper(10000), 14015, 14010)

; Stand Appearance Attack
[State -1, Stand Attack]
type = ChangeState
triggerall = command = "qcfx"
triggerall = !Var(29) || Power > 0
triggerall = statetype != A
triggerall = PalNo = 12
trigger1 = !Var(23) && !NumHelper(10000)
trigger1 = ctrl
value = 14000

; Tandem Combo
[State -1, Tandem Combo]
type = ChangeState
triggerall = command = "qcbx"
triggerall = statetype != A
triggerall = PalNo = 12
triggerall = !Var(29) || Power > 0
triggerall = ctrl
triggerall = !Var(29)
trigger1 = !Var(23) && !NumHelper(10000)
trigger2 = Var(23) && NumHelper(10000) 
trigger2 = Helper(10000), StateNo = 17011
value = 15060

[State -1, Throw]
type = ChangeState
triggerall = (command = "c") && (command = "holdfwd" || command = "holdback")
triggerall = PalNo = 12
triggerall = !Var(29) || Power > 0
triggerall = roundstate = 2 && ctrl && statetype = S && stateno != 100
trigger1 = (!Var(23) && !NumHelper(10000)) 
trigger2 = (Var(23) && NumHelper(10000))
trigger2 = Helper(10000), StateNo = 17011
value = 13800

; Guard Cancel
[State -1]
type = ChangeState
value = 13400
triggerall = roundstate = 2
triggerall = !Var(29) || Power > 0
triggerall = Command = "dfa" || Command = "dfb" || Command = "dfc"
triggerall = PalNo = 12
triggerall = prevstateno != [810,811]
trigger1 = stateno = 150 || stateno = 151 || stateno = 152 || stateno = 153
ignorehitpause = 0

;Advancing Guard
[State -1]
type = ChangeState
value = 13300
triggerall = PalNo = 12
triggerall = !Var(29) || Power > 0
triggerall = roundstate = 2
triggerall = command = "2p"
triggerall = prevstateno != [13300,13301]
trigger1 = stateno = 150 || stateno = 151 || stateno = 152 || stateno = 153
ignorehitpause = 0

; Dodge
[State -1, Roll]
type = ChangeState
value = 13500
triggerall = command = "2p"
triggerall = !Var(29) || Power > 0
triggerall = PalNo = 12
triggerall = !Var(23)
trigger1 = StateType != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = PalNo != 12 || (!Var(23) && (!Var(29) || Power > 0))
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200)
trigger2 = movecontact && PalNo != 12

[State -1, Taunt]
type = ChangeState
value = 13141
triggerall = PalNo = 12 && (Var(23) && NumHelper(10000))
triggerall = !Var(29) || Power > 0
triggerall = command = "c"
triggerall = command = "holdback"
triggerall = Helper(10000), StateNo = 17013
triggerall = Helper(10000), Animelemtime(4) > 0
trigger1 = statetype != A
trigger1 = StateNo = 13111 && prevstateno = 13100 
ignorehitpause = 0

[State -1, Crouching Strong]
type = ChangeState
value = 13140
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = PalNo = 12 && (Var(23) && NumHelper(10000))
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17011
trigger1 = statetype != A
trigger1 = ctrl || (stateno = 100 && time >= 4) || stateno = 101 || (stateno = 105 && time >= 4)
trigger2 = StateNo = 13100 && (prevstateno != [100,105]) && NumHelper(10000)
trigger2 = Helper(10000), AnimElemTime(5) > 0	
ignorehitpause = 0

;---------------------------------------------------------------------------
;Crouching Mid
[State -1, Crouching Mid]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = PalNo != 12 || (!Var(23) && (!Var(29) || Power > 0))
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 400) 
trigger2 = movecontact && PalNo != 12


; Light Stand/Crouch to MidCrouch2
[State -1, LightHit]
type = ChangeState
value = 13151
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = Helper(10000), StateNo = 17012
trigger1 = Helper(10000), AnimElemTime(4) >= 6
trigger1 = StateNo = 13100 && (prevstateno != [100,105]) 
trigger2 = Helper(10000), StateNo = 17030
trigger2 = Helper(10000), AnimElemTime(4) > 0
trigger2 = StateNo = 13140 && (prevstateno != [100,105])

; Light1 to MidCrouch 
[State -1, LightHit]
type = ChangeState
value = 13150
triggerall = StateNo = 13100 && (prevstateno != [100,105]) 
triggerall = !Var(29) || Power > 0
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = Helper(10000), StateNo = 17012
triggerall = Helper(10000), AnimElemTime(4) >= 6
triggerall = command = "b"
trigger1= command = "holddown"


[State -1, Crouching Mid]
type = ChangeState
value = 13150
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = PalNo = 12 && (Var(23) && NumHelper(10000))
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17011
trigger1 = statetype != A
trigger1 = ctrl || (stateno = 100 && time >= 4) || stateno = 101 || (stateno = 105 && time >= 4)

;---------------------------------------------------------------------------
;Crouching Strong
[State -1, Crouching Strong]
type = ChangeState
value = 420
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = PalNo != 12 || (!Var(23) && (!Var(29) || Power > 0))
trigger1 = statetype != A
trigger1 = ctrl

[State -1, Taunt]
type = ChangeState
value = 13161
triggerall = command = "c" 
triggerall = command = "holddown"
triggerall = statetype != A
triggerall = PalNo = 12
triggerall = NumHelper(10000)
triggerall = !Var(29) || Power > 0
trigger1 = Helper(10000), Stateno = 17012
trigger1 = Helper(10000), Animelemtime(4) > 0
trigger1 = StateNo = 13100 && (prevstateno != [100,105]) 
trigger2 = StateNo = 13111 && (prevstateno = 13100 || prevstateno = 13101 || prevstateno = 13140)
trigger2 = Helper(10000), Stateno = 17013
trigger2 = Helper(10000), Animelemtime(4) > 0
trigger3 = StateNo = 13140 && (prevstateno != [100,105]) 
trigger3 = Helper(10000), StateNo = 17030
trigger3 = Helper(10000), Animelemtime(4) > 0
trigger4 = StateNo = 13151 
trigger4 = Helper(10000), StateNo = 17031
trigger4 = Helper(10000), Animelemtime(4) > 0
ignorehitpause = 0

[State -1, Taunt]
type = ChangeState
value = 13161
triggerall = command = "c" 
triggerall = command = "holdfwd"
triggerall = statetype != A
triggerall = PalNo = 12
triggerall = NumHelper(10000)
triggerall = !Var(29) || Power > 0
trigger1 = Helper(10000),stateno = 17013
trigger1 = StateNo = 13111 && prevstateno = 13100 
trigger1 = Helper(10000), Animelemtime(4) > 0
ignorehitpause = 0

[State -1, Crouching Strong]
type = ChangeState
value = 13160
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = PalNo = 12 && (Var(23) && NumHelper(10000))
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17011
trigger1 = statetype != A
trigger1 = ctrl || (stateno = 100 && time >= 4) || stateno = 101 || (stateno = 105 && time >= 4)


;----------------------Air----------------------

;Jump Light Hit (Stand)
[State -1, Jump Light Hit]
type = ChangeState
value = 13130
triggerall = command = "a"
triggerall = PalNo = 12 && (Var(23) && NumHelper(10000))
triggerall = StateNo != [100, 105]
triggerall = Helper(10000), StateNo = 17011	
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

;Jump Light Hit
[State -1, Jump Light Hit]
type = ChangeState
value = 600
triggerall = command = "a"
trigger1 = statetype = A
triggerall = PalNo != 12 || (!Var(23)) || !Var(29) || Power > 0
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact && PalNo != 12
trigger2 = animtime >= 6
trigger3 = stateno = 1350 ;Air blocking

;Jump Medium Hit (Stand)
[State -1, Jump Light Hit]
type = ChangeState
value = 13131
triggerall = command = "b"
triggerall = PalNo = 12 && (Var(23) && NumHelper(10000))
triggerall = !Var(29) || Power > 0
triggerall = StateNo != [100, 105]
triggerall = Helper(10000), StateNo = 17011
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

;Jump Medium Hit
[State -1, Jump Medium Hit]
type = ChangeState
value = 610
triggerall = command = "b"
triggerall = PalNo != 12 || (!Var(23)) || !Var(29) || Power > 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 220 && AnimElemNo(0) >= 3)  || (stateno = 1040)
trigger2 = movecontact && PalNo != 12
trigger3 = stateno = 1350 ;Air blocking

;Jump Strong Hit (Stand)
[State -1, Jump Light Hit]
type = ChangeState
value = 13132
triggerall = command = "c"
triggerall = PalNo = 12 && (Var(23) && NumHelper(10000))
triggerall = StateNo != [100, 105]
triggerall = Helper(10000), StateNo = 17011
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

;Jump Strong Hit
[State -1, Jump Strong Hit]
type = ChangeState
value = 620
triggerall = command = "c"
triggerall = PalNo != 12 || (!Var(23)) || !Var(29) || Power > 0
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 610) || (stateno = 220 && AnimElemNo(0) >= 3) || (stateno = 1040) || (stateno = 1020)
trigger2 = movecontact && PalNo != 12
trigger3 = stateno = 1350 ;Air blocking
trigger4 = StateNo = 1001 && AnimElemTime(4) >= 0

;----------------------Standing----------------------

; Stand Light Punch
[State -1, LightHit]
type = ChangeState
value = 13100
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17011
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl || (stateno = 100 && time >= 4) || stateno = 101 || (stateno = 105 && time >= 4)
trigger2 = StateNo = 13140 && (prevstateno != [100,105]) && NumHelper(10000)
trigger2 = Helper(10000), AnimElemTime(4) > 0	

; Stand Light Punch - Combo
[State -1, LightHit]
type = ChangeState
value = 13101
triggerall = StateNo = 13100
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17012
triggerall = Helper(10000), AnimElemTime(4) >= 6
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S

; Light2 to Mid1
[State -1, LightHit]
type = ChangeState
value = 13110
triggerall = StateNo = 13101
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17012
triggerall = Helper(10000), AnimElemTime(4) >= 6
triggerall = command = "b"
trigger1= command != "holddown"

; Light1 to Mid2
[State -1, LightHit]
type = ChangeState
value = 13111
triggerall = StateNo = 13100
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17012
triggerall = Helper(10000), AnimElemTime(4) >= 6
triggerall = command = "b"
trigger1= command != "holddown"

; Light Crouch to Mid2
[State -1, LightHit]
type = ChangeState
value = 13111
triggerall = StateNo = 13140
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17030
triggerall = Helper(10000), AnimElemTime(4) >= 6
triggerall = command = "b"
trigger1= command != "holddown"

; Mid to Mid
[State -1, LightHit]
type = ChangeState
value = 13111
triggerall = StateNo = 13110
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17013
triggerall = Helper(10000), Var(6) = 1
triggerall = Helper(10000), AnimElemTime(4) >= 6
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S

;Medium hit
[State -1, MidHit]
type = ChangeState
value = 13110
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17011
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 100 && time >= 4) || stateno = 101 || (stateno = 105 && time >= 4)


; Light2 to Hard
[State -1, LightHit]
type = ChangeState
value = 13120
triggerall = StateNo = 13101
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17012
triggerall = Helper(10000), Var(6) = 1
triggerall = Helper(10000), AnimElemTime(4) >= 4
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S

; Light1 to Hard
[State -1, LightHit]
type = ChangeState
value = 13120
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = statetype != A
triggerall = Helper(10000), Var(6) = 1
triggerall = Helper(10000), AnimElemTime(4) >= 4
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = Helper(10000), AnimElemTime(4) >= 4
trigger1 = Helper(10000), StateNo = 17012
trigger1 = StateNo = 13100 && (prevstateno != [100,105])
trigger2 = Helper(10000), StateNo = 17013
trigger2 = StateNo = 13111 && (prevstateno = 13100 || prevstateno = 13040)
trigger3 = Helper(10000), StateNo = 17030
trigger3 = StateNo = 13040 && (prevstateno != [100,105])
trigger4 = Helper(10000), StateNo = 17031
trigger4 = StateNo = 17051

; Light Crouch to Hard
[State -1, LightHit]
type = ChangeState
value = 13120
triggerall = StateNo = 13140
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17030
triggerall = Helper(10000), Var(6) = 0
triggerall = Helper(10000), AnimElemTime(4) > 2
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype != A

; Mid1 to Hard
[State -1, LightHit]
type = ChangeState
value = 13120
triggerall = StateNo = 13110
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17013
triggerall = Helper(10000), Var(6) = 0
triggerall = Helper(10000), AnimElemTime(4) >= 6
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S

; Mid1 to Hard, from Light
[State -1, LightHit]
type = ChangeState
value = 13120
triggerall = StateNo = 13110
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17013
triggerall = Helper(10000), Var(6) = 1
triggerall = Helper(10000), AnimElemTime(4) >= 6
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S

; Mid Crouch to Hard
[State -1, LightHit]
type = ChangeState
value = 13120
triggerall = StateNo = 13150
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17031
triggerall = Helper(10000), AnimElemTime(5) > 0
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype != A

;Strong hit
[State -1, StrongHit]
type = ChangeState
value = 13120
triggerall = command = "c"
triggerall = PalNo = 12 && NumHelper(10000)
triggerall = !Var(29) || Power > 0
triggerall = Helper(10000), StateNo = 17011
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 100 && time >= 4) || stateno = 101 || (stateno = 105 && time >= 4)

;Stand Light Punch
[State -1, LightHit]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = PalNo != 12 || (!Var(23)) || !Var(29) || Power > 0
trigger1 = statetype = S
trigger1 = ctrl

;Medium hit
[State -1, MidHit]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = PalNo != 12 || (!Var(23)) || !Var(29) || Power > 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact && PalNo != 12

;Strong hit
[State -1, StrongHit]
type = ChangeState
value = 220
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = PalNo != 12 || (!Var(23)) || !Var(29) || Power > 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 210)
trigger2 = movecontact && PalNo != 12


;----------------------Other----------------------

;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = PalNo != 12 || !Var(29) || Power > 0
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = PalNo != 12 || !Var(29) || Power > 0
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = PalNo != 12 || !Var(29) || Power > 0
triggerall = !NumHelper(15060)
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;Stand (de)activation
[State -1, Stand]
type = ChangeState
value = 13195
triggerall = command = "x"
triggerall = PalNo = 12 
triggerall = !Var(29) || Power > 0
trigger1 = ctrl

;High Jump
[State -1, High Jump]
type = ChangeState
value = 40
triggerall = PalNo = 12
triggerall = !Var(23)
triggerall = !Var(29) || Power > 0
triggerall = Command = "longjump"
trigger1 = statetype = C
trigger1 = ctrl

;Air Jump
[State -1, Air Jump]
type = ChangeState
triggerall = PalNo != 12 || !Var(29) || Power > 0
triggerall = command = "holdup"
triggerall = statetype = A
trigger1 = !Var(25) && (Var(23) || PalNo != 12)
trigger1 = ctrl
value = 48