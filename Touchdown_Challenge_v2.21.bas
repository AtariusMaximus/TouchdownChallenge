;▄■▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀■▄       
;█                  ■═────Touchdown Challenge────═■                  █
;█                           Version 2.21                            █
;█                        by Steve Engelhardt                        █
;█                             2/24/2023                             █
;█               7800basic: v0.19 Dec 31 2021 20:34:07               █
;▀■▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄■▀ 

  set doublewide on
  set romsize 48k
  set basepath gfx_football
  set screenheight 224
  set collisionwrap off
  set plotvalueonscreen on
  set extradlmemory on
  set avoxvoice on
  set hssupport $1134
  displaymode 160A

  incgraphic alphabet_8_wide_04.png 160A 0 2 1 3 
  incgraphic scoredigits_8_wide_02.png 

  incgraphic highscore.png

 ;Sprites for Football Field
  incgraphic Football_Tiles.png
  incgraphic Football_Tiles2.png
  incgraphic Football_Tiles3.png
  incgraphic Football_Tiles4.png
  incgraphic Football_Tiles5.png
  incgraphic Football_Tiles6.png
  incgraphic goalpost_top.png

 ;Message Sprites
  incgraphic msg_outofbounds.png
  incgraphic msg_touchdown.png
  incgraphic msg_incomplete.png
  incgraphic msg_down.png
  incgraphic msg_gameover1.png
  incgraphic msg_gameover2.png
  incgraphic msg_ready.png
  incgraphic msg_interception.png

 ;Sprites for Football Players
  incgraphic Player_Anim1.png 160A 0 1 2
  incgraphic Player_Anim2.png 160A 0 1 2
  incgraphic Player_Anim3.png 160A 0 1 2
  incgraphic Player_UAnim1.png 160A 0 1 2
  incgraphic Player_UAnim2.png 160A 0 1 2
  incgraphic Player_UAnim3.png 160A 0 1 2
  
 ;Vertical Football Sprite and Title Screen Image
  incgraphic football_alt1.png 160A 0 1 2 
  incgraphic football_alt2.png 160A 0 1 2 
  incgraphic football_alt3.png 160A 0 1 2 
  incgraphic football.png 160A 0 1 2 
  incgraphic twop.png 160A 0 1 2
  incgraphic onep.png 160A 0 1 2
  incbanner tctitle7.png 160A 1 0 2 
  incbanner AA_Logo3.png 160A 0 1 2

 ;Orange Cones
  incgraphic cone.png 160A 0 1 2  

 ;Referee Sprite
  incgraphic referee_handup.png 160A 0 1 2 
  incgraphic referee_handdown.png 160A 0 1 2 
  incgraphic referee_touchdown.png 160A 0 1 2 

 ;Horizontal Animated Football
  incgraphic fball_anim1.png 160A 0 1 2 
  incgraphic fball_anim2.png 160A 0 1 2 
  incgraphic fball_anim3.png 160A 0 1 2 
  incgraphic fball_anim4.png 160A 0 1 2 
  incgraphic arrows_u.png 160A 0 1 2
  incgraphic arrows_d.png 160A 0 1 2
  incgraphic arrows_l.png 160A 0 1 2
  incgraphic arrows_r.png 160A 0 1 2

 ;Tiled Map file for the football field
  incmapfile football_field.tmx
  incmapfile football_field_menu.tmx

  dim debounce=g
  dim Quarterback_X=h   
  dim Quarterback_Y=i
  dim Receiver_X=j
  dim Receiver_Y=k
  dim frame_counter=l
  dim Move_LR=m
  dim Move_LR_2=n
  dim Move_LR_3=o
  dim Blitz_Speed=p.q
  dim Referee_X=r
  dim Referee_Y=s
  dim Ref_Active=t
  dim Defense_Counter=u
  dim Move_LR_4=v
  dim Move_LR_5=w
  dim Move_LR_6=x
  dim Move_LR_7=y
  dim animation_frame3=z
  dim Football_X=var1
  dim Football_Y=var2
  dim animation_frame=var3
  dim animation_frame2=var4
  dim Football_State=var5  
  dim Pass_Path=var6
  dim Debounce_L=var7     
  dim Debounce_R=var8     
  dim Ball_Received=var9
  dim Game_Event=var10
  dim F_clr=var11
  dim Play_Randomizer1=var12
  dim Play_Randomizer2=var13
  dim Play_Randomizer3=var14
  dim Play_Randomizer4=var15
  dim Play_Randomizer5=var16
  dim Play_Randomizer6=var17
  dim Play_Randomizer7=var18
  dim Play_Randomizer8=var19
  dim Logo_Y=var20
  dim Game_Paused=var21
  dim frame_counter2=var22
  dim Assigned_Play=var24
  dim Reached_Bottom1=var25
  dim Reached_Bottom2=var26
  dim Reached_Bottom3=var27
  dim Reached_Bottom4=var28
  dim Reached_Bottom5=var29
  dim Reached_Bottom6=var30
  dim Reached_Bottom7=var31
  dim Reached_Bottom=var32
  dim Menu_Select=var33
  dim Menu_Option=var34
  dim Menu_Option_Color=var35
  dim Cone_X=var36
  dim Cone_Y=var37
  dim Debounce_Left=var38
  dim Debounce_Right=var39
  dim Debounce_Up=var40
  dim Debounce_Down=var41
  dim Defense1_Speed=var44.var45
  dim Defense2_Speed=var46.var47
  dim Defense3_Speed=var48.var49
  dim Defense4_Speed=var50.var51
  dim Defense5_Speed=var52.var53
  dim Defense6_Speed=var54.var55
  dim Defense7_Speed=var56.var57
  dim Defense1_X=var58.var59
  dim Defense1_Y=var60.var61
  dim Defense2_X=var62.var63
  dim Defense2_Y=var64.var65
  dim Defense3_X=var66.var67
  dim Defense3_Y=var68.var69
  dim Defense4_X=var70.var71
  dim Defense4_Y=var72.var73
  dim Defense5_X=var74.var75
  dim Defense5_Y=var76.var77
  dim Defense6_X=var78.var79
  dim Defense6_Y=var80.var81
  dim Defense7_X=var82.var83
  dim Defense7_Y=var84.var85
  dim scorea=a          ; Touchdowns - Also uses b and c
  dim tdHi=scorea       : dim tdMed=scorea+1 : dim tdLo=scorea+2
  dim scoreb=d          ; Downs - Also uses e and f
  dim downHi=scoreb     : dim downMed=scoreb+1 : dim downLo=scoreb+2
  dim scorec=var86      ; High Score Saving - also uses var87 and var88
  dim highscoreHi=var86: dim highscoreMed=var86+1: dim highscoreLo=var86+2 
  dim fadeindex=var89
  dim fadeluma=var90
  dim Football2_X=var91
  dim Football2_Y=var92
  dim frame_counter3=var93
  dim Intro_Player_X=var94
  dim Intro_Player_Y=var95
  dim Intro_Football_X=var96
  dim Intro_Football_Y=var97
  dim Intro_Referee_X=var98
  dim Intro_Referee_Y=var99
  dim Last_Quarterback_X=$27F4
  dim D_Menu=$27F5
  dim O_Menu=$27F6
  dim Defense_Color=$27F7
  dim Offense_Color=$27F8
  dim Debounce_U=$27F9
  dim Debounce_D=$27FA
  dim Time_Counter=$27FB
  dim Time_Counter2=$27FC
  dim P1_Color=$27FD
  dim P2_Color=$27FE
  dim Option_2P=$27FF

 ;Set Characterset and alphabet characters
  characterset alphabet_8_wide_04
  alphachars default

  goto Intro   ;AA Logo Screen

init

 ;Set initial variable values
  characterset alphabet_8_wide_04
  alphachars default

 ;Set Touchdowns to 0 and Down to 1
  scorea=0:scoreb=1

 ;Set Initial Location of Quarterback and Receiver
  Quarterback_X=74 : Quarterback_Y=170
  Receiver_X=74    : Receiver_Y=150

 ;Set Initial Location of Defensive Players
  Defense1_X=26  : Defense1_Y=24
  Defense2_X=42  : Defense2_Y=18
  Defense3_X=58  : Defense3_Y=18
  Defense4_X=74  : Defense4_Y=18
  Defense5_X=90  : Defense5_Y=17
  Defense6_X=106 : Defense6_Y=18
  Defense7_X=122 : Defense7_Y=24

 ;Set up the initial state of the Football
  Football_State=$00      ;$00 = Quarterback's Hands, $01 In the air, $02 Receiver's Hands
  Ball_Received=$00       ;$00 = Ball not in receiver's Hands, $01 = Ball in Receiver's Hands
  Football_X=Quarterback_X+6:Football_Y=Quarterback_Y-2
  
 ;Set Game_Event Monitor to $00, which is Active Play
  Game_Event=$00          ;$00 = Active Play, $01 = Touchdown, $02 = Down, $03 = Incomplete Pass, $04=Out of Bounds

  animation_frame=0
  Game_Paused=$00 ; Start the game for the first time in a paused state, press right fire to begin

 ;This is a flag for reaching the bottom and turning around - same for then reaching the top and turning back down again.
  Reached_Bottom1=$00
  Reached_Bottom2=$00
  Reached_Bottom3=$00
  Reached_Bottom4=$00
  Reached_Bottom5=$00
  Reached_Bottom6=$00
  Reached_Bottom7=$00

 ;Additional speed variable that can be added for a blitz
  Blitz_Speed=0.5

 ;Referee Variables
  Referee_X=32
  Ref_Active=$00

 ;Title Screen Menu Variables
  Menu_Select=$01
  Menu_Option=$02
  Menu_Option_Color=2
  Cone_X=0
  Cone_Y=176
  Football2_X=113
  Football2_Y=209
  frame_counter=0
  frame_counter2=0
  animation_frame=0

 ; ┌────────────────────────────┐ 
 ; │  TITLE SCREEN LOOP BEGINS  ▐■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■► ●══►                                                                         │
 ; └────────────────────────────┘ 

titlescreen
  ; Play opening sound effect or song here
  clearscreen
  ;playsong salvotheme 130
  Football_X=14
  Football_Y=164
  P1_Color=0
  P2_Color=7
  gosub titlespeak
titlescreen_loop
  drawwait
  clearscreen
 ;Put in as a test
  ;adjustvisible 3 13
 ;Set Title Screen Background Color
  BACKGRND=$00  ; $F2Set Brown Background for Title Screen Loop
 ;Seed the Play Randomizer
  frame_counter=frame_counter+1
 ;When you start the game for the first time, the starting play changes, but otherwise continues in the same order.
  if frame_counter>17  then Assigned_Play=0:Play_Randomizer1=rand
  if frame_counter>33  then Assigned_Play=1:Play_Randomizer2=rand
  if frame_counter>82  then Assigned_Play=2:Play_Randomizer3=rand
  if frame_counter>123 then Assigned_Play=3:Play_Randomizer4=rand
  if frame_counter>157 then Assigned_Play=4:Play_Randomizer5=rand
  if frame_counter>181 then Assigned_Play=5:Play_Randomizer6=rand
  if frame_counter>209 then Assigned_Play=3:Play_Randomizer7=rand
  if frame_counter>227 then Assigned_Play=1:Play_Randomizer8=rand
 ;Set Title Screen Colors
  P0C1=$82 : P0C2=$38 : P0C3=$0A  ; Football Player Background 
  P1C1=$0C : P1C2=$0C : P1C3=$0C  ; All White 
  P2C1=$1E : P2C2=$00 : P2C3=$18  ; Yellow Football
  P3C1=$C8 : P3C2=$C8 : P3C3=$C8  ; All Green         
  P4C1=$52 : P4C2=$00 : P4C3=$34  ; Cones / Orange and Black
  P5C1=$EC : P5C2=$08 : P5C3=$F2  ; Brown Football 
  P6C1=$00 : P6C2=$0C : P6C3=$42  ; Red Football
  P7C1=$00 : P7C2=$42 : P7C3=$3D  ; Tan Football
 ;Debounce the Joystick Fire button
  if joy0fire1 then debounce=1
  if !joy0fire1 && debounce=1 then debounce=2
 ;Debounce moving the joystick left
  if joy0left then Debounce_Left=1
  if !joy0left && Debounce_Left=1 then Debounce_Left=2
 ;Debounce moving the joystick right
  if joy0right then Debounce_Right=1
  if !joy0right && Debounce_Right=1 then Debounce_Right=2
 ;Debounce moving the joystick up
  if joy0up then Debounce_Up=1
  if !joy0up && Debounce_Up=1 then Debounce_Up=2
 ;Debounce moving the joystick down
  if joy0down then Debounce_Down=1
  if !joy0down && Debounce_Down=1 then Debounce_Down=2
 ;Frame Counters for Animation and Defensive Play Randomization
  frame_counter2=frame_counter2+1                   ; The counter for all Player animation
  if frame_counter2=3   then animation_frame=animation_frame+1:frame_counter2=0 ; Slow down the animation
  if animation_frame>3  then animation_frame=0    ; Three frames of animation
 ;Plot Sprites
  plotsprite cone 4 Cone_X Cone_Y
  plotsprite fball_anim1 F_clr Football_X Football_Y animation_frame ;10 192
 ;Move Cone selection sprite up and down
  if Debounce_Up && Cone_Y=208 then playsfx sfx_menumove:Debounce_Up=0:Cone_Y=176:Cone_X=0
  if Debounce_Down && Cone_Y=176 then playsfx sfx_menumove:Debounce_Down=0:Cone_Y=208:Cone_X=18
  if debounce=2 && Cone_Y=176 then debounce=0
 ;Change Menu Option based on difficulty selection         1 - 5 - 2 - 3 - 4     4 - 3 - 2 - 5 - 1
 ;Move Joystick Left
  if Cone_Y=176 && Menu_Option=$01 && Debounce_Left=2 then playsfx sfx_denied:Debounce_Left=0:Menu_Option=$01 
  if Cone_Y=176 && Menu_Option=$05 && Debounce_Left=2 then playsfx sfx_menuselect:Debounce_Left=0:Menu_Option=$01  ; Easy      $05 
  if Cone_Y=176 && Menu_Option=$02 && Debounce_Left=2 then playsfx sfx_menuselect:Debounce_Left=0:Menu_Option=$05  ; Practice  $01
  if Cone_Y=176 && Menu_Option=$03 && Debounce_Left=2 then playsfx sfx_menuselect:Debounce_Left=0:Menu_Option=$02  ; Standard  $02
  if Cone_Y=176 && Menu_Option=$04 && Debounce_Left=2 then playsfx sfx_menuselect:Debounce_Left=0:Menu_Option=$03  ; Advanced  $03
 ;Move Joystick Right
  if Cone_Y=176 && Menu_Option=$01 && Debounce_Right=2 then playsfx sfx_menuselect:Debounce_Right=0:Menu_Option=$05 ; Practice $01 -> Easy $05
  if Cone_Y=176 && Menu_Option=$05 && Debounce_Right=2 then playsfx sfx_menuselect:Debounce_Right=0:Menu_Option=$02 ; Easy     $05 -> Standard $02
  if Cone_Y=176 && Menu_Option=$02 && Debounce_Right=2 then playsfx sfx_menuselect:Debounce_Right=0:Menu_Option=$03 ; Standard $01 -> Advanced $03
  if Cone_Y=176 && Menu_Option=$03 && Debounce_Right=2 then playsfx sfx_menuselect:Debounce_Right=0:Menu_Option=$04 ; Advanced $03 -> Expert $04
  if Cone_Y=176 && Menu_Option=$04 && Debounce_Right=2 then playsfx sfx_denied:Debounce_Right=0:Menu_Option=$04     ; Expert   $04 -> STOP
 ;Plot Menu Options Text
  plotchars 'difficulty:' Menu_Option_Color 8 11
  if Menu_Option=$01 then plotchars 'practice' 3 94 11
  if Menu_Option=$02 then plotchars 'standard' 3 94 11
  if Menu_Option=$03 then plotchars 'advanced' 3 94 11
  if Menu_Option=$04 then plotchars ' expert' 3 94 11
  if Menu_Option=$05 then plotchars '  easy' 3 94 11
  plotchars 'start' Menu_Option_Color 26 13 : plotchars 'game' Menu_Option_Color 69 13 
  if Cone_Y=208 && joy0right then P1_Color=7:P2_Color=0:Option_2P=$01
  if Cone_Y=208 && joy0left then P1_Color=0:P2_Color=7:Option_2P=$00
  plotsprite onep P1_Color 105 211
  plotsprite twop P2_Color 117 211
 ;Display brief description of difficulty options on the screen
  ;if Menu_Option=$01 then plotchars 'no tackles' 0 40 12
  if Menu_Option=$01 then plotchars 'tackles disabled' 1 16 12
  if Menu_Option=$02 then plotchars 'default speed' 1 25 12
  if Menu_Option=$03 then plotchars 'faster defense' 1 20 12 
  if Menu_Option=$04 then plotchars 'superhuman speed' 1 15 12
  if Menu_Option=$05 then plotchars 'nice and slow' 1 25 12
 ;Change Status Bar Football Color based on Difficulty Level
  if Menu_Option=$01 then F_clr=4  ;Orange
  if Menu_Option=$02 then F_clr=5  ;Brown
  if Menu_Option=$03 then F_clr=7  ;Tan
  if Menu_Option=$04 then F_clr=6  ;Red
  if Menu_Option=$05 then F_clr=2  ;Yellow
 ;For Testing plots menu value on screen
 ; plotvalue  scoredigits_8_wide_02  3  Menu_Option   1  0 12 
  if Football_X>13 then Football_X=Football_X+2
  if Football_X>128 then Football_X=14
 ;Practice Mode = You cannot be tackled or run out of bounds. Defense Speed Matches Standard Mode.
 ;Easy Mode = Slow Defense
 ;Standard Mode = Default Defense
 ;Advanced Mode = Faster Defense
 ;Expert Mode   = Really Fast Defense
 ;Defense<x>_Speed variables control speed
 
 ;Start the game with the left fire button
  if debounce=2 && Cone_Y=208 then clearscreen:debounce=0:Debounce_Right=0:Debounce_Left=0:Debounce_Up=0:Debounce_Down=0:Assigned_Play=0:goto Choose_Team_Colors
  plotbanner tctitle7 0 0 6

  drawscreen
  goto titlescreen_loop

  rem add 'set avoxvoice on' at the top
  rem add 'inline 7800vox.asm'
  rem add subroutine for speech, then gosub to it when you want speech invoked

   inline 7800vox.asm

touchdownspeak
  speak touchdown
  return

titlespeak
  speak touchdownchallenge
  return

outofboundsspeak
  speak outofbounds
  return

incompletepassspeak
  speak incompletepass
  return

tackledspeak
  speak tackled
  return

gameoverspeak
  speak gameover
  return

rightfirespeak
  speak rightfire
  return

interceptionspeak
  speak interception
  return

 speechdata touchdown
 reset
 speed 100
 pitch 82
 phonetic 'tuch' 
 pitch 88
 speed 100
 phonetic 'daun'
end

 speechdata touchdownchallenge
 reset
 speed 100
 pitch 82
 phonetic 'tuch' 
 pitch 88
 speed 100
 phonetic 'daun'
 speed 120
 pitch 70
 phonetic 'ch'
 pitch 70
 phonetic 'al'
 pitch 70
 phonetic 'enge'
end


 ; Out of Bounds
 speechdata outofbounds
 reset
 speed 110
 pitch 88
 dictionary 'out'
 speed 100
 pitch 78
 dictionary 'of'
 speed 105
 pitch 72
 speed 100
 phonetic 'baunds'
end

 ; Incomplete Pass
 speechdata incompletepass
 reset
 speed 120
 pitch 80
 phonetic 'incompleet'
 speed 110
 pitch 78
 phonetic 'pass'
end

 ; Tackled
 speechdata tackled
 reset
 speed 120
 pitch 80
 phonetic 'tack'
 speed 100
 pitch 78
 phonetic 'ul'
 speed 80
 phonetic 'd'
end

 ; Interception
 speechdata interception
 reset
 speed 120
 pitch 80
 phonetic 'intur'
 speed 110
 pitch 78
 phonetic 'sepshun'
end

 ; Game Over
 speechdata gameover
 reset
 speed 110
  pitch 86
  phonetic 'gayme'
  pitch 82
  speed 120
  dictionary 'owe'
  speed 105
  pitch 86
  phonetic 'vur'
end

 ; Press Right Fire to Start
 speechdata rightfire
 reset
 speed 120
 pitch 82
 dictionary 'press'
 pitch 84 
 dictionary 'right'
 pitch 86
 dictionary 'fire'
 pitch 80
 dictionary 'to'
 pitch 70
 dictionary 'start'
end

 ; Are you ready for some football?
 speechdata areyouready
 reset
 speed 120
 pitch 82
 dictionary 'are'
 pitch 84 
 dictionary 'you'
 pitch 86
 dictionary 'ready'
 pitch 80
 dictionary 'for'
 pitch 76
 dictionary 'some'
 speed 70
 pitch 84
 dictionary 'football'
end

 ; < < < ◄■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■▌ TITLE SCREEN LOOP ENDS   

 ; ┌────────────────────────────────┐ 
 ; │  SET TEAM COLORS LOOP BEGINS   ▐■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■► ●══►                                                                         │
 ; └────────────────────────────────┘ 

Choose_Team_Colors

 ;Set Location of Quarterback and Receiver
  Quarterback_X=58 : Quarterback_Y=126
  Receiver_X=90    : Receiver_Y=126
 ;Set Location of Defensive Players
  Defense1_X=26  : Defense1_Y=92
  Defense2_X=42  : Defense2_Y=92
  Defense3_X=58  : Defense3_Y=92
  Defense4_X=74  : Defense4_Y=92
  Defense5_X=90  : Defense5_Y=92
  Defense6_X=106 : Defense6_Y=92
  Defense7_X=122 : Defense7_Y=92

  ;┌───────────┬────────────┬───────────┬───────────────────┬────────────────────┬────────────────────┬─────────────────────┐       
  ;│  C1 Color │ C2 Color   │ C3 Color  │ Used for          │ C1 Description     │ C2 Description     │ C3 Description      │
  ;└───────────┴────────────┴───────────┴───────────────────┴────────────────────┴────────────────────┴─────────────────────┘  
     P0C1=$EC  :  P0C2=$08  :  P0C3=$2F ;                                                               Number Text
     P1C1=$00  :  P1C2=$42  :  P1C3=$3D ; Defensive Player    Black Outline        Red Uniform          Face
     P2C1=$EC  :  P2C2=$08  :  P2C3=$F8 ; Football            Text Messages        Laces (White)        Football (Brown)
     P3C1=$EC  :  P3C2=$08  :  P3C3=$F0 ;
     P4C1=$0C  :  P4C2=$00  :  P4C3=$34 ; Cones
     P6C1=$00  :  P6C2=$86  :  P6C3=$3D ; QB/Receiver         Black Outline        Blue Uniform         Face
     P5C1=$D6  :  P5C2=$0F  :  P5C3=$D2 ; Background          Hash Marks           Yardlines            Field Color  
     P7C1=$0C  :  P7C2=$0C  :  P7C3=$0C ; All White for Text

  ;Default Colors
  Defense_Color=1 ; $42 Red
  Offense_Color=1 ; $86 Blue
  
  Debounce_L=0:Debounce_R=0:Debounce_U=0:Debounce_D=0:debounce=0

Choose_Team_Colors_Loop

 ;──═◙ Joystick Debounce
  if joy0fire then debounce=5
  if !joy0fire && debounce=5 then debounce=6
  if joy0right then Debounce_R=5
  if !joy0right && Debounce_R=5 then Debounce_R=6
  if joy0left then Debounce_L=5
  if !joy0left && Debounce_L=5 then Debounce_L=6
  if joy0up then Debounce_U=5
  if !joy0up && Debounce_U=5 then Debounce_U=6
  if joy0down then Debounce_D=5
  if !joy0down && Debounce_D=5 then Debounce_D=6

 ;──═◙ Change Colors
  ;Change Defense Color with Left/Right Joystick Movement
  ;Default Red Uniform is P1C2=$42
  if Debounce_R=6 then Defense_Color=Defense_Color+1:Debounce_R=0
  if Debounce_L=6 then Defense_Color=Defense_Color-1:Debounce_L=0
  ;Change Offense Color with Up/Down Joystick Movement
  ;Default Blue Uniform is P6C2=$86 
  if Debounce_U=6 then Offense_Color=Offense_Color+1:Debounce_U=0
  if Debounce_D=6 then Offense_Color=Offense_Color-1:Debounce_D=0
  gosub Set_Defense_Color
  gosub Set_Offense_Color

  drawwait
  clearscreen

 ;──═◙ Plot the Football field
  ;┌───────────┬───────────────────────┬─────────┬───┬───┬───────┬────────┐       
  ;│ Code      │      mapdata          │ palette │ X │ Y │ Width │ Height │    
  ;└───────────┴───────────────────────┴─────────┴───┴───┴───────┴────────┘   
  plotmap         football_field_menu      5       0   0    20       14   

 ;──═◙ Plot Players
  ;┌───────────┬────────────┬─────────┬──────────────┬──────────────┬─────────────────┬─────────────────────────────────────────┐       
  ;│ Code      │   sprite   │ palette │      X       │      Y       │ animation frame │   Notes                                 │
  ;└───────────┴────────────┴─────────┴──────────────┴──────────────┴─────────────────┴─────────────────────────────────────────┘
  plotsprite    Player_Anim1     1      Defense1_X    Defense1_Y     ; No Animation     ; Plot the 1st Defensive Player Sprite
  plotsprite    Player_Anim1     1      Defense2_X    Defense2_Y     ; No Animation     ; Plot the 2nd Defensive Player Sprite
  plotsprite    Player_Anim1     1      Defense3_X    Defense3_Y     ; No Animation     ; Plot the 3rd Defensive Player Sprite
  plotsprite    Player_Anim1     1      Defense4_X    Defense4_Y     ; No Animation     ; Plot the 4th Defensive Player Sprite
  plotsprite    Player_Anim1     1      Defense5_X    Defense5_Y     ; No Animation     ; Plot the 5th Defensive Player Sprite
  plotsprite    Player_Anim1     1      Defense6_X    Defense6_Y     ; No Animation     ; Plot the 6th Defensive Player Sprite
  plotsprite    Player_Anim1     1      Defense7_X    Defense7_Y     ; No Animation     ; Plot the 7th Defensive Player Sprite
  plotsprite    Player_UAnim1    6      Receiver_X    Receiver_Y     ; No Animation     ; Plot the Offensive Receiver Sprite
  plotsprite    Player_UAnim1    6      Quarterback_X Quarterback_Y  ; No Animation     ; Plot the Quarterback Sprite
  plotsprite    cone             4      11            75
  plotsprite    cone             4      11            133
  plotsprite    cone             4      140           75
  plotsprite    cone             4      140           133
  plotsprite    arrows_u         2      28            143
  plotsprite    arrows_d         2      114           141
  plotsprite    arrows_l         2      28            65
  plotsprite    arrows_r         2      114           65
  plotsprite    fball_anim1      3      72            114


 ;──═◙ Plot Text
  plotchars 'choose team colors' 7 8 2
  plotchars 'press left fire' 7 18 11
  plotchars 'to continue' 7 34 12
  plotchars 'defense' 2 42 4
  plotchars 'offense' 2 42 9 
  plotvalue scoredigits_8_wide_02 0 D_Menu 2 100 4
  plotvalue scoredigits_8_wide_02 0 O_Menu 2 100 9

  if debounce=6 then gosub Reset_Game:gosub Set_Speed:speak rightfire: goto start

  drawscreen
  goto Choose_Team_Colors_Loop

 ; < < < ◄■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■▌ SET TEAM COLORS LOOP ENDS

 ;Subroutine for choosing Offense Player Colors
Set_Offense_Color
 if Offense_Color<1 then Offense_Color=32
 if Offense_Color>32 then Offense_Color=1
 if Offense_Color=1 then P6C1=$00 : P6C2=$86 : P6C3=$36 : O_Menu=$01
 if Offense_Color=2 then P6C1=$04 : P6C2=$00 : P6C3=$36 : O_Menu=$02
 if Offense_Color=3 then P6C1=$00 : P6C2=$04 : P6C3=$36 : O_Menu=$03
 if Offense_Color=4 then P6C1=$60 : P6C2=$08 : P6C3=$36 : O_Menu=$04
 if Offense_Color=5 then P6C1=$00 : P6C2=$22 : P6C3=$36 : O_Menu=$05
 if Offense_Color=6 then P6C1=$E8 : P6C2=$F4 : P6C3=$36 : O_Menu=$06
 if Offense_Color=7 then P6C1=$00 : P6C2=$28 : P6C3=$36 : O_Menu=$07
 if Offense_Color=8 then P6C1=$00 : P6C2=$2C : P6C3=$36 : O_Menu=$08
 if Offense_Color=9 then P6C1=$04 : P6C2=$30 : P6C3=$36 : O_Menu=$09
 if Offense_Color=10 then P6C1=$98 : P6C2=$70 : P6C3=$36 : O_Menu=$10
 if Offense_Color=11 then P6C1=$00 : P6C2=$38 : P6C3=$36 : O_Menu=$11
 if Offense_Color=12 then P6C1=$42 : P6C2=$3C : P6C3=$36 : O_Menu=$12
 if Offense_Color=13 then P6C1=$00 : P6C2=$48 : P6C3=$36 : O_Menu=$13
 if Offense_Color=14 then P6C1=$40 : P6C2=$EC : P6C3=$36 : O_Menu=$14
 if Offense_Color=15 then P6C1=$04 : P6C2=$50 : P6C3=$36 : O_Menu=$15
 if Offense_Color=16 then P6C1=$E0 : P6C2=$5A : P6C3=$36 : O_Menu=$16
 if Offense_Color=17 then P6C1=$04 : P6C2=$B0 : P6C3=$36 : O_Menu=$17
 if Offense_Color=18 then P6C1=$04 : P6C2=$60 : P6C3=$36 : O_Menu=$18
 if Offense_Color=19 then P6C1=$00 : P6C2=$68 : P6C3=$36 : O_Menu=$19 
 if Offense_Color=20 then P6C1=$D4 : P6C2=$72 : P6C3=$36 : O_Menu=$20 
 if Offense_Color=21 then P6C1=$00 : P6C2=$78 : P6C3=$36 : O_Menu=$21 
 if Offense_Color=22 then P6C1=$32 : P6C2=$88 : P6C3=$36 : O_Menu=$22 
 if Offense_Color=23 then P6C1=$30 : P6C2=$8C : P6C3=$36 : O_Menu=$23 
 if Offense_Color=24 then P6C1=$00 : P6C2=$98 : P6C3=$36 : O_Menu=$24
 if Offense_Color=25 then P6C1=$EF : P6C2=$40 : P6C3=$36 : O_Menu=$25
 if Offense_Color=26 then P6C1=$28 : P6C2=$A2 : P6C3=$36 : O_Menu=$26
 if Offense_Color=27 then P6C1=$00 : P6C2=$AC : P6C3=$36 : O_Menu=$27
 if Offense_Color=28 then P6C1=$06 : P6C2=$20 : P6C3=$36 : O_Menu=$28
 if Offense_Color=29 then P6C1=$40 : P6C2=$BA : P6C3=$36 : O_Menu=$29
 if Offense_Color=30 then P6C1=$00 : P6C2=$E8 : P6C3=$36 : O_Menu=$30
 if Offense_Color=31 then P6C1=$08 : P6C2=$E0 : P6C3=$36 : O_Menu=$31
 if Offense_Color=32 then P6C1=$00 : P6C2=$A4 : P6C3=$36 : O_Menu=$32
 return

 ;Subroutine for choosing Defense Player Colors
Set_Defense_Color
 if Defense_Color<1 then Defense_Color=32
 if Defense_Color>32 then Defense_Color=1
 if Defense_Color=1 then P1C1=$00 : P1C2=$42 : P1C3=$36 : D_Menu=$01 ; Medium Red (Default)
 if Defense_Color=2 then P1C1=$04 : P1C2=$00 : P1C3=$36 : D_Menu=$02 ; Black
 if Defense_Color=3 then P1C1=$22 : P1C2=$E4 : P1C3=$36 : D_Menu=$03 ; Green
 if Defense_Color=4 then P1C1=$02 : P1C2=$B6 : P1C3=$36 : D_Menu=$04 ; Green Uniform
 if Defense_Color=5 then P1C1=$42 : P1C2=$CF : P1C3=$36 : D_Menu=$05 ; Green Uniform
 if Defense_Color=6 then P1C1=$20 : P1C2=$C4 : P1C3=$36 : D_Menu=$06 ; Green Uniform
 if Defense_Color=7 then P1C1=$30 : P1C2=$9A : P1C3=$36 : D_Menu=$07 ; Baby Blue
 if Defense_Color=8 then P1C1=$04 : P1C2=$90 : P1C3=$36 : D_Menu=$08
 if Defense_Color=9 then P1C1=$00 : P1C2=$80 : P1C3=$36 : D_Menu=$09
 if Defense_Color=10 then P1C1=$C4 : P1C2=$40 : P1C3=$36 : D_Menu=$10 ; Dark Red  
 if Defense_Color=11 then P1C1=$04 : P1C2=$7C : P1C3=$36 : D_Menu=$11
 if Defense_Color=12 then P1C1=$14 : P1C2=$70 : P1C3=$36 : D_Menu=$12 ;           
 if Defense_Color=13 then P1C1=$00 : P1C2=$6A : P1C3=$36 : D_Menu=$13 ; Pink
 if Defense_Color=14 then P1C1=$EA : P1C2=$50 : P1C3=$36 : D_Menu=$14 ; Purple
 if Defense_Color=15 then P1C1=$42 : P1C2=$EF : P1C3=$36 : D_Menu=$15 ; EF(Bright Yellow)
 if Defense_Color=16 then P1C1=$00 : P1C2=$DA : P1C3=$36 : D_Menu=$16 ; 
 if Defense_Color=17 then P1C1=$02 : P1C2=$44 : P1C3=$36 : D_Menu=$17 ; Light Red?
 if Defense_Color=18 then P1C1=$00 : P1C2=$2F : P1C3=$36 : D_Menu=$18
 if Defense_Color=19 then P1C1=$00 : P1C2=$3F : P1C3=$36 : D_Menu=$19
 if Defense_Color=20 then P1C1=$42 : P1C2=$AF : P1C3=$36 : D_Menu=$20 
 if Defense_Color=21 then P1C1=$02 : P1C2=$20 : P1C3=$36 : D_Menu=$21
 if Defense_Color=22 then P1C1=$00 : P1C2=$1F : P1C3=$36 : D_Menu=$22
 if Defense_Color=23 then P1C1=$04 : P1C2=$B0 : P1C3=$36 : D_Menu=$23
 if Defense_Color=24 then P1C1=$F2 : P1C2=$A0 : P1C3=$36 : D_Menu=$24 ; 
 if Defense_Color=25 then P1C1=$00 : P1C2=$12 : P1C3=$36 : D_Menu=$25
 if Defense_Color=26 then P1C1=$98 : P1C2=$10 : P1C3=$36 : D_Menu=$26 ; 
 if Defense_Color=27 then P1C1=$02 : P1C2=$08 : P1C3=$36 : D_Menu=$27 ; 
 if Defense_Color=28 then P1C1=$00 : P1C2=$8F : P1C3=$36 : D_Menu=$28
 if Defense_Color=29 then P1C1=$00 : P1C2=$02 : P1C3=$36 : D_Menu=$29
 if Defense_Color=30 then P1C1=$00 : P1C2=$3A : P1C3=$36 : D_Menu=$30
 if Defense_Color=31 then P1C1=$00 : P1C2=$76 : P1C3=$36 : D_Menu=$31
 if Defense_Color=32 then P1C1=$00 : P1C2=$FF : P1C3=$36 : D_Menu=$32
 return

start

 ;Assign Colors
 ;Commented out the Defense & Offense player colors, as they are now chosen beforehand.
 ;┌───────────┬────────────┬─────────┬───────────────────┬─────────────────────────────┬────────────────────┬─────────────────────┐       
 ;│  C1 Color │ C2 Color   │ C3 Color│ Used for          │ C1 Description              │ C2 Description     │ C3 Description      │
 ;└───────────┴────────────┴─────────┴───────────────────┴─────────────────────────────┴────────────────────┴─────────────────────┘  
  P0C1=$00  :  P0C2=$00  :  P0C3=$42 ; Title Screen Msgs   Black                         Black                $42   
 ;P1C1=$00  :  P1C2=$42  :  P1C3=$3D ; Defensive Player    Black Outline                 Red Uniform          Face
  P2C1=$EC  :  P2C2=$08  :  P2C3=$F0 ; Football/Msgs       Text Messages                 Laces (White)        Football (Brown)
  P3C1=$3A  :  P3C2=$1A  :  P3C3=$EF ; Goalpost            Tops of each post             Yellow Posts         Shadow Line
  P4C1=$0C  :  P4C2=$00  :  P4C3=$34 ; Cones/Referee       White (For Referee)           Middle (Black)       Outside (Orange)
  P5C1=$C6  :  P5C2=$1C  :  P5C3=$44 ; Action Messages     Text                                               Box Outline
 ;P6C1=$00  :  P6C2=$86  :  P6C3=$3D ; QB/Receiver         Black Outline                 Blue Uniform         Face
  P7C1=$D6  :  P7C2=$0F  :  P7C3=$D2 ; Background          Logo outline and hash marks   Yardlines            Field Color  
  BACKGRND=$D2

 ;Plot the background football field
  gosub Plot_Football_Field

 ;Reset Frame Counters
  animation_frame=0
  animation_frame2=0
  frame_counter=0
  frame_counter2=0

 ; ┌────────────────────────┐ 
 ; │ MAIN GAME LOOP BEGINS  ▐■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■► > > >
 ; └────────────────────────┘ 

main

 ; ════════════════════════════════════════════════════════════════════════════
 ; Section 1: Game Logic
 ; ════════════════════════════════════════════════════════════════════════════

 ;──═◙ Reset Game if you press Reset
 if switchreset then reboot

 ;──═◙ Joystick Debounce
 ;Debounce the Right Fire Button
  if joy0fire0 then Debounce_R=5
  if !joy0fire0 && Debounce_R=5 then Debounce_R=6
 ;Debounce the Left Fire Button
  if joy0fire1 then Debounce_L=5
  if !joy0fire1 && Debounce_L=5 then Debounce_L=6

 ;──═◙ Background and Randomization
 ;Set the background color to black
  BACKGRND=$00
 ;Set Play Randomization variables
  if frame_counter2>5  then Play_Randomizer1=rand&63
  if frame_counter2>12 then Play_Randomizer2=rand&63
  if frame_counter2>17 then Play_Randomizer3=rand&63
  if frame_counter2>27 then Play_Randomizer4=rand&63
  if frame_counter2>35 then Play_Randomizer5=rand&63
  if frame_counter2>42 then Play_Randomizer6=rand&63
  if frame_counter2>50 then Play_Randomizer7=rand&63
  if frame_counter2>31 then Play_Randomizer8=rand&63

 ;──═◙ Frame Counters for Defensive Plays and Animation
 ;Frame Counters for Animation and Defensive Play Randomization
  frame_counter=frame_counter+1                   ; The counter for all Player animation
  frame_counter2=frame_counter2+1                 ; Changes when Play_Randomizer8 is re-seeded
  if frame_counter=7    then animation_frame=animation_frame+1:animation_frame2=animation_frame2+1:frame_counter=0 ; Slow down the animation
  if animation_frame>2  then animation_frame=0    ; Three frames of animation
  if animation_frame2>2 then animation_frame2=0   ; Three frames of animation
  if frame_counter2>60  then frame_counter2=0     ; Frame Counter used for player movement randomization

 ;Frame Counters for Animation and Defensive Play Randomization
  frame_counter3=frame_counter3+1                   ; The counter for all Player animation
  if frame_counter3=3    then animation_frame3=animation_frame3+1:frame_counter3=0 ; Slow down the animation
  if animation_frame3>3  then animation_frame3=0    ; Three frames of animation

 ;──═◙ Change Status Bar Football Color based on Difficulty Level
  if Menu_Option=$01 then F_clr=4  ;Orange
  if Menu_Option=$02 then F_clr=2  ;Brown
  if Menu_Option=$03 then F_clr=1  ;Tan
  if Menu_Option=$04 then F_clr=5  ;Red

 ;──═◙ Detect Game Event and Process appropriately
  ; Game_Event=$00 > Active Play
  ; Game_Event=$01 > Touchdown
  ; Game_Event=$02 > Down
  ; Game_Event=$03 > Incomplete Pass
  ; Game_Event=$04 > Out of Bounds
 
 ;Specific Plays 
  ; Plays are mostly just random, these were my ideas when I started, not neccessarily the end result. :)
  ; Assigned_Play=0 > Random Default Play
  ; Assigned_Play=1 > Skew to the left a bit
  ; Assigned_Play=2 > One Defender hangs back to cover the receiver
  ; Assigned_Play=3 > Outside 2 Defenders covers the receiver, but makes it a bit easier to run up the sideline
  ; Assigned_Play=4 > Blitz, middle defender can block passes
  ; Assigned_Play=5 > Random, three defenders hang back to cover the middle after turning around

 ;──═◙ Assign a Defensive Play
  ;Assign one of 6 Different Defensive Plays, in the same order, for each down
  ;They are incremented by one on each down, incomplete pass, or touchdown in the game event subroutines
  on Assigned_Play goto p0 p1 p2 p3 p4 p5
Assigned_Play_Return

 ;──═◙ Check for a Touchdown
  ;If football crosses the goal line in the QB or Receiver's hands, it's a touchdown
  ;In Receiver's Hands if Ball_Received is $01 - Reposition the football and change Game_Event to Touchdown scored
   if Football_Y<18 && Ball_Received=$01 then Ref_Active=$01:Football_X=Receiver_X+6:Football_Y=Receiver_Y-2:plotsprite football 2 Football_X Football_Y:Game_Event=$01  
  ;In QB's Hands if Football_State is $00 - Reposition the football and change Game_Event to Touchdown scored
   if Football_Y<18 && Football_State=$00 then Ref_Active=$01:Football_X=Quarterback_X+6:Football_Y=Quarterback_Y-2:plotsprite football 2 Football_X Football_Y:Game_Event=$01 
  ;If football crosses the goal line and it's not in anyone's hands, it's incomplete
   if Football_Y<13 && Football_State=$01 && Ball_Received=$00 then Ref_Active=$01:Game_Event=$03 ; Ball is in the air not recieved, and in end zone.
 
   if joy0any && frame_counter=6 then playsfx sfx_walk
   
 ;──═◙ Check for Game Events
  ; $00 = Active Play
  ; $01 = Touchdown
  ; $02 = Down
  ; $03 = Incomplete Pass
  ; $04 = Out of Bounds
   if Game_Event=$01 then goto Game_Event_Touchdown      ; Touchdown (Ball is either run or passed into the endzone)
   if Game_Event=$02 then goto Game_Event_Down           ; Down by being tackled (touching a defensive player when you have the football)
   if Game_Event=$03 then goto Game_Event_IncompletePass ; Down by throwing an incomplete pass into the end zone
   if Game_Event=$04 then goto Game_Event_OutOfBounds    ; Down by running out of bounds
   if Game_Event=$05 then goto Game_Event_Interception   ; Pass caught by defender

 ;──═◙ Passing / Adjusting the Location of the Football
  ; $00 = In the Quarterback's Hands
  ; $01 = In the air
  ; $02 = In the Receiver's Hands
   if Football_State=$00 then Football_X=Quarterback_X+6:Football_Y=Quarterback_Y-2        ;Keep Football in Quarterback's hands
   if Football_State=$01 && Football_Y>8 && Ball_Received=$00 then Football_Y=Football_Y-3 ;Pass football until it reaches the end zone, then it stops.    
   if Football_State=$03 then Ball_Received=$01                                            ;If the ball touches the receiver, Set flag to ball caught.
  ;Pass the Ball
   if Debounce_R=6 then Debounce_R=0:playsfx sfx_pass:Pass_Path=Quarterback_X:Football_State=$01            ;Set X Path to most recent QB X Location, set Flag to Ball is being passed
  ;Catch the Ball
   if Ball_Received=$01 then Football_X=Receiver_X+6:Football_Y=Receiver_Y-2               ;Once the receiver catches it, keep the football with him

 ;──═◙ Angled Passing
  ;If the football is in the quarterback's hands, check the last direction the quarterback moved (for passing at an angle later)
   if Football_State=$00 && joy0right then Last_Quarterback_X=$01
   if Football_State=$00 && joy0left then Last_Quarterback_X=$02
   if Football_State=$00 && !joy0left && !joy0right then Last_Quarterback_X=$00
  ;If the football is being passed, and the last joystick movement was to the left or right, angle the pass left or right
   if Football_State=$01 && Last_Quarterback_X=$01 then Football_X=Football_X+1 ; Angle the football to the right
   if Football_State=$01 && Last_Quarterback_X=$02 then Football_X=Football_X-1 ; Angle the football to the left
  ;You can throw the ball out of bounds on the left or right side at an angle, which is an incomplete pass
   if Football_X<8 then Game_Event=$03  ; Incomplete Pass
   if Football_X>144 then Game_Event=$03 ; Incomplete Pass

 ;──═◙ Adjustments for Quarterback and Receiver
  ; Move the Quarterback
   if joy0right && Quarterback_X<132 then Quarterback_X=Quarterback_X+1 ; Move Quarterback Right, keep him on the field
   if joy0left  && Quarterback_X>17  then Quarterback_X=Quarterback_X-1 ; Move Quarterback left, keep him on the field
   if joy0up    && Quarterback_Y>8   then Quarterback_Y=Quarterback_Y-1 ; Move Quarterback up, but not so far as to leave the end zone.
   if joy0down  && Quarterback_Y<180 then Quarterback_Y=Quarterback_Y+1 ; Move Quarterback down, but don't let him move down so far as to leave the end zone
  ; Quarterback stays on screen without the ball
   if Quarterback_X<17  && Ball_Received=$01 then Quarterback_X=18      ; Quarterback does not have the ball and is out of bounds, keep him on-screen
   if Quarterback_X>132 && Ball_Received=$01 then Quarterback_X=131     ; Quarterback does not have the ball and is out of bounds, keep him on-screen
  ; Check for Practice Mode
   if Menu_Option=$01 then goto Skip_OutOfBounds                        ; If you're in practice mode, running out of bounds will not be called
   if Football_State<>$00 then goto Skip_OutOfBounds
  ; Quarterback runs out of bounds
   if Quarterback_X<18  && Ball_Received=$00 then Game_Event=$04        ; Quarterback has the ball & ran out of bounds, set Game_Event to $04
   if Quarterback_X>131 && Ball_Received=$00 then Game_Event=$04        ; Quarterback has the ball & ran out of bounds, set Game_Event to $04
Skip_OutOfBounds
  ; Move Receiver back and forth (not randomly) once he reaches the end zone
   if Move_LR=1 then Receiver_X=Receiver_X+1
   if Move_LR=0 then Receiver_X=Receiver_X-1
   if Receiver_X<32 then Move_LR=1
   if Receiver_X>115 then Move_LR=0

 ;──═◙ 2 Player Optional Defensive Movement (skip this section if 1P is selected)
  ;Player takes over 3rd Defender 
   if Option_2P=$00 then goto Skip_2P_All
   if Menu_Option=$01 || Menu_Option=$02 then goto 2P_Standard
   if Menu_Option=$03 then goto 2P_Advanced
   if Menu_Option=$04 then goto 2P_Expert
  ;Standard Movemnt (Matches Practice)
  goto 2P_Movement_Skip
2P_Standard
   if joy1down  then Defense3_Y=Defense3_Y+1.2
   if joy1up    then Defense3_Y=Defense3_Y-1.2
   if joy1left  then Defense3_X=Defense3_X-1.2
   if joy1right then Defense3_X=Defense3_X+1.2
  goto 2P_Movement_Skip
  ;Advanced Movement (Slightly faster than fastest defender)
2P_Advanced
   if joy1down  then Defense3_Y=Defense3_Y+1.8
   if joy1up    then Defense3_Y=Defense3_Y-1.8
   if joy1left  then Defense3_X=Defense3_X-1.8
   if joy1right then Defense3_X=Defense3_X+1.8
  goto 2P_Movement_Skip
  ;Expert Movement (Slightly faster than fastest defender)
2P_Expert
   if joy1down  then Defense3_Y=Defense3_Y+2.1
   if joy1up    then Defense3_Y=Defense3_Y-2.1
   if joy1left  then Defense3_X=Defense3_X-2.1
   if joy1right then Defense3_X=Defense3_X+2.1
2P_Movement_Skip
  ;Keep Player controlled defender on screen
   if Defense3_X<18 then Defense3_X=Defense3_X+2.0
   if Defense3_X>131 then Defense3_X=Defense3_X-2.0
   if Defense3_Y<18 then Defense3_Y=Defense3_Y+2.0
   if Defense3_Y>190 then Defense3_Y=Defense3_Y-2.0
Skip_2P_All

 ;──═◙ Defensive Adjustments
  ; Move Defensive Players 1 and 7 back and forth (not randomly) at the top of the field
  ; Only applies to Assigned Play 3, two receivers stay back to cover the receiver.
   if Assigned_Play<>$03 then Skip_3_Cover
  ; Defender 1 - On the far left of the screen when lining up
   if Move_LR_2=1 then Defense1_X=Defense1_X+Defense1_Speed
   if Move_LR_2=0 then Defense1_X=Defense1_X-Defense1_Speed
   if Defense1_X<62 then Move_LR_2=1
   if Defense1_X>125 then Move_LR_2=0
  ; Defender 7 - On the far right of the screen when lining up
   if Move_LR_3=1 then Defense7_X=Defense7_X+Defense7_Speed
   if Move_LR_3=0 then Defense7_X=Defense7_X-Defense7_Speed
   if Defense7_X<19 then Move_LR_3=1
   if Defense7_X>100 then Move_LR_3=0
Skip_3_Cover
  ; Defender 4 - Middle Defender Covers receiver
   if Assigned_Play<>$02 then Skip_2_Cover
   if Move_LR_4=1 then Defense4_X=Defense4_X+Defense4_Speed
   if Move_LR_4=0 then Defense4_X=Defense4_X-Defense4_Speed
   if Defense4_X<48 then Move_LR_4=1
   if Defense4_X>101 then Move_LR_4=0
Skip_2_Cover
  ; Defender 5 6 7 on Play 5 - Middle Cover
   if Assigned_Play<>$05 then Skip_5_Cover
  ; Defender 5
   if Move_LR_5=1 then Defense5_X=Defense5_X+Defense5_Speed
   if Move_LR_5=0 then Defense5_X=Defense5_X-Defense5_Speed
   if Defense5_X<48 then Move_LR_5=1
   if Defense5_X>101 then Move_LR_5=0
  ; Defender 6
   if Move_LR_6=1 then Defense6_X=Defense6_X+Defense6_Speed
   if Move_LR_6=0 then Defense6_X=Defense6_X-Defense6_Speed
   if Defense6_X<48 then Move_LR_6=1
   if Defense6_X>101 then Move_LR_6=0
  ; Defender 7
   if Move_LR_7=1 then Defense7_X=Defense7_X+Defense7_Speed
   if Move_LR_7=0 then Defense7_X=Defense7_X-Defense7_Speed
   if Defense7_X<48 then Move_LR_7=1
   if Defense7_X>101 then Move_LR_7=0
Skip_5_Cover

 ;──═◙ Defensive Movement
  ; Set top Limit for Defensive Players before they turn around and head back down the screen, and set the Reached_Bottom Flag to change direction
   if Defense1_Y<24 then Reached_Bottom1=$00                             ; If Defensive Player 1 reaches the 10 yard line moving back up, change direction
   if Defense2_Y<25 then Reached_Bottom2=$00                             ; If Defensive Player 2 reaches the 10 yard line moving back up, change direction
   if Defense3_Y<24 then Reached_Bottom3=$00                             ; If Defensive Player 3 reaches the 10 yard line moving back up, change direction
   if Defense4_Y<24 then Reached_Bottom4=$00                             ; If Defensive Player 4 reaches the 10 yard line moving back up, change direction
   if Defense5_Y<27 then Reached_Bottom5=$00                             ; If Defensive Player 5 reaches the 10 yard line moving back up, change direction
   if Defense6_Y<24 then Reached_Bottom6=$00                             ; If Defensive Player 6 reaches the 10 yard line moving back up, change direction
   if Defense7_Y<28 then Reached_Bottom7=$00                             ; If Defensive Player 7 reaches the 10 yard line moving back up, change direction
 ; Set Bottom Limit for Defensive Players before they turn around and head back up the screen, and set the Reached_Bottom Flag to change direction
   if Defense1_Y>152 then Reached_Bottom1=$01                            ; If Defensive Player 1 reaches the bottom of the field, change direction
   if Defense2_Y>162 then Reached_Bottom2=$01                            ; If Defensive Player 2 reaches the bottom of the field, change direction
   if Defense3_Y>159 then Reached_Bottom3=$01                            ; If Defensive Player 3 reaches the bottom of the field, change direction
   if Defense4_Y>155 then Reached_Bottom4=$01                            ; If Defensive Player 4 reaches the bottom of the field, change direction
   if Defense5_Y>164 then Reached_Bottom5=$01                            ; If Defensive Player 5 reaches the bottom of the field, change direction
   if Defense6_Y>172 then Reached_Bottom6=$01                            ; If Defensive Player 6 reaches the bottom of the field, change direction
   if Defense7_Y>168 then Reached_Bottom7=$01                            ; If Defensive Player 7 reaches the bottom of the field, change direction
 ;Randomly move Defensive players toward the football
  ; Defense will no longer randomly move toward the Quarterback once the ball is passed, they move toward the football
  if Assigned_Play=4 then goto Skip_Defense_LR ; Skip L/R Movement on a blitz. Only applies to Play 4.
  ; Defenders 1 and 7 are logically separated because they are also used to cover receivers in Play 4, if I decide to change them here.
  if Defense1_X<Football_X && Play_Randomizer1<18 then Defense1_X=Defense1_X+Defense1_Speed
  if Defense7_X<Football_X && Play_Randomizer7<16 then Defense7_X=Defense7_X+Defense7_Speed
  if Defense1_X>Football_X && Play_Randomizer1<14 then Defense1_X=Defense1_X-Defense1_Speed
  if Defense7_X>Football_X && Play_Randomizer7<16 then Defense7_X=Defense7_X-Defense7_Speed
  ; ---------------------------------------------------------------------------------------
  if Reached_Bottom1=$01 then goto Skip_Defense_LR ; Don't move toward the football on the way back up
  if Assigned_Play=4 then goto Def_Move ; First Play or Blitz Play, the middle defender can intercept the ball
  ; ---------------------------------------------------------------------------------------
  if Defense4_X<Football_X && Play_Randomizer4<17 then Defense4_X=Defense4_X+Defense4_Speed
  if Defense4_X>Football_X && Play_Randomizer4<17 then Defense4_X=Defense4_X-Defense4_Speed
  ; ---------------------------------------------------------------------------------------
Def_Move
  ; ---------------------------------------------------------------------------------------
  if Defense2_X<Football_X && Play_Randomizer2<17 then Defense2_X=Defense2_X+Defense2_Speed
  if Defense5_X<Football_X && Play_Randomizer5<22 then Defense5_X=Defense5_X+Defense5_Speed
  if Defense6_X<Football_X && Play_Randomizer6<20 then Defense6_X=Defense6_X+Defense6_Speed
  if Defense2_X>Football_X && Play_Randomizer2<18 then Defense2_X=Defense2_X-Defense2_Speed
  if Defense5_X>Football_X && Play_Randomizer5<21 then Defense5_X=Defense5_X-Defense5_Speed
  if Defense6_X>Football_X && Play_Randomizer6<13 then Defense6_X=Defense6_X-Defense6_Speed
  ; ---------------------------------------------------------------------------------------
  if Option_2P=$01 then goto Skip_Defense_LR
  if Defense3_X<Football_X && Play_Randomizer3<19 then Defense3_X=Defense3_X+Defense3_Speed
  if Defense3_X>Football_X && Play_Randomizer3<19 then Defense3_X=Defense3_X-Defense3_Speed
Skip_Defense_LR

 ; ═══════════════════════════════════════════════════
 ; Section 2: Display Logic (Plot Sprites and Values)
 ; ═══════════════════════════════════════════════════
Section_2 ; Game Loops to here if it's in a paused state

 ; ┌────────────────────────────────────────────────────────────────────────────────────────────────────────┐ 
 ; │ Sprite Positioning for the Football Field                                                              │
 ; └────────────────────────────────────────────────────────────────────────────────────────────────────────┘ 
 ; ┌─────────────────────────────────┬──────┬────┬────────────┬───┬─────────────────────────────────────────┐  
 ; │ Player X/Y Locations            │  Y   │  X │ Play Field │ X │ Notes                                   │
 ; ├─────────────────────────────────┼──────┼────┼────────────┼───┼─────────────────────────────────────────┤   
 ; │                                 │ Y=0  │    │░░░░░░░░░░░░│   │                                         │
 ; │ Feet on the Top Goal Line:      │ Y=8  │X=18|◙═══GOAL═══◙|131│  If Y<24 Then it's a Touchdown!         │
 ; │ Feet on the Top 10 Yard Line:   │ Y=24 │X=18|◄----10----►|131│     (Top of ball touches goal at 24)    │
 ; │ Feet on the Top 20 Yard Line:   │ Y=40 │X=18|◄----20----►|131│  Player sprite touching gray area at X18│
 ; │ Feet on the Top 30 Yard Line:   │ Y=56 │X=18|◄----30----►|131│  Player is out of bounds if X<18        │
 ; │ Feet on the Top 40 Yard Line:   │ Y=72 │X=18|◄----40----►|131│                                         │
 ; │ Feet on the 50 Yard Line:       │ Y=88 │X=18|◄----50----►|131│                                         │
 ; │ Feet on the Bottom 40 Yard Line:│ Y=104│X=18|◄----40----►|131│                                         │
 ; │ Feet on the Bottom 30 Yard Line:│ Y=120│X=18|◄----30----►|131│  Player sprite touches gray area at X131│
 ; │ Feet on the Bottom 20 Yard Line:│ Y=136│X=18|◄----20----►|131│  Player is out of bounds if X>131       │
 ; │ Feet on the Bottom 10 Yard Line:│ Y=152│X=18|◄----10----►|131│                                         │
 ; │ Past the the Bottom Goal Line:  │ Y=168│X=18|◙═══GOAL═══◙|131│  If Y>168 then it's a Touchdown!        │
 ; │ Bottom of the End Zone:         │ Y=184│    │░░░░░░░░░░░░│   │                                         │
 ; └─────────────────────────────────┴──────┴────┴────────────┴───┴─────────────────────────────────────────┘  

 restorescreen

 ;──═◙ Plot the Quarterback, Receiver, football, goalposts, and cones
 ;┌─────────────────────────────────────┬────────────────┬─────────┬────────────────┬──────────────┬─────────────────┬─────────────────────────────────────────┐       
 ;│ Code                                │   sprite       │ palette │      X         │      Y       │ animation frame │   Notes                                 │
 ;└─────────────────────────────────────┴────────────────┴─────────┴────────────────┴──────────────┴─────────────────┴─────────────────────────────────────────┘
 if Receiver_Y<30 then plotsprite           Player_Anim1     6      Receiver_X       Receiver_Y     animation_frame2  ; Plot the Offensive Receiver Sprite
 if Receiver_Y>29 then plotsprite           Player_UAnim1    6      Receiver_X       Receiver_Y     animation_frame2  ; Plot the Offensive Receiver Sprite
 if joy0any then plotsprite                 Player_UAnim1    6      Quarterback_X    Quarterback_Y  animation_frame2  ; Plot the Quarterback Sprite
 if !joy0any then plotsprite                Player_UAnim1    6      Quarterback_X    Quarterback_Y  ; No Animation    ; Plot the Quarterback Sprite
 if Football_State<>$01 then plotsprite     football_alt1    2      Football_X       Football_Y     ; No Animation    ; Plot the Quarterback Sprite
 if Football_State=$01 then plotsprite      football_alt1    2      Football_X       Football_Y     animation_frame   ; Plot the Quarterback Sprite
 plotsprite                                 fball_anim1      F_clr  Football2_X      Football2_Y    animation_frame3 
 plotsprite                                 goalpost_top     3      56               0              ; No Animation    ; Top Goal Post, Fixed Location
 plotsprite                                 goalpost_top     3      56               190            ; No Animation    ; Bottom Goal Post, Fixed Location
 if Menu_Option=$01 then plotsprite         cone             4      13               183            ; No Animation    ; Bottom Left Cone in practice mode
 if Menu_Option=$01 then plotsprite         cone             4      138              183            ; No Animation    ; Bottom Right Cone in practice mode

 ;──═◙ Plot Defensive Players
 ;┌─────────────────────────────────────┬────────────┬─────────┬──────────────┬──────────────┬─────────────────┬─────────────────────────────────────────┐       
 ;│ Code                                │   sprite   │ palette │      X       │      Y       │ animation frame │   Notes                                 │
 ;└─────────────────────────────────────┴────────────┴─────────┴──────────────┴──────────────┴─────────────────┴─────────────────────────────────────────┘
 if Reached_Bottom1=$01 then plotsprite  Player_UAnim1    1      Defense1_X    Defense1_Y     animation_frame    ; Plot the 1st Defensive Player Sprite
 if Reached_Bottom1=$00 then plotsprite  Player_Anim1     1      Defense1_X    Defense1_Y     animation_frame    ; Plot the 1st Defensive Player Sprite
 if Reached_Bottom2=$01 then plotsprite  Player_UAnim1    1      Defense2_X    Defense2_Y     animation_frame    ; Plot the 2nd Defensive Player Sprite
 if Reached_Bottom2=$00 then plotsprite  Player_Anim1     1      Defense2_X    Defense2_Y     animation_frame    ; Plot the 2nd Defensive Player Sprite
 if Option_2P=$01 then goto Plot_3_Alt
 if Reached_Bottom3=$01 then plotsprite  Player_UAnim1    1      Defense3_X    Defense3_Y     animation_frame    ; Plot the 3rd Defensive Player Sprite
 if Reached_Bottom3=$00 then plotsprite  Player_Anim1     1      Defense3_X    Defense3_Y     animation_frame    ; Plot the 3rd Defensive Player Sprite
 goto Plot_3_Alt_Skip
Plot_3_Alt
 if joy1any then plotsprite              Player_UAnim1    3      Defense3_X    Defense3_Y     animation_frame    ; Plot the 3rd Defensive Player Sprite
 if joy1down then plotsprite             Player_Anim1     3      Defense3_X    Defense3_Y     animation_frame    ; Plot the 3rd Defensive Player Sprite
 if !joy1any then plotsprite             Player_Anim1     3      Defense3_X    Defense3_Y 
Plot_3_Alt_Skip
 if Reached_Bottom4=$01 then plotsprite  Player_UAnim1    1      Defense4_X    Defense4_Y     animation_frame    ; Plot the 4th Defensive Player Sprite
 if Reached_Bottom4=$00 then plotsprite  Player_Anim1     1      Defense4_X    Defense4_Y     animation_frame    ; Plot the 4th Defensive Player Sprite
 if Reached_Bottom5=$01 then plotsprite  Player_UAnim1    1      Defense5_X    Defense5_Y     animation_frame    ; Plot the 5th Defensive Player Sprite
 if Reached_Bottom5=$00 then plotsprite  Player_Anim1     1      Defense5_X    Defense5_Y     animation_frame    ; Plot the 5th Defensive Player Sprite
 if Reached_Bottom6=$01 then plotsprite  Player_UAnim1    1      Defense6_X    Defense6_Y     animation_frame    ; Plot the 6th Defensive Player Sprite
 if Reached_Bottom6=$00 then plotsprite  Player_Anim1     1      Defense6_X    Defense6_Y     animation_frame    ; Plot the 6th Defensive Player Sprite
 if Reached_Bottom7=$01 then plotsprite  Player_UAnim1    1      Defense7_X    Defense7_Y     animation_frame    ; Plot the 7th Defensive Player Sprite
 if Reached_Bottom7=$00 then plotsprite  Player_Anim1     1      Defense7_X    Defense7_Y     animation_frame    ; Plot the 7th Defensive Player Sprite
 
 ;──═◙ Plot the Score and Downs Values
 ;┌──────────┬─────────────────────┬─────────┬───────┬──────────┬─────┬─────┬──────────────────────────────────────────────────────────────────────────────┐       
 ;│ Code     │  score graphics     │ palette │ Value │ # Digits │  X  │  Y  │   Notes                                                                      │
 ;└──────────┴─────────────────────┴─────────┴───────┴──────────┴─────┴─────┴──────────────────────────────────────────────────────────────────────────────┘    
  plotvalue   scoredigits_8_wide_02     3      tdMed      1        22    13    ; Plot Hundreds value of Score (Touchdowns)
  plotvalue   scoredigits_8_wide_02     3      tdLo       2        30    13    ; Plot Tens value of Score (Touchdowns)
  plotvalue   scoredigits_8_wide_02     3      downLo     1        152   13    ; Plot Tens value of Down you're on

  if Game_Paused=$00 then plotsprite msg_ready 5 48 208  ; Display Start Game message 

 doublebuffer flip

 ;Game starts for the first time
  if joy0fire0 then Debounce_R=8
  if !joy0fire0 && Debounce_R=8 then Debounce_R=9
  if Debounce_R=9 then Game_Paused=$01:Debounce_R=0: goto main 
  if Game_Paused=$00 then goto Section_2

 ; ═══════════════════════════════
 ; Section 3: Collision Detection
 ; ═══════════════════════════════

 ;Collision detection will not work properly if moved from this location, tested and confirmed.

 ;Detect collision between the football and the receiver (Catch the Ball)
  if Ball_Received=$00 && Football_X>(Receiver_X-7) && Football_X<(Receiver_X+9)  &&  Football_Y>(Receiver_Y-13) && Football_Y<(Receiver_Y+13) then Ball_Received=$01

 ;Detect collision between the Football and Defensive Players 1 and 7, resulting in an interception
 ;Only Play 3 has D1 and D7 hold back to cover the receiver, but this also provides for a random interception on all other plays - I like it.
 ;Assigned Play 4 is the Blitz, the middle defender can block a pass in addition to 1 and 7.
  if Football_State=$00 || Football_State=$02 then goto Skip_Interception ; You can't intercept if it's in someone's hands
  if Football_Y>99 then goto Skip_Interception ; Defenders will only intercept on the top of the field, above the lower 40 yard line
  if Ball_Received=$00 && Football_X>(Defense1_X-5) && Football_X<(Defense1_X+7)  &&  Football_Y>(Defense1_Y-13) && Football_Y<(Defense1_Y+13) then Game_Event=$05
  if Ball_Received=$00 && Football_X>(Defense7_X-5) && Football_X<(Defense7_X+7)  &&  Football_Y>(Defense7_Y-13) && Football_Y<(Defense7_Y+13) then Game_Event=$05
  if Assigned_Play=4 && Ball_Received=$00 && Football_X>(Defense4_X-7) && Football_X<(Defense4_X+9)  &&  Football_Y>(Defense4_Y-13) && Football_Y<(Defense4_Y+13) then Game_Event=$05
Skip_Interception

 ;Detect collision between the quarterback and the defensive players
  if Football_State<>$00 then drawscreen:goto main ; Skip this collision detection if the Quarterback does not have the ball (Football_State $00=in Quarterback's Hands)
  if Quarterback_X>(Defense1_X-11) && Quarterback_X<(Defense1_X+11)  &&  Quarterback_Y>(Defense1_Y-13) && Quarterback_Y<(Defense1_Y+13) then Game_Event=$02
  if Quarterback_X>(Defense2_X-11) && Quarterback_X<(Defense2_X+11)  &&  Quarterback_Y>(Defense2_Y-13) && Quarterback_Y<(Defense2_Y+13) then Game_Event=$02
  if Quarterback_X>(Defense3_X-11) && Quarterback_X<(Defense3_X+11)  &&  Quarterback_Y>(Defense3_Y-13) && Quarterback_Y<(Defense3_Y+13) then Game_Event=$02
  if Quarterback_X>(Defense4_X-11) && Quarterback_X<(Defense4_X+11)  &&  Quarterback_Y>(Defense4_Y-13) && Quarterback_Y<(Defense4_Y+13) then Game_Event=$02
  if Quarterback_X>(Defense5_X-11) && Quarterback_X<(Defense5_X+11)  &&  Quarterback_Y>(Defense5_Y-13) && Quarterback_Y<(Defense5_Y+13) then Game_Event=$02
  if Quarterback_X>(Defense6_X-11) && Quarterback_X<(Defense6_X+11)  &&  Quarterback_Y>(Defense6_Y-13) && Quarterback_Y<(Defense6_Y+13) then Game_Event=$02
  if Quarterback_X>(Defense7_X-11) && Quarterback_X<(Defense7_X+11)  &&  Quarterback_Y>(Defense7_Y-13) && Quarterback_Y<(Defense7_Y+13) then Game_Event=$02

  ;f If you choose Practice Mode, then immeidately reset the Game_Event for a tackle back to false.
  if Menu_Option=$01 && Game_Event=$02 then Game_Event=$00
  
 goto main

 ; < < < ◄■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■▌ MAIN GAME LOOP ENDS   
 
 ; ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
 ; ║ Game Event Subroutines                                                                                            ║
 ; ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
 ;           These short subroutines will display in-game messages on the screen, and pause for a button press
 ; ┌──────────────────────────────┬───────────────────────────────┬─────────────────────┬──────────────────────────────┐       
 ; │  Name of Subroutine          │  Displayed Message            │ Sprite Name         │ Notes                        │    
 ; ├──────────────────────────────┼───────────────────────────────┼─────────────────────┼──────────────────────────────┤  
 ; │  Game_Event_Touchdown        │  "Touchdown!"                 │ msg_touchdown.png   │                              │
 ; │  Game_Event_OutOfBounds      │  "Out of Bounds"              │ msg_outofbounds.png │                              │
 ; │  Game_Event_IncompletePass   │  "Incomplete Pass"            │ msg_incomplete.png  │                              │
 ; │  Game_Event_Down             │  "Tackled"                    │ msg_down.png        │                              │
 ; │  Game_Event_GameOver         │  "Game Over"                  │ msg_gameover.png    │                              │
 ; │  Game_Event_Pause            │  "Press right fire to start"  │ msg_ready.png       │                              │
 ; └──────────────────────────────┴───────────────────────────────┴─────────────────────┴──────────────────────────────┘  
 ;
 ;──═◙ Touchdown!
 ;═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Game_Event_Touchdown                 ;True if QB or Receiver are holding the ball and cross the top goal line
 playsfx sfx_touchdown               ;Play Touchdown Sound Effect
 gosub touchdownspeak                ;AtariVox says 'Touchdown'
 doublebuffer flip                   ;Double Buffer "drawscreen" command.  Needed here to properly display final location of football.
 scorea=scorea+7                     ;Score 7 Points
 Assigned_Play=Assigned_Play+1       ;Move to the next play for the next down
 if Assigned_Play>5 then Assigned_Play=0 ;Reset to first play pattern
 savescreen
Game_Event_Touchdown_Loop
 restorescreen                       ;Restore from savescreen
 if switchreset then reboot          ;Reset Game if you press Reset
 if Football_X>56 then Referee_X=Football_X-16
 if Football_X<57 then Referee_X=Football_X+8
 plotsprite referee_touchdown 4 Referee_X 0
 plotsprite msg_touchdown 5 48 208   ;Display Touchdown Message
 if joy0fire1 then scoreb=1:gosub Reset_Game:gosub Plot_Football_Field:Ref_Active=$00:goto main  ;Reset to 1st Down, Reset all game variables and return to game
 doublebuffer flip                   ;Double Buffer "drawscreen" command
 goto Game_Event_Touchdown_Loop

 ;──═◙ Out of Bounds!
 ;═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Game_Event_OutOfBounds               ;True if you go out of bounds on the left or right side
 playsfx sfx_whistle                 ;Play sound for referee blowing the whistle
 gosub outofboundsspeak              ;AtariVox says 'Out of Bounds'
 scoreb=scoreb+1                     ;Add to Down Count
 Assigned_Play=Assigned_Play+1       ;Move to the next play for the next down
 if Assigned_Play>5 then Assigned_Play=0 ;Reset to first play pattern
 if downLo=5 then goto Game_Event_GameOver 
 savescreen
Game_Event_OutOfBounds_Loop
 restorescreen                       ;Restore from savescreen
 if switchreset then reboot          ;Reset Game if you press Reset
 if Football_X>56 then Referee_X=Football_X-16
 if Football_X<57 then Referee_X=Football_X+8
 plotsprite referee_handup 4 Referee_X 182
 plotsprite msg_outofbounds 5 48 208 ;Display Out Of Bounds Message
 if joy0fire1 then gosub Reset_Game:gosub Plot_Football_Field:Ref_Active=$00:goto main ; Reset all game variables and return to game
 doublebuffer flip                   ;Double Buffer "drawscreen" command
 goto Game_Event_OutOfBounds_Loop

 ;──═◙ Incomplete Pass!
 ;═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Game_Event_IncompletePass            ;True if the ball sails into the endzone uncaught
 playsfx sfx_whistle                 ;Play sound for referee blowing the whistle
 gosub incompletepassspeak                ;AtariVox says 'Incomplete Pass'
 scoreb=scoreb+1                     ;Add to Down Count
 Assigned_Play=Assigned_Play+1       ;Move to the next play for the next down
 if Assigned_Play>5 then Assigned_Play=0 ;Reset to first play pattern
 if downLo=5 then goto Game_Event_GameOver 
 savescreen
Game_Event_IncompletePass_Loop
 restorescreen                       ;Restore from savescreen
 if switchreset then reboot          ;Reset Game if you press Reset
 if Football_X>56 then Referee_X=Football_X-16
 if Football_X<57 then Referee_X=Football_X+8
 plotsprite referee_handup 4 Referee_X 0
 plotsprite msg_incomplete 5 48 208  ;Display Incomplete Pass Message
 if joy0fire1 then gosub Reset_Game:gosub Plot_Football_Field:Ref_Active=$00:goto main ; Reset all game variables and return to game
 doublebuffer flip                   ;Double Buffer "drawscreen" command
 goto Game_Event_IncompletePass_Loop

 ;──═◙ Interception!
 ;═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Game_Event_Interception
 playsfx sfx_whistle                 ;Play sound for referee blowing the whistle
 gosub interceptionspeak             ;AtariVox says 'Interception'
 scoreb=scoreb+1                     ;Add to Down Count
 Assigned_Play=Assigned_Play+1       ;Move to the next play for the next down
 if Assigned_Play>5 then Assigned_Play=0 ;Reset to first play pattern
 if downLo=5 then goto Game_Event_GameOver ;If it's fourth down the game is over
 savescreen
Game_Event_Interception_Loop
 restorescreen                       ;Restore from savescreen
 if switchreset then reboot          ;Reset Game if you press Reset
 if Football_X>56 then Referee_X=Football_X-16
 if Football_X<57 then Referee_X=Football_X+8
 plotsprite referee_handup 4 Referee_X 0
 plotsprite msg_interception 5 48 208  ;Display Interception Message
 if joy0fire1 then gosub Reset_Game:gosub Plot_Football_Field:Ref_Active=$00:goto main ; Reset all game variables and return to game
 doublebuffer flip                   ;Double Buffer "drawscreen" command
  goto Game_Event_Interception_Loop

 ;──═◙ Tacked by a Defender!
 ;═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Game_Event_Down                      ;True if tackled (touched) by a defensive player
 playsfx sfx_whistle                 ;Play sound for referee blowing the whistle
 gosub tackledspeak                  ;AtariVox says 'Tackled'
 scoreb=scoreb+1                     ;Add to Down Count
 Assigned_Play=Assigned_Play+1       ;Move to the next play for the next down
 if Assigned_Play>5 then Assigned_Play=0 ;Reset to first play pattern
 if downLo=5 then goto Game_Event_GameOver    
 savescreen    
Game_Event_Down_Loop
 restorescreen                       ;Restore from savescreen
 if switchreset then reboot          ;Reset Game if you press Reset
 if Football_X>56 then Referee_X=Football_X-16
 if Football_X<57 then Referee_X=Football_X+8
 if Quarterback_Y<152 then Referee_Y=Football_Y+24 else Referee_X=32:Referee_Y=186
 plotsprite referee_handup 4 Referee_X Referee_Y 
 plotsprite msg_down 5 48 208        ;Display Down Message
 if joy0fire1 then gosub Reset_Game:gosub Plot_Football_Field:Ref_Active=$00:goto main  ; Reset all game variables and return to game
 doublebuffer flip                   ;Double Buffer "drawscreen" command
 goto Game_Event_Down_Loop

 ;──═◙ Game Over!
 ;═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Game_Event_GameOver                      ;True if you didn't score on 4th Down (If Down=5)
 gosub gameoverspeak                     ;AtariVox says 'Game Over'
 Assigned_Play=Assigned_Play+1           ;Move to the next play for the next down
 if Assigned_Play>5 then Assigned_Play=0 ;Reset to first play pattern
 Time_Counter2=9
 savescreen
 ;Check for a High Score
   ;Checks first byte.
   if tdHi > highscoreHi then goto New_High_Score
   if tdHi < highscoreHi then goto Game_Event_GameOver_Loop
  ;First byte equal. Checks second byte.
   if tdMed > highscoreMed then goto New_High_Score
   if tdMed < highscoreMed then goto Game_Event_GameOver_Loop
  ;Second byte equal. Checks third byte.
   if tdLo > highscoreLo then goto New_High_Score
   if tdLo < highscoreLo then goto Game_Event_GameOver_Loop
  ;All bytes equal. Skips high score.
   goto Game_Event_GameOver_Loop
  ;All bytes not equal. New high score.
New_High_Score
   highscoreHi = tdHi : highscoreMed = tdMed : highscoreLo = tdLo
Game_Event_GameOver_Loop
  if Time_Counter2=0 then speak rightfire:goto Skip_Time_Count         ; Countdown from 9 and AtariVox says 'Press Right Fire to Start' when timer ends
  Time_Counter=Time_Counter+1                                          ; Pause after 4th Down before you can reset
  if Time_Counter=20 then Time_Counter2=Time_Counter2-1:Time_Counter=0 ; Increment Time_Counter2 variable 
Skip_Time_Count
 restorescreen                       ;Restore from savescreen
 if switchreset then reboot          ;Reset Game if you press Reset
 plotsprite highscore 5 63 186       ;Display the High Score
  plotvalue scoredigits_8_wide_02 6 highscoreMed 1 68 12    ; Plot Hundreds value of Score (Touchdowns)
  plotvalue scoredigits_8_wide_02 6 highscoreLo  2 76 12    ; Plot Tens value of Score (Touchdowns)
 plotsprite referee_handup 4 Referee_X Referee_Y         ; Plot the Referee
 ;If the game's over, also display the game event that caused the game to be over
 if Game_Event=$02 then plotsprite msg_down 5 48 0;190 
 if Game_Event=$03 then plotsprite msg_incomplete 5 48 0;190 
 if Game_Event=$04 then plotsprite msg_outofbounds 5 48 0;190 
 if Game_Event=$05 then plotsprite msg_interception 5 48 0;190 
 ;if Time_Counter2=0 plotsprite msg_gameover2 5 48 208    ;Display Game Over Message with L:Cont R:Restart Option
 ;if Time_Counter2>0 plotsprite msg_gameover1 5 48 208    ;Display Game Over Message (Without continue options)
 ;plotsprite msg_gameover2 5 48 208
 if Time_Counter2>0 then plotsprite msg_gameover1 5 48 208 :plotvalue scoredigits_8_wide_02 5 Time_Counter2 1 4 0 else plotsprite msg_gameover2 5 48 208 
 if joy0fire0 && Time_Counter2=0 then reboot  ;Restart the game when pressing the right fire button
 if joy0fire1 && Time_Counter2=0 then gosub Reset_Game:scoreb=1:scorea=0:gosub Plot_Football_Field:Game_Paused=$00:Ref_Active=$00:goto main ; Reset all game variables, reset score and downs, return to game
 doublebuffer flip                   ;Double Buffer "drawscreen" command
 goto Game_Event_GameOver_Loop

 ;──═◙ Pause Game
 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Game_Event_Pause                     ;True if Game_Event=$00 (Paused State), Set to $01 to kick off the action
Game_Event_Pause_Loop
  if joy0fire0 then Debounce_R=8
  if !joy0fire0 && Debounce_R=8 then Debounce_R=9
 savescreen
 restorescreen                       ;Restore from savescreen
 plotsprite msg_ready 5 48 208       ;Display Ready Message
 if Debounce_R=9 then Game_Paused=$01:Debounce_R=0: goto main ; Reset all game variables, reset score and downs, return to game
 if switchreset then reboot          ;Reset Game if you press Reset
 doublebuffer flip                   ;Double Buffer "drawscreen" command
 goto Game_Event_Pause_Loop
 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════


 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
 ; Plot Football Field Subroutine
 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Plot_Football_Field
 doublebuffer on
 clearscreen
 ;──═◙ Plot the Football field
 ;This includes the yardline markers, the on-field logo, and the "Score" and "Down" Text at the bottom of the screen
 ;Map created using Tiled v1.3.1 for Windows (https://www.mapeditor.org/download.html)
 ;           ┌────────────────┬─────────┬───┬───┬───────┬────────┐       
 ;           │    mapdata     │ palette │ X │ Y │ Width │ Height │    
 ;           └────────────────┴─────────┴───┴───┴───────┴────────┘   
 plotmap       football_field      7      0   0    20       14              
 savescreen
 return

 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
 ; Reset Game Variables Subroutine
 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Reset_Game
 ;Set Initial Location of Quarterback and Receiver
  Quarterback_X=74 : Quarterback_Y=170
  Receiver_Y=150
  if Assigned_Play=0 then Receiver_X=74
  if Assigned_Play=1 then Receiver_X=96
  if Assigned_Play=2 then Receiver_X=64
  if Assigned_Play=3 then Receiver_X=78
  if Assigned_Play=4 then Receiver_X=84
  if Assigned_Play=5 then Receiver_X=48
 ;Set Initial Location of Defensive PlayersLocation
  Defense1_X=26  : Defense1_Y=24
  Defense2_X=42  : Defense2_Y=18
  Defense3_X=58  : Defense3_Y=18
  Defense4_X=74  : Defense4_Y=18
  Defense5_X=90  : Defense5_Y=17
  Defense6_X=106 : Defense6_Y=18
  Defense7_X=122 : Defense7_Y=24
 ;Reset the Football's Location and State
  Football_State=$00   ;$00 = Quarterback's Hands, $01 In the air, $02 Receiver's Hands
  Football_X=Quarterback_X+6 : Football_Y=Quarterback_Y-2
 ;Reset the Flag for Catching the Ball
  Ball_Received=$00    ;$00 = Ball not in receiver's Hands, $01 = Ball in Receiver's Hands
 ;Reset Game_Event monitor to Active Play
  Game_Event=$00       ;$00 = Active Play, $01 = Touchdown, $02 = Down, $03 = Incomplete Pass, $04=Out of Bounds
 ;Reset Debounce Variables for Fire Buttons
  Debounce_L=0 
  Debounce_R=0
 ;Reset Flags thay indicate Defenders have reached the bottom of the screen on a play
  Reached_Bottom1=$00
  Reached_Bottom2=$00
  Reached_Bottom3=$00
  Reached_Bottom4=$00
  Reached_Bottom5=$00
  Reached_Bottom6=$00
  Reached_Bottom7=$00
  ;gosub Set_Speed
  return

 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
 ; Set Speed
 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

Set_Speed

 ;Default Defensive Speed 
 if Menu_Option=$01 then goto Speed_1                    ; Easy is the slowest
 if Menu_Option=$01 || Menu_Option=$02 then goto Speed_2 ; Practice and Standard are the same speed
 if Menu_Option=$03 then goto Speed_3                    ; Advanced
 if Menu_Option=$04 then goto Speed_4                    ; Expert

Speed_1                ;Easy Mode
  Defense1_Speed=0.8
  Defense2_Speed=0.8
  Defense3_Speed=0.7
  Defense4_Speed=0.6
  Defense5_Speed=0.7
  Defense6_Speed=0.8
  Defense7_Speed=0.8
  goto Speed_End
Speed_2                ;Practice and Standard Mode
  Defense1_Speed=1.0
  Defense2_Speed=1.0
  Defense3_Speed=1.0
  Defense4_Speed=1.0
  Defense5_Speed=1.0
  Defense6_Speed=1.0
  Defense7_Speed=1.0
  goto Speed_End
Speed_3                ;Advanced Mode
  Defense1_Speed=1.6
  Defense2_Speed=1.5
  Defense3_Speed=1.4
  Defense4_Speed=1.3
  Defense5_Speed=1.4
  Defense6_Speed=1.5
  Defense7_Speed=1.6
  goto Speed_End
Speed_4                ;Expert Mode
  Defense1_Speed=1.9
  Defense2_Speed=1.8
  Defense3_Speed=1.7
  Defense4_Speed=1.7
  Defense5_Speed=1.7
  Defense6_Speed=1.8
  Defense7_Speed=1.9
Speed_End
 return

 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
 ; Offensive and Defensive Play Subroutines
 ;
 ;                     These subroutines will move defensive players and the offensive receiver 
 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
 ;
 ; Descriptions may change before the final version as I play around with different play options.
 ; Assigned_Play=0 > Default Play, straight down the field with a bit of random left/right movement
 ; Assigned_Play=1 > Skew to the left, makes it easier to run up the right
 ; Assigned_Play=2 > Skew to the right, makes it easier to run up the left
 ; Assigned_Play=3 > Outside 2 Defenders covers the receiver, but makes it a bit easier to run up the sideline
 ; Assigned_Play=4 > Blitz - One or two Lightning Fast receivers, reduce likelihood of zooming straight to the ball 
 ; Assigned_Play=5 > Skew to left and right, leaving middle open
 ; 
 ; ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

 ;  «◘■■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■► Play 0 ◄■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■■◘»
 ;                        Default Play
 ;  «◘■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■◘»

 ; Done/Tested 8/12/2022 ;
 ; for Assigned_Play 0, they all move randomly left and right and do not skew one way or the other.

 dmahole 0

p0
 ;Move the Offensive Receiver up the screen, then back and forth when he reaches the end zone
 ;Don't let the receiver run out of the end zone
 if Receiver_Y<19 then Receiver_Y=18                                   ; If Receiver_Y is 19 or higher run up the field
 if Receiver_Y>18 then Receiver_Y=Receiver_Y-2                         ; If the Receiver is not in the endzone yet, move him up the field
 if Receiver_Y>18 && Play_Randomizer5<5 then Receiver_X=Receiver_X-1
 
 ;Each Individual Defensive Player can have a different movement Pattern, defined in each of these subroutines
 if Reached_Bottom1=$00 then gosub Move_Down_P0_D1                     ; If Defensive Player 1 hasn't reached the bottom, move him down
 if Reached_Bottom1=$01 then gosub Move_Up_P0_D1                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom2=$00 then gosub Move_Down_P0_D2                     ; If Defensive Player 2 hasn't reached the bottom, move him down
 if Reached_Bottom2=$01 then gosub Move_Up_P0_D2                       ; If Defensive Player 2 reached the bottom, move him up the field
 if Reached_Bottom4=$00 then gosub Move_Down_P0_D4                     ; If Defensive Player 4 hasn't reached the bottom, move him down
 if Reached_Bottom4=$01 then gosub Move_Up_P0_D4                       ; If Defensive Player 4 reached the bottom, move him up the field
 if Reached_Bottom5=$00 then gosub Move_Down_P0_D5                     ; If Defensive Player 5 hasn't reached the bottom, move him down
 if Reached_Bottom5=$01 then gosub Move_Up_P0_D5                       ; If Defensive Player 5 reached the bottom, move him up the field
 if Reached_Bottom6=$00 then gosub Move_Down_P0_D6                     ; If Defensive Player 6 hasn't reached the bottom, move him down
 if Reached_Bottom6=$01 then gosub Move_Up_P0_D6                       ; If Defensive Player 6 reached the bottom, move him up the field
 if Reached_Bottom7=$00 then gosub Move_Down_P0_D7                     ; If Defensive Player 7 hasn't reached the bottom, move him down
 if Reached_Bottom7=$01 then gosub Move_Up_P0_D7                       ; If Defensive Player 7 reached the bottom, move him up the field
 if Option_2P=$01 then goto Assigned_Play_Return                       ; Return to Main Loop if 2 Player Option is enabled
 if Reached_Bottom3=$00 then gosub Move_Down_P0_D3                     ; If Defensive Player 3 hasn't reached the bottom, move him down
 if Reached_Bottom3=$01 then gosub Move_Up_P0_D3                       ; If Defensive Player 3 reached the bottom, move him up the field

 goto Assigned_Play_Return ; Return to Main Loop

 ; Move the Defensive Players
 ; This section individually controls each Defensive player and how they move on the screen
 ; To change the speed or skew the likely direction they'll move to, adjust the Play_Randomizer8 variable.

 ;Move Defensive Players Down the screen
Move_Down_P0_D1
 Defense1_Y=Defense1_Y+Defense1_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer5<12 && Defense1_X<122 then Defense1_X=Defense1_X+Defense1_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer1>49 && Defense1_X>19 then Defense1_X=Defense1_X-Defense1_Speed  ; Randomly Move Defensive Player Right
 return
Move_Down_P0_D2
 Defense2_Y=Defense2_Y+Defense2_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer2<10 && Defense2_X<122 then Defense2_X=Defense2_X+Defense2_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer3>50 && Defense2_X>19 then Defense2_X=Defense2_X-Defense2_Speed  ; Randomly Move Defensive Player Right
 return
Move_Down_P0_D3
 Defense3_Y=Defense3_Y+Defense3_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer4<11 && Defense3_X<122 then Defense3_X=Defense3_X+Defense3_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer3>48 && Defense3_X>19 then Defense3_X=Defense3_X-Defense3_Speed  ; Randomly Move Defensive Player Right
 return
Move_Down_P0_D4
 Defense4_Y=Defense4_Y+Defense4_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer4<10 && Defense4_X<130 then Defense4_X=Defense4_X+Defense4_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer3>50 && Defense4_X>19 then Defense4_X=Defense4_X-Defense4_Speed  ; Randomly Move Defensive Player Right
 return
Move_Down_P0_D5
 Defense5_Y=Defense5_Y+Defense5_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer5<13 && Defense5_X<130 then Defense5_X=Defense5_X+Defense5_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer6>47 && Defense5_X>27 then Defense5_X=Defense5_X-Defense5_Speed  ; Randomly Move Defensive Player Right
 return
Move_Down_P0_D6
 Defense6_Y=Defense6_Y+Defense6_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer7<10 && Defense6_X<122 then Defense6_X=Defense6_X+Defense6_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer8>50 && Defense6_X>19 then Defense6_X=Defense6_X-Defense6_Speed  ; Randomly Move Defensive Player Right
 return
Move_Down_P0_D7
 Defense7_Y=Defense7_Y+Defense7_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer1<11 && Defense7_X<122 then Defense7_X=Defense7_X+Defense7_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer3>51 && Defense7_X>19 then Defense7_X=Defense7_X-Defense7_Speed  ; Randomly Move Defensive Player Right
 return

 ;Move Defensive Players Up the screen
Move_Up_P0_D1
 Defense1_Y=Defense1_Y-Defense1_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<11 && Defense1_X<122 then Defense1_X=Defense1_X+Defense1_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer8>49 && Defense1_X>19 then Defense1_X=Defense1_X-Defense1_Speed  ; Randomly Move Defensive Player Right
 return
Move_Up_P0_D2
 Defense2_Y=Defense2_Y-Defense2_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense2_X<122 then Defense2_X=Defense2_X+Defense2_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer8>50 && Defense2_X>19 then Defense2_X=Defense2_X-Defense2_Speed  ; Randomly Move Defensive Player Right
 return
Move_Up_P0_D3
 Defense3_Y=Defense3_Y-Defense3_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<12 && Defense3_X<130 then Defense3_X=Defense3_X+Defense3_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer8>47 && Defense3_X>27 then Defense3_X=Defense3_X-Defense3_Speed  ; Randomly Move Defensive Player Right
 return
Move_Up_P0_D4
 Defense4_Y=Defense4_Y-Defense4_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense4_X<122 then Defense4_X=Defense4_X+Defense4_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer8>50 && Defense4_X>27 then Defense4_X=Defense4_X-Defense4_Speed  ; Randomly Move Defensive Player Right
 return
Move_Up_P0_D5
 Defense5_Y=Defense5_Y-Defense5_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<13 && Defense5_X<122 then Defense5_X=Defense5_X+Defense5_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer8>51 && Defense5_X>19 then Defense5_X=Defense5_X-Defense5_Speed  ; Randomly Move Defensive Player Right
 return
Move_Up_P0_D6
 Defense6_Y=Defense6_Y-Defense6_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<9  && Defense6_X<130 then Defense6_X=Defense6_X+Defense6_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer8>50 && Defense6_X>27 then Defense6_X=Defense6_X-Defense6_Speed  ; Randomly Move Defensive Player Right
 return
Move_Up_P0_D7
 Defense7_Y=Defense7_Y-Defense7_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense7_X<122 then Defense7_X=Defense7_X+Defense7_Speed ; Randomly Move Defensive Player Left
 if Play_Randomizer8>48 && Defense7_X>19 then Defense7_X=Defense7_X-Defense7_Speed  ; Randomly Move Defensive Player Right
 return

 ;  «◘■■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■► Play 1 ◄■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■■◘»
 ;                      Skew to the Left
 ;  «◘■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■◘»

 ; Done/Tested: v11 8/13 8:47P

p1 
 ;Move the Offensive Receiver up the screen, then back and forth when he reaches the end zone
 ;Don't let the receiver run out of the end zone
 if Receiver_Y<19 then Receiver_Y=18                                   ; If Receiver_Y is 19 or higher run up the field
 if Receiver_Y>35 && Receiver_Y<70 then Receiver_Y=Receiver_Y-1        ; Mid field speedup for the receiver
 if Receiver_Y>18 then Receiver_Y=Receiver_Y-2                         ; If the Receiver is not in the endzone yet, move him up the field

 ;Each Individual Defensive Player can have a different movement Pattern, defined in each of these subroutines
 if Reached_Bottom1=$00 then gosub Move_Down_P1_D1                     ; If Defensive Player 1 hasn't reached the bottom, move him down
 if Reached_Bottom1=$01 then gosub Move_Up_P1_D1                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom2=$00 then gosub Move_Down_P1_D2                     ; If Defensive Player 2 hasn't reached the bottom, move him down
 if Reached_Bottom2=$01 then gosub Move_Up_P1_D2                       ; If Defensive Player 2 reached the bottom, move him up the field
 if Reached_Bottom4=$00 then gosub Move_Down_P1_D4                     ; If Defensive Player 4 hasn't reached the bottom, move him down
 if Reached_Bottom4=$01 then gosub Move_Up_P1_D4                       ; If Defensive Player 4 reached the bottom, move him up the field
 if Reached_Bottom5=$00 then gosub Move_Down_P1_D5                     ; If Defensive Player 5 hasn't reached the bottom, move him down
 if Reached_Bottom5=$01 then gosub Move_Up_P1_D5                       ; If Defensive Player 5 reached the bottom, move him up the field
 if Reached_Bottom6=$00 then gosub Move_Down_P1_D6                     ; If Defensive Player 6 hasn't reached the bottom, move him down
 if Reached_Bottom6=$01 then gosub Move_Up_P1_D6                       ; If Defensive Player 6 reached the bottom, move him up the field
 if Reached_Bottom7=$00 then gosub Move_Down_P1_D7                     ; If Defensive Player 7 hasn't reached the bottom, move him down
 if Reached_Bottom7=$01 then gosub Move_Up_P1_D7                       ; If Defensive Player 7 reached the bottom, move him up the field
 if Option_2P=$01 then goto Assigned_Play_Return                       ; Return to Main Loop if 2 Player Option is enabled
 if Reached_Bottom3=$00 then gosub Move_Down_P1_D3                     ; If Defensive Player 3 hasn't reached the bottom, move him down
 if Reached_Bottom3=$01 then gosub Move_Up_P1_D3                       ; If Defensive Player 3 reached the bottom, move him up the field

 goto Assigned_Play_Return ; Return to Main Loop

 ; Move the Defensive Players
 ; This section individually controls each Defensive player and how they move on the screen
 ; To change the speed or skew the likely direction they'll move to, adjust the Play_Randomizer8 variable.

 ;Move Defensive Players Down the screen,
Move_Down_P1_D1
 Defense1_Y=Defense1_Y+Defense1_Speed                                              ; Move Defensive Player down the field
 if frame_counter>4 && Defense1_X<122 then Defense1_X=Defense1_X+Defense1_Speed ; Randomly Move Defensive Player Right
 if frame_counter<5 && Defense1_X>19 then Defense1_X=Defense1_X-Defense1_Speed ; Randomly Move Defensive Player Left
 return
Move_Down_P1_D2
 Defense2_Y=Defense2_Y+Defense2_Speed                                              ; Move Defensive Player down the field
 if Play_Randomizer2<2 && Defense2_X<122 then Defense2_X=Defense2_X+Defense2_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>44 && Defense2_X>19 then Defense2_X=Defense2_X-Defense2_Speed ; Randomly Move Defensive Player Left
 return
Move_Down_P1_D3
 Defense3_Y=Defense3_Y+Defense3_Speed                                              ; Move Defensive Player down the field
 if frame_counter>4 && Defense3_X<122 then Defense3_X=Defense3_X+Defense3_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>40 && Defense3_X>19 then Defense3_X=Defense3_X-Defense3_Speed ; Randomly Move Defensive Player Left
 return
Move_Down_P1_D4
 Defense4_Y=Defense4_Y+Defense4_Speed                                              ; Move Defensive Player down the field
 if Play_Randomizer4<3 && Defense4_X<130 then Defense4_X=Defense4_X+Defense4_Speed ; Randomly Move Defensive Player Right
 if frame_counter<3 && Defense4_X>19 then Defense4_X=Defense4_X-Defense4_Speed ; Randomly Move Defensive Player Left
 return
Move_Down_P1_D5
 Defense5_Y=Defense5_Y+Defense5_Speed                                              ; Move Defensive Player down the field
 if frame_counter>4 && Defense5_X<130 then Defense5_X=Defense5_X+Defense5_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer6>39 && Defense5_X>27 then Defense5_X=Defense5_X-Defense5_Speed ; Randomly Move Defensive Player Left
 return
Move_Down_P1_D6
 Defense6_Y=Defense6_Y+Defense6_Speed                                              ; Move Defensive Player down the field
 if Play_Randomizer7<5 && Defense6_X<122 then Defense6_X=Defense6_X+Defense6_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>46 && Defense6_X>19 then Defense6_X=Defense6_X-Defense6_Speed ; Randomly Move Defensive Player Left
 return
Move_Down_P1_D7
 Defense7_Y=Defense7_Y+Defense7_Speed                                              ; Move Defensive Player down the field
 if Play_Randomizer1<5 && Defense7_X<130 then Defense7_X=Defense7_X+Defense7_Speed ; Randomly Move Defensive Player Right
 if frame_counter<2 && Defense7_X>27 then Defense7_X=Defense7_X-Defense7_Speed ; Randomly Move Defensive Player Left
 return

 ;Move Defensive Players Up the screen
Move_Up_P1_D1
 Defense1_Y=Defense1_Y-Defense1_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense1_X<122 then Defense1_X=Defense1_X+Defense1_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense1_X>19 then Defense1_X=Defense1_X-Defense1_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P1_D2
 Defense2_Y=Defense2_Y-Defense2_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense2_X<122 then Defense2_X=Defense2_X+Defense2_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense2_X>19 then Defense2_X=Defense2_X-Defense2_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P1_D3
 Defense3_Y=Defense3_Y-Defense3_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense3_X<130 then Defense3_X=Defense3_X+Defense3_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense3_X>27 then Defense3_X=Defense3_X-Defense3_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P1_D4
 Defense4_Y=Defense4_Y-Defense4_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense4_X<122 then Defense4_X=Defense4_X+Defense4_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense4_X>27 then Defense4_X=Defense4_X-Defense4_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P1_D5
 Defense5_Y=Defense5_Y-Defense5_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense5_X<122 then Defense5_X=Defense5_X+Defense5_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense5_X>19 then Defense5_X=Defense5_X-Defense5_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P1_D6
 Defense6_Y=Defense6_Y-Defense6_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense6_X<130 then Defense6_X=Defense6_X+Defense6_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense6_X>27 then Defense6_X=Defense6_X-Defense6_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P1_D7
 Defense7_Y=Defense7_Y-Defense7_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense7_X<130 then Defense7_X=Defense7_X+Defense7_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense7_X>19 then Defense7_X=Defense7_X-Defense7_Speed  ; Randomly Move Defensive Player Left
 return

 ;  «◘■■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■► Play 2 ◄■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■■◘»
 ;                        Middle Cover
 ;  «◘■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■◘»

 ;Middle Defender stays back to help block a run, but will not intercept the ball

p2
;Move the Offensive Receiver up the screen, then back and forth when he reaches the end zone
 ;Don't let the receiver run out of the end zone
 if Receiver_Y<19 then Receiver_Y=18                                   ; if Receiver_Y is 19 or higher run up the field
 if Receiver_Y>18 then Receiver_Y=Receiver_Y-2                         ; If the Receiver is not in the endzone yet, move him up the field

 ;Defensive Player 7 stays back to cover the receiver
 Defense4_Y=34  
  dmahole 1
 ;Each Individual Defensive Player can have a different movement Pattern, defined in each of these subroutines
 if Reached_Bottom1=$00 then gosub Move_Down_P2_D1                     ; If Defensive Player 1 hasn't reached the bottom, move him down
 if Reached_Bottom1=$01 then gosub Move_Up_P2_D1                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom2=$00 then gosub Move_Down_P2_D2                     ; If Defensive Player 2 hasn't reached the bottom, move him down
 if Reached_Bottom2=$01 then gosub Move_Up_P2_D2                       ; If Defensive Player 2 reached the bottom, move him up the field
 if Reached_Bottom4=$00 then gosub Move_Down_P2_D4                     ; If Defensive Player 4 hasn't reached the bottom, move him down
 ;if Reached_Bottom4=$01 then gosub Move_Up_P2_D4                       ; If Defensive Player 4 reached the bottom, move him up the field
 if Reached_Bottom5=$00 then gosub Move_Down_P2_D5                     ; If Defensive Player 5 hasn't reached the bottom, move him down
 if Reached_Bottom5=$01 then gosub Move_Up_P2_D5                       ; If Defensive Player 5 reached the bottom, move him up the field
 if Reached_Bottom6=$00 then gosub Move_Down_P2_D6                     ; If Defensive Player 6 hasn't reached the bottom, move him down
 if Reached_Bottom6=$01 then gosub Move_Up_P2_D6                       ; If Defensive Player 6 reached the bottom, move him up the field
 if Reached_Bottom7=$00 then gosub Move_Down_P2_D7                     ; If Defensive Player 7 hasn't reached the bottom, move him down
 if Reached_Bottom7=$01 then gosub Move_Up_P2_D7                       ; If Defensive Player 7 reached the bottom, move him up the field
 if Option_2P=$01 then goto Assigned_Play_Return                       ; Return to Main Loop if 2 Player Option is enabled
 if Reached_Bottom3=$00 then gosub Move_Down_P2_D3                     ; If Defensive Player 3 hasn't reached the bottom, move him down
 if Reached_Bottom3=$01 then gosub Move_Up_P2_D3                       ; If Defensive Player 3 reached the bottom, move him up the field

 goto Assigned_Play_Return ; Return to Main Loop

 ; Move the Defensive Players
 ; This section individually controls each Defensive player and how they move on the screen
 ; To change the speed or skew the likely direction they'll move to, adjust the Play_Randomizer8 variable.

 ; for Assigned_Play 2, Defenders skew to the right

 ;Move Defensive Players Down the screen
Move_Down_P2_D1
 Defense1_Y=Defense1_Y+Defense1_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer5<22 && Defense1_X<122 then Defense1_X=Defense1_X+Defense1_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer1>56 && Defense1_X>19 then Defense1_X=Defense1_X-Defense1_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P2_D2
 Defense2_Y=Defense2_Y+Defense2_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer2<28 && Defense2_X<122 then Defense2_X=Defense2_X+Defense2_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>55 && Defense2_X>19 then Defense2_X=Defense2_X-Defense2_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P2_D3
 Defense3_Y=Defense3_Y+Defense3_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer4<20 && Defense3_X<122 then Defense3_X=Defense3_X+Defense3_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>55 && Defense3_X>19 then Defense3_X=Defense3_X-Defense3_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P2_D4
 ;Defense4_Y=Defense4_Y+Defense4_Speed                                               ; Move Defensive Player down the field
 ;if Play_Randomizer4<31 && Defense4_X<130 then Defense4_X=Defense4_X+Defense4_Speed ; Randomly Move Defensive Player Right
 ;if Play_Randomizer3>55 && Defense4_X>19 then Defense4_X=Defense4_X-Defense4_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P2_D5
 Defense5_Y=Defense5_Y+Defense5_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer5<29 && Defense5_X<130 then Defense5_X=Defense5_X+Defense5_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer6>57 && Defense5_X>27 then Defense5_X=Defense5_X-Defense5_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P2_D6
 Defense6_Y=Defense6_Y+Defense6_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer7<26 && Defense6_X<122 then Defense6_X=Defense6_X+Defense6_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>55 && Defense6_X>19 then Defense6_X=Defense6_X-Defense6_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P2_D7
 Defense7_Y=Defense7_Y+Defense7_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer1<23 && Defense7_X<130 then Defense7_X=Defense7_X+Defense7_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>55 && Defense7_X>27 then Defense7_X=Defense7_X-Defense7_Speed  ; Randomly Move Defensive Player Left
 return

 ;Move Defensive Players Up the screen
Move_Up_P2_D1
 Defense1_Y=Defense1_Y-Defense1_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense1_X<122 then Defense1_X=Defense1_X+Defense1_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense1_X>19 then Defense1_X=Defense1_X-Defense1_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P2_D2
 Defense2_Y=Defense2_Y-Defense2_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense2_X<122 then Defense2_X=Defense2_X+Defense2_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense2_X>19 then Defense2_X=Defense2_X-Defense2_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P2_D3
 Defense3_Y=Defense3_Y-Defense3_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense3_X<130 then Defense3_X=Defense3_X+Defense3_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense3_X>27 then Defense3_X=Defense3_X-Defense3_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P2_D5
 Defense5_Y=Defense5_Y-Defense5_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense5_X<122 then Defense5_X=Defense5_X+Defense5_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense5_X>19 then Defense5_X=Defense5_X-Defense5_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P2_D6
 Defense6_Y=Defense6_Y-Defense6_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense6_X<130 then Defense6_X=Defense6_X+Defense6_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense6_X>27 then Defense6_X=Defense6_X-Defense6_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P2_D7
 Defense7_Y=Defense7_Y-Defense7_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense7_X<130 then Defense7_X=Defense7_X+Defense7_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense7_X>19 then Defense7_X=Defense7_X-Defense7_Speed  ; Randomly Move Defensive Player Left
 return

 ;  «◘■■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■► Play 3 ◄■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■■◘»
 ;                     Outside 2 Defenders 
 ;                       cover receivers
 ;  «◘■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■◘»

 ; Modified so D1 and D7 hang back to cover receivers.  They will block passes, resulting in an incomplete pass message.
 ; D1 and D7 will also block passes in all other plays, good for randomization as only 2 of 7 can block, so blocks will only happen sometimes.

p3
;Move the Offensive Receiver up the screen, then back and forth when he reaches the end zone
 ;Don't let the receiver run out of the end zone
 if Receiver_Y<19 then Receiver_Y=18                                   ; if Receiver_Y is 19 or higher run up the field
 if Receiver_Y>18 then Receiver_Y=Receiver_Y-2                         ; If the Receiver is not in the endzone yet, move him up the field
 
 ;Defensive Player 1 stays back to cover the receiver
 Defense1_Y=24                                

 ;Defensive Player 7 stays back to cover the receiver
 Defense7_Y=24                                  

 ;Each Individual Defensive Player can have a different movement Pattern, defined in each of these subroutines
 if Reached_Bottom2=$00 then gosub Move_Down_P3_D2                     ; If Defensive Player 2 hasn't reached the bottom, move him down
 if Reached_Bottom2=$01 then gosub Move_Up_P3_D2                       ; If Defensive Player 2 reached the bottom, move him up the field
 if Reached_Bottom3=$00 then gosub Move_Down_P3_D3                     ; If Defensive Player 3 hasn't reached the bottom, move him down
 if Reached_Bottom4=$01 then gosub Move_Up_P3_D4                       ; If Defensive Player 3 reached the bottom, move him up the field
 if Reached_Bottom5=$00 then gosub Move_Down_P3_D5                     ; If Defensive Player 5 hasn't reached the bottom, move him down
 if Reached_Bottom5=$01 then gosub Move_Up_P3_D5                       ; If Defensive Player 5 reached the bottom, move him up the field
 if Reached_Bottom6=$00 then gosub Move_Down_P3_D6                     ; If Defensive Player 6 hasn't reached the bottom, move him down
 if Reached_Bottom6=$01 then gosub Move_Up_P3_D6                       ; If Defensive Player 6 reached the bottom, move him up the field
 if Option_2P=$01 then goto Assigned_Play_Return                       ; Return to Main Loop if 2 Player Option is enabled
 if Reached_Bottom3=$00 then gosub Move_Down_P2_D3                     ; If Defensive Player 3 hasn't reached the bottom, move him down
 if Reached_Bottom3=$01 then gosub Move_Up_P2_D3                       ; If Defensive Player 3 reached the bottom, move him up the field

 goto Assigned_Play_Return ; Return to Main Loop

 ; Move the Defensive Players
 ; This section individually controls each Defensive player and how they move on the screen
 ; To change the speed or skew the likely direction they'll move to, adjust the Play_Randomizer8 variable.

 ;Move Defensive Players Down the screen
Move_Down_P3_D2
 Defense2_Y=Defense2_Y+Defense2_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer2<10 && Defense2_X<122 then Defense2_X=Defense2_X+Defense2_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>50 && Defense2_X>19 then Defense2_X=Defense2_X-Defense2_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P3_D3
 if Option_2P=$01 then return
 Defense3_Y=Defense3_Y+Defense3_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer4<10 && Defense3_X<122 then Defense3_X=Defense3_X+Defense3_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>50 && Defense3_X>19 then Defense3_X=Defense3_X-Defense3_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P3_D4
 Defense4_Y=Defense4_Y+Defense4_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer4<10 && Defense4_X<130 then Defense4_X=Defense4_X+Defense4_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>50 && Defense4_X>19 then Defense4_X=Defense4_X-Defense4_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P3_D5
 Defense5_Y=Defense5_Y+Defense5_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer5<10 && Defense5_X<130 then Defense5_X=Defense5_X+Defense5_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer6>50 && Defense5_X>27 then Defense5_X=Defense5_X-Defense5_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P3_D6
 Defense6_Y=Defense6_Y+Defense6_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer7<10 && Defense6_X<122 then Defense6_X=Defense6_X+Defense6_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense6_X>19 then Defense6_X=Defense6_X-Defense6_Speed  ; Randomly Move Defensive Player Left
 return

 ;Move Defensive Players Up the screen
Move_Up_P3_D2
 Defense2_Y=Defense2_Y-Defense2_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense2_X<122 then Defense2_X=Defense2_X+Defense2_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense2_X>19 then Defense2_X=Defense2_X-Defense2_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P3_D3
 if Option_2P=$01 then return
 Defense3_Y=Defense3_Y-Defense3_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense3_X<130 then Defense3_X=Defense3_X+Defense3_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense3_X>27 then Defense3_X=Defense3_X-Defense3_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P3_D4
 Defense4_Y=Defense4_Y-Defense4_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense4_X<122 then Defense4_X=Defense4_X+Defense4_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense4_X>27 then Defense4_X=Defense4_X-Defense4_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P3_D5
 Defense5_Y=Defense5_Y-Defense5_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense5_X<122 then Defense5_X=Defense5_X+Defense5_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense5_X>19 then Defense5_X=Defense5_X-Defense5_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P3_D6
 Defense6_Y=Defense6_Y-Defense6_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense6_X<130 then Defense6_X=Defense6_X+Defense6_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense6_X>27 then Defense6_X=Defense6_X-Defense6_Speed  ; Randomly Move Defensive Player Left
 return

 ;  «◘■■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■► Play 4 ◄■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■■◘»
 ;                           Blitz!
 ;  «◘■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■◘»

 ; Edited for outside two players on each side to move more quickly, less likely to move left and right, untested

p4
;Move the Offensive Receiver up the screen, then back and forth when he reaches the end zone
 ;Don't let the receiver run out of the end zone
 if Receiver_Y<19 then Receiver_Y=18                                   ; if Receiver_Y is 19 or higher run up the field
 if Receiver_Y>35 && Receiver_Y<70 then Receiver_Y=Receiver_Y+1        ; Mid field slowdown for the receiver
 if Receiver_Y>18 then Receiver_Y=Receiver_Y-2                         ; If the Receiver is not in the endzone yet, move him up the field

 ;Each Individual Defensive Player can have a different movement Pattern, defined in each of these subroutines
 if Reached_Bottom1=$00 then gosub Move_Down_P4_D1                     ; If Defensive Player 1 hasn't reached the bottom, move him down
 if Reached_Bottom1=$01 then gosub Move_Up_P4_D1                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom2=$00 then gosub Move_Down_P4_D2                     ; If Defensive Player 2 hasn't reached the bottom, move him down
 if Reached_Bottom2=$01 then gosub Move_Up_P4_D2                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom4=$00 then gosub Move_Down_P4_D4                     ; If Defensive Player 4 hasn't reached the bottom, move him down
 if Reached_Bottom4=$01 then gosub Move_Up_P4_D4                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom5=$00 then gosub Move_Down_P4_D5                     ; If Defensive Player 5 hasn't reached the bottom, move him down
 if Reached_Bottom5=$01 then gosub Move_Up_P4_D5                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom6=$00 then gosub Move_Down_P4_D6                     ; If Defensive Player 6 hasn't reached the bottom, move him down
 if Reached_Bottom6=$01 then gosub Move_Up_P4_D6                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom7=$00 then gosub Move_Down_P4_D7                     ; If Defensive Player 7 hasn't reached the bottom, move him down
 if Reached_Bottom7=$01 then gosub Move_Up_P4_D7                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Option_2P=$01 then goto Assigned_Play_Return                       ; Return to Main Loop if 2 Player Option is enabled
 if Reached_Bottom3=$00 then gosub Move_Down_P4_D3                     ; If Defensive Player 3 hasn't reached the bottom, move him down
 if Reached_Bottom3=$01 then gosub Move_Up_P4_D3                       ; If Defensive Player 1 reached the bottom, move him up the field

 goto Assigned_Play_Return ; Return to Main Loop

 ; Move the Defensive Players
 ; This section individually controls each Defensive player and how they move on the screen
 ; To change the speed or skew the likely direction they'll move to, adjust the Play_Randomizer8 variable.

 ;Move Defensive Players Down the screen
Move_Down_P4_D1
 Defense1_Y=Defense1_Y+Defense1_Speed                                                ; Move Defensive Player down the field
 return
Move_Down_P4_D2
 Defense2_Y=Defense2_Y+Defense2_Speed                                                ; Move Defensive Player down the field
 return
Move_Down_P4_D3
 Defense3_Y=Defense3_Y+Defense3_Speed:Defense3_Y=Defense3_Y+Blitz_Speed              ; Move Defensive Player down the field
 return
Move_Down_P4_D4
 Defense4_Y=Defense4_Y+Defense4_Speed:Defense4_Y=Defense4_Y+Blitz_Speed              ; Move Defensive Player down the field
 return
Move_Down_P4_D5
 Defense5_Y=Defense5_Y+Defense5_Speed :Defense5_Y=Defense5_Y+Blitz_Speed             ; Move Defensive Player down the field
 return
Move_Down_P4_D6
 Defense6_Y=Defense6_Y+Defense6_Speed                                                ; Move Defensive Player down the field
 return
Move_Down_P4_D7
 Defense7_Y=Defense7_Y+Defense7_Speed                                                ; Move Defensive Player down the field
 return

 ;Move Defensive Players Up the screen
Move_Up_P4_D1
 Defense1_Y=Defense1_Y-Defense1_Speed                                               ; Move Defensive Player Up the field
 return
Move_Up_P4_D2
 Defense2_Y=Defense2_Y-Defense2_Speed                                               ; Move Defensive Player Up the field
 return
Move_Up_P4_D3
 Defense3_Y=Defense3_Y-Defense3_Speed                                               ; Move Defensive Player Up the field
 return
Move_Up_P4_D4
 Defense4_Y=Defense4_Y-Defense4_Speed                                               ; Move Defensive Player Up the field
 return
Move_Up_P4_D5
 Defense5_Y=Defense5_Y-Defense5_Speed                                               ; Move Defensive Player Up the field
 return
Move_Up_P4_D6
 Defense6_Y=Defense6_Y-Defense6_Speed                                               ; Move Defensive Player Up the field
 return
Move_Up_P4_D7
 Defense7_Y=Defense7_Y-Defense7_Speed                                               ; Move Defensive Player Up the field
 return

 ;  «◘■■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■► Play 5 ◄■▄■▀▀■▄▄■▀▀■▄▄■▀▀■▄■■◘»
 ;                           Random
 ;  «◘■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■◘»

 ; Same as default but different randomization

p5
;Move the Offensive Receiver up the screen, then back and forth when he reaches the end zone
 ;Don't let the receiver run out of the end zone
 if Receiver_Y<19 then Receiver_Y=18                                   ; if Receiver_Y is 19 or higher run up the field
 if Receiver_Y>18 then Receiver_Y=Receiver_Y-2                         ; If the Receiver is not in the endzone yet, move him up the field

 ;Each Individual Defensive Player can have a different movement Pattern, defined in each of these subroutines
 if Defense1_X<105 then Defense1_X=Defense1X+2:goto Skip_D1_Down
 if Reached_Bottom1=$00 then gosub Move_Down_P5_D1                     ; If Defensive Player 1 hasn't reached the bottom, move him down
Skip_D1_Down
 if Reached_Bottom1=$01 then gosub Move_Up_P5_D1                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom2=$00 then gosub Move_Down_P5_D2                     ; If Defensive Player 2 hasn't reached the bottom, move him down
 if Reached_Bottom2=$01 then gosub Move_Up_P5_D2                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom4=$00 then gosub Move_Down_P5_D4                     ; If Defensive Player 4 hasn't reached the bottom, move him down
 if Reached_Bottom4=$01 then gosub Move_Up_P5_D4                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom5=$00 then gosub Move_Down_P5_D5                     ; If Defensive Player 5 hasn't reached the bottom, move him down
 if Reached_Bottom6=$00 then gosub Move_Down_P5_D6                     ; If Defensive Player 6 hasn't reached the bottom, move him down
 if Reached_Bottom7=$00 then gosub Move_Down_P5_D7                     ; If Defensive Player 7 hasn't reached the bottom, move him down
 if Reached_Bottom5=$01 then gosub Move_Up_P5_D5                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom6=$01 then gosub Move_Up_P5_D6                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Reached_Bottom7=$01 then gosub Move_Up_P5_D7                       ; If Defensive Player 1 reached the bottom, move him up the field
 if Option_2P=$01 then goto Assigned_Play_Return                       ; Return to Main Loop if 2 Player Option is enabled
 if Reached_Bottom3=$00 then gosub Move_Down_P5_D3                     ; If Defensive Player 3 hasn't reached the bottom, move him down
 if Reached_Bottom3=$01 then gosub Move_Up_P5_D3                       ; If Defensive Player 1 reached the bottom, move him up the field

 goto Assigned_Play_Return ; Return to Main Loop

 ; Move the Defensive Players
 ; This section individually controls each Defensive player and how they move on the screen
 ; To change the speed or skew the likely direction they'll move to, adjust the Play_Randomizer8 variable.
 dmahole 2
  ;Move Defensive Players Down the screen
Move_Down_P5_D1
 Defense1_Y=Defense1_Y+Defense1_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer5<10 && Defense1_X<122 then Defense1_X=Defense1_X+Defense1_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer1>50 && Defense1_X>19 then Defense1_X=Defense1_X-Defense1_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P5_D2
 Defense2_Y=Defense2_Y+Defense2_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer2<2 && Defense2_X<122 then Defense2_X=Defense2_X+Defense2_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>30 && Defense2_X>19 then Defense2_X=Defense2_X-Defense2_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P5_D3
 Defense3_Y=Defense3_Y+Defense3_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer4<10 && Defense3_X<122 then Defense3_X=Defense3_X+Defense3_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>50 && Defense3_X>19 then Defense3_X=Defense3_X-Defense3_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P5_D4
 Defense4_Y=Defense4_Y+Defense4_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer4<10 && Defense4_X<130 then Defense4_X=Defense4_X+Defense4_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>50 && Defense4_X>19 then Defense4_X=Defense4_X-Defense4_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P5_D5
 Defense5_Y=Defense5_Y+Defense5_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer5<10 && Defense5_X<130 then Defense5_X=Defense5_X+Defense5_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer6>50 && Defense5_X>27 then Defense5_X=Defense5_X-Defense5_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P5_D6
 Defense6_Y=Defense6_Y+Defense6_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer7<10 && Defense6_X<122 then Defense6_X=Defense6_X+Defense6_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense6_X>19 then Defense6_X=Defense6_X-Defense6_Speed  ; Randomly Move Defensive Player Left
 return
Move_Down_P5_D7
 Defense7_Y=Defense7_Y+Defense7_Speed                                               ; Move Defensive Player down the field
 if Play_Randomizer1<30 && Defense7_X<130 then Defense7_X=Defense7_X+Defense7_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer3>57 && Defense7_X>27 then Defense7_X=Defense7_X-Defense7_Speed  ; Randomly Move Defensive Player Left
 return

 ;Move Defensive Players Up the screen
Move_Up_P5_D1
 Defense1_Y=Defense1_Y-Defense1_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense1_X<122 then Defense1_X=Defense1_X+Defense1_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense1_X>19 then Defense1_X=Defense1_X-Defense1_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P5_D2
 Defense2_Y=Defense2_Y-Defense2_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense2_X<122 then Defense2_X=Defense2_X+Defense2_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense2_X>19 then Defense2_X=Defense2_X-Defense2_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P5_D3
 Defense3_Y=Defense3_Y-Defense3_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense3_X<130 then Defense3_X=Defense3_X+Defense3_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense3_X>27 then Defense3_X=Defense3_X-Defense3_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P5_D4
 Defense4_Y=Defense4_Y-Defense4_Speed                                               ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense4_X<122 then Defense4_X=Defense4_X+Defense4_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense4_X>27 then Defense4_X=Defense4_X-Defense4_Speed  ; Randomly Move Defensive Player Left
 return

 ;Hang back after turning around and cover the middle
 ;------------------------------------------------------------------------------------------------------------------------

Move_Up_P5_D5
 if Defense5_Y>40 then Defense5_Y=Defense5_Y-Defense5_Speed                         ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense5_X<122 then Defense5_X=Defense5_X+Defense5_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense5_X>19 then Defense5_X=Defense5_X-Defense5_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P5_D6
 if Defense6_Y>80 then Defense6_Y=Defense6_Y-Defense6_Speed                         ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense6_X<130 then Defense6_X=Defense6_X+Defense6_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense6_X>27 then Defense6_X=Defense6_X-Defense6_Speed  ; Randomly Move Defensive Player Left
 return
Move_Up_P5_D7
 if Defense7_Y>120 then Defense7_Y=Defense7_Y-Defense7_Speed                         ; Move Defensive Player Up the field
 if Play_Randomizer8<10 && Defense7_X<130 then Defense7_X=Defense7_X+Defense7_Speed ; Randomly Move Defensive Player Right
 if Play_Randomizer8>50 && Defense7_X>19 then Defense7_X=Defense7_X-Defense7_Speed  ; Randomly Move Defensive Player Left
 return

Intro
  plotbanner AA_Logo3 4 28 Logo_Y 
  savescreen
  speak areyouready
Logo_Sequence
  P0C1=$06 
  P1C1=$00 : P1C2=$42 : P1C3=$3D  ; Red Football Players
  P4C1=$08 : P4C2=$82 : P4C3=$34 
  P5C1=$0C : P5C2=$00 : P5C3=$34
  P6C1=$EC : P6C2=$08 : P6C3=$F2
  P7C1=$00 : P7C2=$86 : P7C3=$3D 
  Intro_Referee_Y=0
  frame_counter=0
  Logo_Y=172
  Intro_Football_Y=5
  Intro_Player_X=72
date
  frame_counter=frame_counter+1
  if frame_counter=7    then animation_frame=animation_frame+1:frame_counter=0 ; Slow down the animation
  if animation_frame>2  then animation_frame=0    ; Three frames of animation
  ;temp7=rand&63
  restorescreen
  clearscreen
  fadeindex=fadeindex+1
  if fadeindex<127 then fadeluma=fadeindex/8
  if fadeindex>136 then fadeluma=32-(fadeindex/8)
  P0C1=fadeluma:P0C2=fadeluma:P0C3=fadeluma
  plotchars 'atariage' 0 46 6
  plotchars 'presents...' 0 40 7
  if frame_counter=1 && Intro_Player_Y<172 then playsfx sfx_walk
  if Intro_Football_Y<172 then plotsprite football_alt1 6 79 Intro_Football_Y animation_frame
  Intro_Football_Y=Intro_Football_Y+1
  if Intro_Football_Y>82 then Intro_Football_Y=Intro_Football_Y+1
  if Intro_Player_Y<172 then Intro_Player_Y=Intro_Player_Y+1
  if Intro_Player_Y<172 then plotsprite Player_Anim1 1 Intro_Player_X Intro_Player_Y animation_frame
  if Intro_Player_Y=172 then Intro_Player_Y=226
  if Intro_Football_Y=170 then playsfx sfx_touchdown
  if Intro_Football_Y>171 then Intro_Football_Y=171
  plotsprite Player_UAnim1 7 72 171 
  plotbanner AA_Logo3 4 28 Logo_Y 
  drawscreen
  gosub JoystickLeftButton
  if debounce=1 then debounce=0:goto init
  if fadeindex>0 then goto date
copyright
  Intro_Football_Y=226
  restorescreen
  clearscreen
  fadeindex=fadeindex+1
  if fadeindex<127 then fadeluma=fadeindex/8
  if fadeindex>136 then fadeluma=32-(fadeindex/8)
  P0C1=fadeluma:P0C2=fadeluma:P0C3=fadeluma
  plotchars    'a game by' 0 43 6
  plotchars 'steve engelhardt' 0 16 7
  plotbanner AA_Logo3 4 28 Logo_Y 
  if Intro_Referee_Y<62 then Intro_Referee_Y=Intro_Referee_Y+1
  if Intro_Referee_Y=30 then playsfx sfx_whistle
  if Intro_Referee_Y=62 then mutesfx tia
  if Intro_Referee_Y<62 then plotsprite referee_handdown 5 70 Intro_Referee_Y
  if Intro_Referee_Y=62 then plotsprite referee_touchdown 5 70 62
  drawscreen
  gosub JoystickLeftButton
  if debounce=1 then debounce=0:goto init
  if fadeindex>0 then goto copyright
  clearscreen
  drawscreen
  goto init

 data sfx_deeproar
 $10,$10,$00 ; version, priority, frames per chunk
 $0f,$06,$02 ; first chunk of freq,channel,volume
 $0b,$06,$0a
 $1f,$06,$0f
 $14,$0f,$0f
 $0c,$06,$0f
 $13,$06,$0f
 $0d,$06,$0f
 $17,$06,$0f
 $16,$06,$0f
 $17,$06,$0f
 $14,$0f,$0f
 $13,$06,$0f
 $16,$06,$0f
 $13,$0f,$0f
 $16,$06,$0f
 $13,$06,$0f
 $17,$06,$0f
 $13,$0f,$0f
 $13,$06,$0f
 $13,$06,$0f
 $14,$0f,$0f
 $16,$06,$0f
 $0d,$06,$0f
 $17,$06,$0f
 $13,$0f,$0f
 $13,$06,$0f
 $13,$06,$0f
 $14,$0f,$0f
 $17,$06,$0f
 $0d,$06,$0f
 $14,$0f,$0f
 $14,$0f,$0f
 $0d,$06,$0f
 $17,$06,$0f
 $14,$0f,$0f
 $13,$06,$0f
 $13,$06,$0f
 $0d,$06,$0f
 $17,$06,$0f
 $17,$06,$0f
 $13,$0f,$0c
 $14,$0f,$0a
 $14,$0f,$0a
 $17,$06,$0a
 $17,$06,$0a
 $13,$0f,$0a
 $0d,$06,$07
 $13,$06,$07
 $17,$06,$07
 $13,$06,$07
 $13,$06,$07
 $0d,$06,$07
 $0d,$06,$05
 $17,$06,$05
 $17,$06,$02
 $0d,$06,$02
 $0d,$06,$02
 $0d,$06,$02
 $1c,$0f,$02
 $1d,$0f,$02
 $0d,$06,$02
 $0d,$06,$02
 $0c,$06,$02
 $0d,$06,$02
 $1b,$0f,$02
 $17,$06,$02
 $0d,$06,$02
 $13,$0f,$02
 $13,$0f,$02
 $0c,$06,$02
 $00,$00,$00
end

JoystickLeftButton
 if joy0fire then debounce=2
 if !joy0fire && debounce=2 then debounce=1
 return
 
 data sfx_block
  $10,$10,$02 ; version, priority, frames per chunk
  $1F,$03,$0F ; first chunk of freq,channel,volume data 
  $1F,$08,$0E 
  $1F,$03,$0D 
  $1F,$08,$0C 
  $1F,$03,$0B 
  $1F,$08,$0A 
  $1F,$03,$09 
  $1F,$08,$08 
  $1F,$03,$07 
  $1F,$08,$06 
  $1F,$03,$05 
  $1F,$08,$04 
  $1F,$03,$03 
  $1F,$08,$02 
  $1F,$03,$01 
  $00,$00,$00 
end

 data sfx_denied
 $10,$10,$00 ; version, priority, frames per chunk
 $1e,$06,$00 ; first chunk of freq,channel,volume
 $0a,$06,$01
 $1e,$06,$02
 $1e,$06,$04
 $1e,$06,$05
 $0f,$06,$0f
 $0f,$06,$0f
 $0f,$06,$0f
 $0f,$06,$0d
 $0f,$06,$0f
 $0f,$06,$0f
 $0f,$06,$0f
 $0f,$06,$0f
 $07,$06,$08
 $07,$06,$06
 $0f,$06,$06
 $0f,$06,$04
 $0f,$06,$02
 $00,$00,$00
end

 data sfx_whistle
 $10, $10, $00
 $04, $04, $0C
 $05, $04, $0C
 $04, $04, $0F
 $05, $04, $0F
 $04, $04, $0F
 $05, $04, $0F
 $04, $04, $0F
 $05, $04, $0F
 $04, $04, $0F
 $05, $04, $0F
 $04, $04, $0F
 $05, $04, $0F
 $04, $04, $0F
 $05, $04, $0F
 $04, $04, $0F
 $05, $04, $0F
 $04, $04, $0C
 $05, $04, $0C
 $04, $04, $06
 $05, $04, $06
 $00, $00, $00
end

 data sfx_menumove
 $10,$01,$02 
 $06,$04,$0F 
 $0C,$04,$08 
 $18,$04,$04 
 $31,$04,$02 
 $00,$00,$00
end

 data sfx_walk
 $10,$10,$00 ; version, priority, frames per chunk
 $1e,$07,$0f ; first chunk of freq,channel,volume
 $1e,$07,$0e
 $12,$0f,$0e
 $1f,$07,$0e
 $1f,$0f,$0c
 $0f,$0f,$09
 $0e,$0f,$07
 $11,$0f,$07
 $10,$0f,$04
 $11,$0e,$04
 $0c,$0e,$02
 $00,$00,$00
end

 data sfx_pass
 $10,$10,$00 ; version, priority, frames per chunk
 $10,$0c,$06 ; first chunk of freq,channel,volume
 $0e,$0c,$07
 $0c,$0c,$0a
 $0b,$0c,$0e
 $1e,$04,$0f
 $04,$0c,$0c
 $1b,$04,$0e
 $0d,$04,$09
 $0d,$04,$0b
 $19,$04,$08
 $0c,$04,$0b
 $18,$04,$05
 $0c,$04,$0e
 $0c,$04,$09
 $07,$0c,$0a
 $03,$0c,$08
 $16,$04,$0d
 $16,$04,$0a
 $0a,$04,$0b
 $16,$04,$0f
 $16,$04,$0c
 $16,$04,$0c
 $07,$0c,$0d
 $07,$0c,$0f
 $07,$0c,$09
 $0c,$04,$0a
 $19,$04,$0e
 $1b,$04,$0b
 $1c,$04,$0b
 $1e,$04,$0f
 $0a,$0c,$08
 $0c,$0c,$09
 $0d,$0c,$0f
 $0d,$0c,$09
 $10,$0c,$0d
 $12,$0c,$0f
 $03,$06,$0c
 $03,$06,$04
 $1e,$06,$02
 $17,$0c,$01
 $1e,$0c,$02
 $1b,$0c,$01
 $00,$00,$00
end

 data sfx_touchdown
 $10,$10,$00 ; version, priority, frames per chunk
 $1e,$04,$0f ; first chunk of freq,channel,volume
 $1e,$04,$0f
 $12,$0c,$0e
 $19,$04,$06
 $10,$0c,$0f
 $10,$0c,$0d
 $1c,$04,$0f
 $1c,$04,$0e
 $10,$0c,$0f
 $10,$0c,$0f
 $10,$0c,$0f
 $1b,$04,$0a
 $1b,$04,$0e
 $1b,$04,$0b
 $0e,$0c,$0f
 $0e,$0c,$0e
 $10,$0c,$07
 $19,$04,$0c
 $19,$04,$08
 $0d,$0c,$07
 $0e,$0c,$07
 $0d,$0c,$0d
 $0d,$0c,$08
 $18,$04,$06
 $07,$0c,$04
 $0d,$0c,$07
 $0d,$0c,$0b
 $13,$04,$01
 $16,$04,$04
 $16,$04,$06
 $16,$04,$03
 $0c,$0c,$04
 $0c,$0c,$06
 $0c,$0c,$04
 $15,$04,$03
 $15,$04,$03
 $06,$0c,$01
 $0b,$0c,$02
 $0b,$0c,$04
 $0b,$0c,$02
 $00,$00,$00
end

  data sfx_menuselect
  $10,$04,$02 ; version, priority, frames per chunk
  $00,$06,$05 ; first chunk of freq,channel,volume data 
  $01,$06,$02 
  $02,$06,$01 
  $03,$06,$01
  $00,$00,$00 
end

