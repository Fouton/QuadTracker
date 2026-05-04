extends Window

const SIZE = Vector2i(373,338)

@onready var z1 = $Z1
@onready var m1 = $M1
@onready var z3 = $Z3
@onready var z3keys = $Z3/keys
@onready var z3nonkeys = $Z3/nonkeys
@onready var sm = $SM
@onready var smkeys = $SM/keys
@onready var smnonkeys = $SM/nonkeys
@onready var boss_block = $BossBlock

@onready var backgrounds = $Backgrounds
@onready var quad_background = $Backgrounds/QuadBackground

var games = [false, true, true, true, true] #nothing z1 m1 z3 sm
var keys = [false, false, false, false, false] #nothing z1 m1 z3 sm

const ITEMSPACING = 34
const TRACKERGAP = 10

const Z1SWORDS = [preload("res://Assets/Tracker/z-sword1.png"),preload("res://Assets/Tracker/z-sword2.png"),preload("res://Assets/Tracker/z-sword3.png")]
const Z1BOOMS = [preload("res://Assets/Tracker/z-boom1.png"),preload("res://Assets/Tracker/z-boom2.png")]
const Z1CANDLES = [preload("res://Assets/Tracker/z-candle1.png"),preload("res://Assets/Tracker/z-candle2.png")]
const Z1ARROW = [preload("res://Assets/Tracker/z-arrows1.png"),preload("res://Assets/Tracker/z-arrows2.png")]
const Z1BOW = [preload("res://Assets/Tracker/z-bow.png")]
const Z1RECORDER = [preload("res://Assets/Tracker/z-recorder.png")]
const Z1WAND = [preload("res://Assets/Tracker/z-rod.png")]
const Z1BOOK = [preload("res://Assets/Tracker/z-book.png")]
const Z1BAIT = [preload("res://Assets/Tracker/bait.png")]
const Z1BRACELET = [preload("res://Assets/Tracker/z-bracelet.png")]
const Z1LADDER = [preload("res://Assets/Tracker/z-ladder.png")]
const Z1RAFT = [preload("res://Assets/Tracker/z-raft.png")]
const Z1MAGICKEY = [preload("res://Assets/Tracker/z-magickey.png")]
const Z1LETTER = [preload("res://Assets/Tracker/z-letter.png")]
const Z1RINGS = [preload("res://Assets/Tracker/z-ring1.png"),preload("res://Assets/Tracker/z-ring2.png")]
const Z1TRI1 = [preload("res://Assets/Tracker/z-tri1.png")]
const Z1TRI2 = [preload("res://Assets/Tracker/z-tri2.png")]
const Z1TRI3 = [preload("res://Assets/Tracker/z-tri3.png")]
const Z1TRI4 = [preload("res://Assets/Tracker/z-tri4.png")]
const Z1TRI5 = [preload("res://Assets/Tracker/z-tri5.png")]
const Z1TRI6 = [preload("res://Assets/Tracker/z-tri6.png")]
const Z1TRI7 = [preload("res://Assets/Tracker/z-tri7.png")]
const Z1TRI8 = [preload("res://Assets/Tracker/z-tri8.png")]
const Z1LV9REQ = [preload("res://Assets/Tracker/GanonSignTriforce.png")]
const Z1GOALCOUNTER = [preload("res://Assets/Tracker/overlay8.png"),preload("res://Assets/Tracker/overlay0.png"),preload("res://Assets/Tracker/overlay1.png"),preload("res://Assets/Tracker/overlay2.png"),preload("res://Assets/Tracker/overlay3.png"),preload("res://Assets/Tracker/overlay4.png"),preload("res://Assets/Tracker/overlay5.png"),preload("res://Assets/Tracker/overlay6.png"),preload("res://Assets/Tracker/overlay7.png")]

const M1MORPH = [preload("res://Assets/Tracker/m-morph.png")]
const M1BOMBS = [preload("res://Assets/Tracker/m-bombs.png")]
const M1LONG = [preload("res://Assets/Tracker/m-long.png")]
const M1ICE = [preload("res://Assets/Tracker/m-ice.png")]
const M1WAVE = [preload("res://Assets/Tracker/m-wave.png")]
const M1VARIA = [preload("res://Assets/Tracker/m-varia.png")]
const M1JUMP = [preload("res://Assets/Tracker/m-jump.png")]
const M1SCREW = [preload("res://Assets/Tracker/m-screw.png")]
const M1KRAID = [preload("res://Assets/Tracker/m-kraid.png")]
const M1RIDLEY = [preload("res://Assets/Tracker/m-ridley.png")]

const CHECKMARK = [preload("res://Assets/Tracker/checkmark.png")]
const MEDALLION_INFO = [preload("res://Assets/Tracker/MMOverlay.png"),preload("res://Assets/Tracker/TROverlay.png"),preload("res://Assets/Tracker/BothOverlay.png")]
const Z3BOWLEFT = [preload("res://Assets/Tracker/0048.png")]
const Z3BOWRIGHT = [preload("res://Assets/Tracker/silver_arrow.png")]
const Z3BOOMLEFT = [preload("res://Assets/Tracker/blueboom.png")]
const Z3BOOMRIGHT = [preload("res://Assets/Tracker/redboom.png")]
const Z3HOOK = [preload("res://Assets/Tracker/0002.png")]
const Z3MUSHROOM = [preload("res://Assets/Tracker/0004.png")]
const Z3POWDER = [preload("res://Assets/Tracker/0046.png")]
const Z3BOOTS = [preload("res://Assets/Tracker/0020.png")]
const Z3FIREROD = [preload("res://Assets/Tracker/0005.png")]
const Z3ICEROD = [preload("res://Assets/Tracker/0006.png")]
const Z3BOMBOS = [preload("res://Assets/Tracker/0007.png")]
const Z3ETHER = [preload("res://Assets/Tracker/0008.png")]
const Z3QUAKE = [preload("res://Assets/Tracker/0009.png")]
const Z3GLOVES = [preload("res://Assets/Tracker/0019.png"),preload("res://Assets/Tracker/0043.png")]
const Z3LAMP = [preload("res://Assets/Tracker/0010.png")]
const Z3HAMMER = [preload("res://Assets/Tracker/0011.png")]
const Z3FLUTE = [preload("res://Assets/Tracker/0047.png")]
const Z3SHOVEL = [preload("res://Assets/Tracker/0012.png")]
const Z3BOOK = [preload("res://Assets/Tracker/0014.png")]
const Z3FLIPPERS = [preload("res://Assets/Tracker/0021.png")]
const Z3BOTTLES = [preload("res://Assets/Tracker/0026.png"),preload("res://Assets/Tracker/0070.png"),preload("res://Assets/Tracker/0071.png"),preload("res://Assets/Tracker/0072.png"),preload("res://Assets/Tracker/0073.png")]
const Z3SOMARIA = [preload("res://Assets/Tracker/0015.png")]
const Z3BYRNA = [preload("res://Assets/Tracker/0016.png")]
const Z3CAPE = [preload("res://Assets/Tracker/0017.png")]
const Z3MIRROR = [preload("res://Assets/Tracker/0018.png")]
const Z3PEARL = [preload("res://Assets/Tracker/0022.png")]
const Z3SWORD = [preload("res://Assets/Tracker/0023.png"),preload("res://Assets/Tracker/0038.png"),preload("res://Assets/Tracker/0039.png"),preload("res://Assets/Tracker/0040.png")]
const Z3NET = [preload("res://Assets/Tracker/0013.png")]
const Z3SHIELD = [preload("res://Assets/Tracker/0024.png"),preload("res://Assets/Tracker/0044.png"),preload("res://Assets/Tracker/0045.png")]
const Z3MAGIC = [preload("res://Assets/Tracker/0064.png")]
const Z3EP = [preload("res://Assets/Tracker/EP.png")]
const Z3DP = [preload("res://Assets/Tracker/DP.png")]
const Z3TOH = [preload("res://Assets/Tracker/TOH.png")]
const Z3POD = [preload("res://Assets/Tracker/POD.png")]
const Z3SP = [preload("res://Assets/Tracker/SP.png")]
const Z3SW = [preload("res://Assets/Tracker/SW.png")]
const Z3TT = [preload("res://Assets/Tracker/TT.png")]
const Z3IP = [preload("res://Assets/Tracker/IP.png")]
const Z3MM = [preload("res://Assets/Tracker/MM.png")]
const Z3TR = [preload("res://Assets/Tracker/TR.png")]
const Z3LITTLEEP = [preload("res://Assets/Tracker/littleEP.png")]
const Z3LITTLEDP = [preload("res://Assets/Tracker/littleDP.png")]
const Z3LITTLETOH = [preload("res://Assets/Tracker/littleTH.png")]
const Z3AGA1 = [preload("res://Assets/Tracker/aga1.png")]
const Z3AGA2 = [preload("res://Assets/Tracker/aga2.png")]
const Z3LITTLEPOD = [preload("res://Assets/Tracker/littlePD.png")]
const Z3LITTLESP = [preload("res://Assets/Tracker/littleSP.png")]
const Z3LITTLESW = [preload("res://Assets/Tracker/littleSW.png")]
const Z3LITTLETT = [preload("res://Assets/Tracker/littleTT.png")]
const Z3LITTLEIP = [preload("res://Assets/Tracker/littleIP.png")]
const Z3LITTLEMM = [preload("res://Assets/Tracker/littleMM.png")]
const Z3LITTLETR = [preload("res://Assets/Tracker/littleTR.png")]
const Z3HC = [preload("res://Assets/Tracker/littleHC.png")]
const Z3AT = [preload("res://Assets/Tracker/littleAT.png")]
const Z3GT = [preload("res://Assets/Tracker/littleGT.png")]
const Z31KEY = [preload("res://Assets/Tracker/0.png"),preload("res://Assets/Tracker/1G.png")]
const Z32KEY = [preload("res://Assets/Tracker/0.png"),preload("res://Assets/Tracker/1.png"),preload("res://Assets/Tracker/2G.png")]
const Z33KEY = [preload("res://Assets/Tracker/0.png"),preload("res://Assets/Tracker/1.png"),preload("res://Assets/Tracker/2.png"),preload("res://Assets/Tracker/3G.png")]
const Z34KEY = [preload("res://Assets/Tracker/0.png"),preload("res://Assets/Tracker/1.png"),preload("res://Assets/Tracker/2.png"),preload("res://Assets/Tracker/3.png"),preload("res://Assets/Tracker/4G.png")]
const Z36KEY = [preload("res://Assets/Tracker/0.png"),preload("res://Assets/Tracker/1.png"),preload("res://Assets/Tracker/2.png"),preload("res://Assets/Tracker/3.png"),preload("res://Assets/Tracker/4.png"),preload("res://Assets/Tracker/5.png"),preload("res://Assets/Tracker/6G.png")]
const Z3DOORKEY = [preload("res://Assets/Tracker/0.png"),preload("res://Assets/Tracker/1.png"),preload("res://Assets/Tracker/2.png"),preload("res://Assets/Tracker/3.png"),preload("res://Assets/Tracker/4.png"),preload("res://Assets/Tracker/5.png"),preload("res://Assets/Tracker/6.png"),preload("res://Assets/Tracker/7.png"),preload("res://Assets/Tracker/8.png"),preload("res://Assets/Tracker/9.png")]
const Z3BIGKEY = [preload("res://Assets/Tracker/BigKey.png")]
const Z3PRIZE = [preload("res://Assets/Tracker/overlayNA2.png"),preload("res://Assets/Tracker/crystal.png"),preload("res://Assets/Tracker/redcrystal.png"),preload("res://Assets/Tracker/pendant.png"),preload("res://Assets/Tracker/greenpendant.png"),preload("res://Assets/Tracker/g4.png")]
const Z3LITTLEPRIZE = [preload("res://Assets/Tracker/littleQM.png"),preload("res://Assets/Tracker/littleCrystal.png"),preload("res://Assets/Tracker/littleRC.png"),preload("res://Assets/Tracker/littleP.png"),preload("res://Assets/Tracker/littleGP.png"),preload("res://Assets/Tracker/littleG4.png")]
const Z3LITTLENOPRIZE = [null,null,preload("res://Assets/Tracker/noC.png"),null,preload("res://Assets/Tracker/noGP.png"),null]
const Z3LEFTROD = [preload("res://Assets/Tracker/firerodL.png")]
const Z3RIGHTROD = [preload("res://Assets/Tracker/icerodR.png")]
const Z3MUSH = [preload("res://Assets/Tracker/mush.png")]
const Z3DER = [preload("res://Assets/Tracker/der.png")]
const Z3LUTE = [preload("res://Assets/Tracker/lute.png")]
const Z3SHOV = [preload("res://Assets/Tracker/shov.png")]
const Z3BYRN = [preload("res://Assets/Tracker/byrn.png")]
const Z3GTREQ = [preload("res://Assets/Tracker/GTSign.png")]
const Z3GANONREQ = [preload("res://Assets/Tracker/GanonSign.png")]
const Z3GOALCOUNTER = [preload("res://Assets/Tracker/overlay7.png"),preload("res://Assets/Tracker/overlay0.png"),preload("res://Assets/Tracker/overlay1.png"),preload("res://Assets/Tracker/overlay2.png"),preload("res://Assets/Tracker/overlay3.png"),preload("res://Assets/Tracker/overlay4.png"),preload("res://Assets/Tracker/overlay5.png"),preload("res://Assets/Tracker/overlay6.png")]

const SMCHARGE = [preload("res://Assets/Tracker/charge.png")]
const SMWAVE = [preload("res://Assets/Tracker/wave.png")]
const SMICE = [preload("res://Assets/Tracker/ice.png")]
const SMSPAZER = [preload("res://Assets/Tracker/spazer.png")]
const SMPLASMA = [preload("res://Assets/Tracker/plasma.png")]
const SMMORPH = [preload("res://Assets/Tracker/morph.png")]
const SMBOMBS = [preload("res://Assets/Tracker/bomb.png")]
const SMSPRING = [preload("res://Assets/Tracker/springball.png")]
const SMGRAPPLE = [preload("res://Assets/Tracker/grapple.png")]
const SMHALFGRAPPLE = [preload("res://Assets/Tracker/halfgrapple.png")]
const SMXRAY = [preload("res://Assets/Tracker/xray.png")]
const SMHALFXRAY = [preload("res://Assets/Tracker/halfxray.png")]
const SMVARIA = [preload("res://Assets/Tracker/varia.png")]
const SMHALFSPAZ = [preload("res://Assets/Tracker/halfspazer.png")]
const SMHIJUMP = [preload("res://Assets/Tracker/hijump.png")]
const SMSPACE = [preload("res://Assets/Tracker/space.png")]
const SMGRAVITY = [preload("res://Assets/Tracker/gravity.png")]
const SMHALFPLAS = [preload("res://Assets/Tracker/halfplasma.png")]
const SMHALFVARIA = [preload("res://Assets/Tracker/halfvaria.png")]
const SMHALFGRAV = [preload("res://Assets/Tracker/halfgrav.png")]
const SMSPEED = [preload("res://Assets/Tracker/speed.png")]
const SMSCREW = [preload("res://Assets/Tracker/screw.png")]
const SMKRAID = [preload("res://Assets/Tracker/Boss2.png")]
const SMPHANTOON = [preload("res://Assets/Tracker/Boss3.png")]
const SMDRAYGON = [preload("res://Assets/Tracker/Boss4.png")]
const SMRIDLEY = [preload("res://Assets/Tracker/Boss1.png")]
const SMBR = [preload("res://Assets/Tracker/BR.png")]
const SMWS = [preload("res://Assets/Tracker/WS.png")]
const SMMD = [preload("res://Assets/Tracker/MD.png")]
const SMLN = [preload("res://Assets/Tracker/LN.png")]
const SMlittleBR = [preload("res://Assets/Tracker/littleBR.png")]
const SMlittleWS = [preload("res://Assets/Tracker/littleWS.png")]
const SMlittleMD = [preload("res://Assets/Tracker/littleMD.png")]
const SMlittleLN = [preload("res://Assets/Tracker/littleLN.png")]
const SMlittleCR = [preload("res://Assets/Tracker/littleCR.png")]
const SMlittleUN = [preload("res://Assets/Tracker/littleUN.png")]
const SMPRIZE = [preload("res://Assets/Tracker/overlayNA2.png"),preload("res://Assets/Tracker/g4.png"),preload("res://Assets/Tracker/crystal.png"),preload("res://Assets/Tracker/redcrystal.png"),preload("res://Assets/Tracker/pendant.png"),preload("res://Assets/Tracker/greenpendant.png")]
const SMlittlePRIZE = [preload("res://Assets/Tracker/littleQM.png"),preload("res://Assets/Tracker/littleG4.png"),preload("res://Assets/Tracker/littleCrystal.png"),preload("res://Assets/Tracker/littleRC.png"),preload("res://Assets/Tracker/littleP.png"),preload("res://Assets/Tracker/littleGP.png")]
const SMNOPRIZE = [null,null,null,preload("res://Assets/Tracker/noC.png"),null,preload("res://Assets/Tracker/noGP.png")]
const SMFIRSTKEY = [preload("res://Assets/Tracker/1B.png")]
const SMSECONDKEY = [preload("res://Assets/Tracker/2R.png")]
const SMBOSSKEY = [preload("res://Assets/Tracker/BossKey.png")]
const SMG4REQ = [preload("res://Assets/Tracker/G4Sign.png")]
const SMGOALCOUNTER = [preload("res://Assets/Tracker/overlay4.png"),preload("res://Assets/Tracker/overlay0.png"),preload("res://Assets/Tracker/overlay1.png"),preload("res://Assets/Tracker/overlay2.png"),preload("res://Assets/Tracker/overlay3.png")]

const Z1GANON = [preload("res://Assets/Tracker/z-ganon.png")]
const M1MB = [preload("res://Assets/Tracker/m-brain.png")]
const Z3GANON = [preload("res://Assets/Tracker/ganon.png")]
const SMMB = [preload("res://Assets/Tracker/mbrain.png")]

var z1sword; var z1boom; var z1candles; var z1bow; var z1recorder; var z1wand; var z1bait;
var z1bracelet; var z1ladder; var z1raft; var z1key; var z1letter; var z1book; var z1ring
var z1tri1; var z1tri2; var z1tri3; var z1tri4; var z1tri5; var z1tri6; var z1tri7; var z1tri8
var z1lv9req

var m1morph; var m1bombs
var m1long; var m1ice; var m1wave
var m1varia; var m1jump; var m1screw
var m1kraid; var m1ridley

var z3bow; var z3boom; var z3hook; var z3mush; var z3powder
var z3boots; var z3frod; var z3irod; var z3bombos; var z3ether; var z3quake
var z3gloves; var z3lamp; var z3hammer; var z3flute; var z3shovel; var z3book
var z3flippers; var z3bottle; var z3somaria; var z3byrna; var z3cape; var z3mirror
var z3pearl; var z3sword; var z3shield; var z3magic; var z3net;
var z3ep; var z3dp; var z3toh; var z3aga; var z3pod; var z3sp;
var z3sw; var z3tt; var z3ip; var z3mm; var z3tr
var z3littleep; var z3littledp; var z3littletoh; var z3littleaga; var z3littlepod
var z3littlesp; var z3littlesw; var z3littlett; var z3littleip; var z3littlemm
var z3littletr; var z3hc; var z3at; var z3gt; var z3hckeys; var z3atkeys
var z3dpkeys; var z3tohkeys; var z3podkeys; var z3spkeys; var z3swkeys
var z3ttkeys; var z3ipkeys; var z3mmkeys; var z3trkeys; var z3gtkeys
var z3hcbk; var z3atbk; var z3epbk; var z3dpbk; var z3tohbk; var z3podbk
var z3spbk; var z3swbk; var z3ttbk; var z3ipbk; var z3mmbk; var z3trbk
var z3gtbk; var z3shovlute; var z3byrncape; var z3mushder; var z3frods
var z3gtreq; var z3ganonreq

var smcharge; var smmorph; var smspring; var smgrapple; var smice; var smhijump
var smspeed; var smspace; var smwave; var smvaria; var smgravity; var smscrew
var smspazer; var smxray; var smkraid; var smphantoon; var smplasma; var smdraygon
var smridley; var smg4req; var smsuits

var smspazma; var smgrapray; var smlittleCR; var smCR1; var smCR2; var smCRboss
var smlittleBR; var smBR1; var smBR2; var smBRboss
var smlittleWS; var smWS1; var smWSboss
var smlittleMD; var smMD1; var smMD2; var smMDboss
var smlittleUN; var smUN1; var smUN2; var smUNboss
var smlittleLN; var smLN1; var smLNboss

var z1ganon; var m1mb; var z3ganon; var smmb

func _ready():
	# Zelda 1 Trackables
	z1sword = _standardTrackable(1,0*ITEMSPACING,0*ITEMSPACING,Z1SWORDS)
	z1boom = _standardTrackable(1,1*ITEMSPACING,0*ITEMSPACING,Z1BOOMS)
	z1candles = _standardTrackable(1,2*ITEMSPACING,0*ITEMSPACING,Z1CANDLES)
	z1bow = _standardTrackable(1,3*ITEMSPACING,0*ITEMSPACING,Z1BOW, Z1ARROW,true,true,false,false)
	z1recorder = _standardTrackable(1,4*ITEMSPACING,0*ITEMSPACING,Z1RECORDER)
	z1lv9req = _DoubleImageTrackable(1,5*ITEMSPACING,0*ITEMSPACING,Z1LV9REQ,Z1GOALCOUNTER)
	z1wand = _standardTrackable(1,0*ITEMSPACING,1*ITEMSPACING,Z1WAND)
	z1bait = _standardTrackable(1,1*ITEMSPACING,1*ITEMSPACING,Z1BAIT)
	z1bracelet = _standardTrackable(1,2*ITEMSPACING,1*ITEMSPACING,Z1BRACELET)
	z1ladder = _standardTrackable(1,3*ITEMSPACING,1*ITEMSPACING,Z1LADDER)
	z1raft = _standardTrackable(1,4*ITEMSPACING,1*ITEMSPACING,Z1RAFT)
	z1key = _standardTrackable(1,5*ITEMSPACING,1*ITEMSPACING,Z1MAGICKEY)
	z1letter = _standardTrackable(1,10*ITEMSPACING,10*ITEMSPACING,Z1LETTER)
	z1book = _standardTrackable(1,10*ITEMSPACING,10*ITEMSPACING,Z1BOOK)
	z1ring = _standardTrackable(1,10*ITEMSPACING,10*ITEMSPACING,Z1RINGS)
	z1tri1 = _standardTrackable(1,6*ITEMSPACING+TRACKERGAP,0*ITEMSPACING,Z1TRI1)
	z1tri2 = _standardTrackable(1,7*ITEMSPACING+TRACKERGAP,0*ITEMSPACING,Z1TRI2)
	z1tri3 = _standardTrackable(1,8*ITEMSPACING+TRACKERGAP,0*ITEMSPACING,Z1TRI3)
	z1tri4 = _standardTrackable(1,9*ITEMSPACING+TRACKERGAP,0*ITEMSPACING,Z1TRI4)
	z1tri5 = _standardTrackable(1,6*ITEMSPACING+TRACKERGAP,1*ITEMSPACING,Z1TRI5)
	z1tri6 = _standardTrackable(1,7*ITEMSPACING+TRACKERGAP,1*ITEMSPACING,Z1TRI6)
	z1tri7 = _standardTrackable(1,8*ITEMSPACING+TRACKERGAP,1*ITEMSPACING,Z1TRI7)
	z1tri8 = _standardTrackable(1,9*ITEMSPACING+TRACKERGAP,1*ITEMSPACING,Z1TRI8)
	
	# Metroid 1 Trackables
	m1morph = _standardTrackable(2,0*ITEMSPACING,0*ITEMSPACING,M1MORPH)
	m1bombs = _standardTrackable(2,1*ITEMSPACING,0*ITEMSPACING,M1BOMBS)
	m1long = _standardTrackable(2,2*ITEMSPACING,0*ITEMSPACING,M1LONG)
	m1ice = _standardTrackable(2,3*ITEMSPACING,0*ITEMSPACING,M1ICE)
	m1wave = _standardTrackable(2,4*ITEMSPACING,0*ITEMSPACING,M1WAVE)
	m1varia = _standardTrackable(2,5*ITEMSPACING,0*ITEMSPACING,M1VARIA)
	m1jump = _standardTrackable(2,6*ITEMSPACING+TRACKERGAP,0*ITEMSPACING,M1JUMP)
	m1screw = _standardTrackable(2,7*ITEMSPACING+TRACKERGAP,0*ITEMSPACING,M1SCREW)
	m1kraid = _standardTrackable(2,8*ITEMSPACING+TRACKERGAP,0*ITEMSPACING,M1KRAID)
	m1ridley = _standardTrackable(2,9*ITEMSPACING+TRACKERGAP,0*ITEMSPACING,M1RIDLEY)
	
	# Zelda 3 Trackables
	z3bow = _standardTrackable(3,0*ITEMSPACING,0*ITEMSPACING,Z3BOWLEFT,Z3BOWRIGHT,true,true,false,true)
	z3boom = _standardTrackable(3,1*ITEMSPACING,0*ITEMSPACING,Z3BOOMLEFT,Z3BOOMRIGHT,true,true,false,false)
	z3hook = _standardTrackable(3,2*ITEMSPACING,0*ITEMSPACING,Z3HOOK)
	z3mush = _standardTrackable(3,3*ITEMSPACING,0*ITEMSPACING,Z3MUSHROOM,CHECKMARK,true,true,false,true)
	z3powder = _standardTrackable(3,4*ITEMSPACING,0*ITEMSPACING,Z3POWDER,CHECKMARK,true,true,false,true)
	z3frod = _standardTrackable(3,0*ITEMSPACING,1*ITEMSPACING,Z3FIREROD)
	z3irod = _standardTrackable(3,1*ITEMSPACING,1*ITEMSPACING,Z3ICEROD)
	z3bombos = _standardTrackable(3,2*ITEMSPACING,1*ITEMSPACING,Z3BOMBOS,MEDALLION_INFO)
	z3ether = _standardTrackable(3,3*ITEMSPACING,1*ITEMSPACING,Z3ETHER,MEDALLION_INFO)
	z3quake = _standardTrackable(3,4*ITEMSPACING,1*ITEMSPACING,Z3QUAKE,MEDALLION_INFO)
	z3lamp = _standardTrackable(3,0*ITEMSPACING,2*ITEMSPACING,Z3LAMP)
	z3hammer = _standardTrackable(3,1*ITEMSPACING,2*ITEMSPACING,Z3HAMMER)
	z3flute = _standardTrackable(3,2*ITEMSPACING,2*ITEMSPACING,Z3FLUTE,CHECKMARK,true,true,false,true)
	z3shovel = _standardTrackable(3,3*ITEMSPACING,2*ITEMSPACING,Z3SHOVEL,CHECKMARK,true,true,false,true)
	z3book = _standardTrackable(3,4*ITEMSPACING,2*ITEMSPACING,Z3BOOK)
	z3bottle = _standardTrackable(3,0*ITEMSPACING,3*ITEMSPACING,Z3BOTTLES,CHECKMARK,false,true,false,true)
	z3somaria = _standardTrackable(3,1*ITEMSPACING,3*ITEMSPACING,Z3SOMARIA)
	z3byrna = _standardTrackable(3,2*ITEMSPACING,3*ITEMSPACING,Z3BYRNA)
	z3cape = _standardTrackable(3,3*ITEMSPACING,3*ITEMSPACING,Z3CAPE)
	z3mirror = _standardTrackable(3,4*ITEMSPACING,3*ITEMSPACING,Z3MIRROR)
	z3boots = _standardTrackable(3,0*ITEMSPACING,4*ITEMSPACING,Z3BOOTS)
	z3gloves = _standardTrackable(3,1*ITEMSPACING,4*ITEMSPACING,Z3GLOVES)
	z3flippers = _standardTrackable(3,2*ITEMSPACING,4*ITEMSPACING,Z3FLIPPERS)
	z3pearl = _standardTrackable(3,3*ITEMSPACING,4*ITEMSPACING,Z3PEARL)
	z3net = _standardTrackable(7,4*ITEMSPACING,4*ITEMSPACING,Z3NET)
	z3sword = _standardTrackable(3,0*ITEMSPACING,5*ITEMSPACING,Z3SWORD)
	z3shield = _standardTrackable(7,1*ITEMSPACING,5*ITEMSPACING,Z3SHIELD)
	z3magic = _standardTrackable(7,2*ITEMSPACING,5*ITEMSPACING,Z3MAGIC)
	z3aga = _standardTrackable(7,5*ITEMSPACING,5*ITEMSPACING,Z3AGA1,Z3AGA2,true,true,false,false)
	z3ep = _standardTrackable(7,5*ITEMSPACING,0*ITEMSPACING,Z3EP,Z3PRIZE,true,true,true,false)
	z3dp = _standardTrackable(7,5*ITEMSPACING,0*ITEMSPACING+16,Z3DP,Z3PRIZE,true,true,true,false)
	z3toh = _standardTrackable(7,5*ITEMSPACING,1*ITEMSPACING,Z3TOH,Z3PRIZE,true,true,true,false)
	z3pod = _standardTrackable(7,5*ITEMSPACING,1*ITEMSPACING+16,Z3POD,Z3PRIZE,true,true,true,false)
	z3sp = _standardTrackable(7,5*ITEMSPACING,2*ITEMSPACING,Z3SP,Z3PRIZE,true,true,true,false)
	z3sw = _standardTrackable(7,5*ITEMSPACING,2*ITEMSPACING+16,Z3SW,Z3PRIZE,true,true,true,false)
	z3tt = _standardTrackable(7,5*ITEMSPACING,3*ITEMSPACING,Z3TT,Z3PRIZE,true,true,true,false)
	z3ip = _standardTrackable(7,5*ITEMSPACING,3*ITEMSPACING+16,Z3IP,Z3PRIZE,true,true,true,false)
	z3mm = _standardTrackable(7,5*ITEMSPACING,4*ITEMSPACING,Z3MM,Z3PRIZE,true,true,true,false)
	z3tr = _standardTrackable(7,10*ITEMSPACING,10*ITEMSPACING+16,Z3TR,Z3PRIZE,true,true,true,false)
	z3littleep = _standardTrackable(7,5*ITEMSPACING,0*ITEMSPACING,Z3LITTLEEP,Z3LITTLEPRIZE,true,true,true,false,32,16,Z3LITTLENOPRIZE)
	z3littledp = _standardTrackable(7,5*ITEMSPACING,0*ITEMSPACING+16,Z3LITTLEDP,Z3LITTLEPRIZE,true,true,true,false,32,16,Z3LITTLENOPRIZE)
	z3littletoh = _standardTrackable(7,5*ITEMSPACING,1*ITEMSPACING,Z3LITTLETOH,Z3LITTLEPRIZE,true,true,true,false,32,16,Z3LITTLENOPRIZE)
	z3littlepod = _standardTrackable(7,5*ITEMSPACING,1*ITEMSPACING+16,Z3LITTLEPOD,Z3LITTLEPRIZE,true,true,true,false,32,16,Z3LITTLENOPRIZE)
	z3littlesp = _standardTrackable(7,5*ITEMSPACING,2*ITEMSPACING,Z3LITTLESP,Z3LITTLEPRIZE,true,true,true,false,32,16,Z3LITTLENOPRIZE)
	z3littlesw = _standardTrackable(7,5*ITEMSPACING,2*ITEMSPACING+16,Z3LITTLESW,Z3LITTLEPRIZE,true,true,true,false,32,16,Z3LITTLENOPRIZE)
	z3littlett = _standardTrackable(7,5*ITEMSPACING,3*ITEMSPACING,Z3LITTLETT,Z3LITTLEPRIZE,true,true,true,false,32,16,Z3LITTLENOPRIZE)
	z3littleip = _standardTrackable(7,5*ITEMSPACING,3*ITEMSPACING+16,Z3LITTLEIP,Z3LITTLEPRIZE,true,true,true,false,32,16,Z3LITTLENOPRIZE)
	z3littlemm = _standardTrackable(7,5*ITEMSPACING,4*ITEMSPACING,Z3LITTLEMM,Z3LITTLEPRIZE,true,true,true,false,32,16,Z3LITTLENOPRIZE)
	z3littletr = _standardTrackable(7,5*ITEMSPACING,4*ITEMSPACING+16,Z3LITTLETR,Z3LITTLEPRIZE,true,true,true,false,32,16,Z3LITTLENOPRIZE)
	z3hc = _standardTrackable(6,4*ITEMSPACING,1*ITEMSPACING+16,Z3HC,null,true,true,true,false,18,16)
	z3hckeys = _standardTrackable(6,4*ITEMSPACING+16,1*ITEMSPACING+16,Z31KEY,null,false,true,false,true,16,16)
	z3at = _standardTrackable(6,5*ITEMSPACING-1,1*ITEMSPACING+16,Z3AT,null,true,true,true,false,18,16)
	z3atkeys = _standardTrackable(6,5*ITEMSPACING+16,1*ITEMSPACING+16,Z32KEY,null,false,true,false,true,16,16)
	z3gt = _standardTrackable(6,4*ITEMSPACING+8,5*ITEMSPACING+16,Z3GT,null,true,true,true,false,18,16)
	z3frods = _standardTrackable(3,0*ITEMSPACING,1*ITEMSPACING,Z3LEFTROD,Z3RIGHTROD,true,true,false,false)
	z3shovlute = _standardTrackable(3,2*ITEMSPACING,2*ITEMSPACING,Z3LUTE,Z3SHOV,true,true,false,false)
	z3byrncape = _standardTrackable(3,2*ITEMSPACING,3*ITEMSPACING,Z3CAPE,Z3BYRN,true,true,false,false)
	z3mushder = _standardTrackable(3,3*ITEMSPACING,0*ITEMSPACING,Z3MUSH,Z3DER,true,true,false,false)
	z3dpkeys = _standardTrackable(6,5*ITEMSPACING-1,0*ITEMSPACING+16,Z31KEY,null,false,true,false,true,16,16)
	z3tohkeys = _standardTrackable(6,5*ITEMSPACING-1,1*ITEMSPACING,Z31KEY,null,false,true,false,true,16,16)
	z3podkeys = _standardTrackable(6,5*ITEMSPACING-1,2*ITEMSPACING,Z36KEY,null,false,true,false,true,16,16)
	z3spkeys = _standardTrackable(6,5*ITEMSPACING-1,2*ITEMSPACING+16,Z31KEY,null,false,true,false,true,16,16)
	z3swkeys = _standardTrackable(6,5*ITEMSPACING-1,3*ITEMSPACING,Z33KEY,null,false,true,false,true,16,16)
	z3ttkeys = _standardTrackable(6,5*ITEMSPACING-1,3*ITEMSPACING+16,Z31KEY,null,false,true,false,true,16,16)
	z3ipkeys = _standardTrackable(6,5*ITEMSPACING-1,4*ITEMSPACING,Z32KEY,null,false,true,false,true,16,16)
	z3mmkeys = _standardTrackable(6,5*ITEMSPACING-1,4*ITEMSPACING+16,Z33KEY,null,false,true,false,true,16,16)
	z3trkeys = _standardTrackable(6,5*ITEMSPACING-1,5*ITEMSPACING,Z34KEY,null,false,true,false,true,16,16)
	z3gtkeys = _standardTrackable(6,5*ITEMSPACING-1,5*ITEMSPACING+16,Z34KEY,null,false,true,false,true,16,16)
	z3epbk = _standardTrackable(6,5*ITEMSPACING+16,0*ITEMSPACING,Z3BIGKEY,null,true,true,true,false,16,16)
	z3dpbk = _standardTrackable(6,5*ITEMSPACING+16,0*ITEMSPACING+16,Z3BIGKEY,null,true,true,true,false,16,16)
	z3tohbk = _standardTrackable(6,5*ITEMSPACING+16,1*ITEMSPACING,Z3BIGKEY,null,true,true,true,false,16,16)
	z3podbk = _standardTrackable(6,5*ITEMSPACING+16,2*ITEMSPACING,Z3BIGKEY,null,true,true,true,false,16,16)
	z3spbk = _standardTrackable(6,5*ITEMSPACING+16,2*ITEMSPACING+16,Z3BIGKEY,null,true,true,true,false,16,16)
	z3swbk = _standardTrackable(6,5*ITEMSPACING+16,3*ITEMSPACING,Z3BIGKEY,null,true,true,true,false,16,16)
	z3ttbk = _standardTrackable(6,5*ITEMSPACING+16,3*ITEMSPACING+16,Z3BIGKEY,null,true,true,true,false,16,16)
	z3ipbk = _standardTrackable(6,5*ITEMSPACING+16,4*ITEMSPACING,Z3BIGKEY,null,true,true,true,false,16,16)
	z3mmbk = _standardTrackable(6,5*ITEMSPACING+16,4*ITEMSPACING+16,Z3BIGKEY,null,true,true,true,false,16,16)
	z3trbk = _standardTrackable(6,5*ITEMSPACING+16,5*ITEMSPACING,Z3BIGKEY,null,true,true,true,false,16,16)
	z3gtbk = _standardTrackable(6,5*ITEMSPACING+16,5*ITEMSPACING+16,Z3BIGKEY,null,true,true,true,false,16,16)
	z3gtreq = _DoubleImageTrackable(3,3*ITEMSPACING,5*ITEMSPACING,Z3GTREQ,Z3GOALCOUNTER)
	z3ganonreq = _DoubleImageTrackable(3,4*ITEMSPACING,5*ITEMSPACING,Z3GANONREQ,Z3GOALCOUNTER)
	
	# Super Metroid Trackables
	smcharge = _standardTrackable(4,0*ITEMSPACING,0*ITEMSPACING,SMCHARGE)
	smmorph = _standardTrackable(4,1*ITEMSPACING,0*ITEMSPACING,SMMORPH, SMBOMBS,true,true,false,false)
	smspring = _standardTrackable(4,2*ITEMSPACING,0*ITEMSPACING,SMSPRING)
	smscrew = _standardTrackable(4,3*ITEMSPACING,0*ITEMSPACING,SMSCREW)
	smice = _standardTrackable(4,0*ITEMSPACING,1*ITEMSPACING,SMICE)
	smhijump = _standardTrackable(4,1*ITEMSPACING,1*ITEMSPACING,SMHIJUMP)
	smspeed = _standardTrackable(4,2*ITEMSPACING,1*ITEMSPACING,SMSPEED)
	smspace = _standardTrackable(4,3*ITEMSPACING,1*ITEMSPACING,SMSPACE)
	smwave = _standardTrackable(4,0*ITEMSPACING,2*ITEMSPACING,SMWAVE)
	smvaria = _standardTrackable(4,1*ITEMSPACING,2*ITEMSPACING,SMVARIA)
	smgrapple = _standardTrackable(9,2*ITEMSPACING,2*ITEMSPACING,SMGRAPPLE)
	smxray = _standardTrackable(9,3*ITEMSPACING,2*ITEMSPACING,SMXRAY)
	smspazer = _standardTrackable(9,0*ITEMSPACING,3*ITEMSPACING,SMSPAZER)
	smgravity = _standardTrackable(4,1*ITEMSPACING,3*ITEMSPACING,SMGRAVITY)
	smkraid = _standardTrackable(9,2*ITEMSPACING,3*ITEMSPACING,SMKRAID)
	smphantoon = _standardTrackable(9,3*ITEMSPACING,3*ITEMSPACING,SMPHANTOON)
	smplasma = _standardTrackable(9,0*ITEMSPACING,4*ITEMSPACING,SMPLASMA)
	smg4req = _DoubleImageTrackable(4,1*ITEMSPACING,4*ITEMSPACING,SMG4REQ,SMGOALCOUNTER)
	smdraygon = _standardTrackable(9,2*ITEMSPACING,4*ITEMSPACING,SMDRAYGON)
	smridley = _standardTrackable(9,3*ITEMSPACING,4*ITEMSPACING,SMRIDLEY)
	smkraid.stage = 1
	smphantoon.stage = 1
	smdraygon.stage = 1
	smridley.stage = 1
	smkraid.updateIcon()
	smphantoon.updateIcon()
	smdraygon.updateIcon()
	smridley.updateIcon()
	
	smlittleCR = _standardTrackable(8,2*ITEMSPACING, 2*ITEMSPACING, SMlittleCR,null,true,true,true,true,18,16)
	smCR1 = _standardTrackable(8,3*ITEMSPACING,2*ITEMSPACING,SMFIRSTKEY,null,true,true,true,true,10,16)
	smCR2 = _standardTrackable(8,3*ITEMSPACING+11,2*ITEMSPACING,SMSECONDKEY,null,true,true,true,true,10,16)
	smCRboss = _standardTrackable(8,3*ITEMSPACING+22,2*ITEMSPACING,SMBOSSKEY,null,true,true,true,true,10,16)
	smlittleBR = _standardTrackable(8,2*ITEMSPACING, 2*ITEMSPACING+16, SMlittleBR, SMlittlePRIZE,true,true,true,false,32,16,SMNOPRIZE)
	smBR1 = _standardTrackable(8,3*ITEMSPACING,2*ITEMSPACING+16,SMFIRSTKEY,null,true,true,true,true,10,16)
	smBR2 = _standardTrackable(8,3*ITEMSPACING+11,2*ITEMSPACING+16,SMSECONDKEY,null,true,true,true,true,10,16)
	smBRboss = _standardTrackable(8,3*ITEMSPACING+22,2*ITEMSPACING+16,SMBOSSKEY,null,true,true,true,true,10,16)
	smlittleUN = _standardTrackable(8,2*ITEMSPACING, 3*ITEMSPACING, SMlittleUN,null,true,true,true,true,18,16)
	smUN1 = _standardTrackable(8,3*ITEMSPACING,3*ITEMSPACING,SMFIRSTKEY,null,true,true,true,true,10,16)
	smUN2 = _standardTrackable(8,3*ITEMSPACING+11,3*ITEMSPACING,SMSECONDKEY,null,true,true,true,true,10,16)
	smUNboss = _standardTrackable(8,3*ITEMSPACING+22,3*ITEMSPACING,SMBOSSKEY,null,true,true,true,true,10,16)
	smlittleMD = _standardTrackable(8,2*ITEMSPACING, 3*ITEMSPACING+16, SMlittleMD, SMlittlePRIZE,true,true,true,false,32,16,SMNOPRIZE)
	smMD1 = _standardTrackable(8,3*ITEMSPACING,3*ITEMSPACING+16,SMFIRSTKEY,null,true,true,true,true,10,16)
	smMD2 = _standardTrackable(8,3*ITEMSPACING+11,3*ITEMSPACING+16,SMSECONDKEY,null,true,true,true,true,10,16)
	smMDboss = _standardTrackable(8,3*ITEMSPACING+22,3*ITEMSPACING+16,SMBOSSKEY,null,true,true,true,true,10,16)
	smlittleWS = _standardTrackable(8,2*ITEMSPACING, 4*ITEMSPACING, SMlittleWS, SMlittlePRIZE,true,true,true,false,32,16,SMNOPRIZE)
	smWS1 = _standardTrackable(8,3*ITEMSPACING,4*ITEMSPACING,SMFIRSTKEY,null,true,true,true,true,10,16)
	smWSboss = _standardTrackable(8,3*ITEMSPACING+22,4*ITEMSPACING,SMBOSSKEY,null,true,true,true,true,10,16)
	smlittleLN = _standardTrackable(8,2*ITEMSPACING, 4*ITEMSPACING+16, SMlittleLN, SMlittlePRIZE,true,true,true,false,32,16,SMNOPRIZE)
	smLN1 = _standardTrackable(8,3*ITEMSPACING,4*ITEMSPACING+16,SMFIRSTKEY,null,true,true,true,true,10,16)
	smLNboss = _standardTrackable(8,3*ITEMSPACING+22,4*ITEMSPACING+16,SMBOSSKEY,null,true,true,true,true,10,16)
	smspazma = _standardTrackable(8,0*ITEMSPACING,3*ITEMSPACING, SMHALFSPAZ, SMHALFPLAS, true, true, false, false)
	smgrapray = _standardTrackable(8,0*ITEMSPACING,4*ITEMSPACING, SMHALFGRAPPLE, SMHALFXRAY, true, true, false, false)
	smsuits = _standardTrackable(8,7*ITEMSPACING,7*ITEMSPACING, SMHALFVARIA, SMHALFGRAV, true, true, false, false)
		
	# Bosses
	z1ganon = _standardTrackable(5,0*ITEMSPACING,0,Z1GANON)
	m1mb = _standardTrackable(5,1*ITEMSPACING,0,M1MB)
	z3ganon = _standardTrackable(5,2*ITEMSPACING,0,Z3GANON)
	smmb = _standardTrackable(5,3*ITEMSPACING,0,SMMB)
	

func _on_close_requested():
	self.hide()

func _DoubleImageTrackable(type, x, y, leftTexture, rightTextures):
	var trackable = DoubleImageTrackable.new(x,y,leftTexture,rightTextures)
	if type == 1:
		z1.add_child(trackable)
	elif type == 2:
		m1.add_child(trackable)
	elif type == 3:
		z3.add_child(trackable)
	elif type == 4:
		sm.add_child(trackable)
	elif type == 5:
		boss_block.add_child(trackable)
	elif type == 6:
		z3keys.add_child(trackable)
	elif type == 7:
		z3keys.add_child(trackable)
	elif type == 8:
		smkeys.add_child(trackable)
	elif type == 9:
		smkeys.add_child(trackable)
	return trackable

func _standardTrackable(type,x,y,leftTextures,rightTextures = null,bool1 = true,bool2 = true,bool3 = true, bool4 = true, sizeX = 32, sizeY = 32, bonusTextures = null):
	var trackable = StandardTrackable.new(x,y,leftTextures,rightTextures,bool1,bool2,bool3,bool4,sizeX,sizeY,bonusTextures)
	if type == 1:
		z1.add_child(trackable)
	elif type == 2:
		m1.add_child(trackable)
	elif type == 3:
		z3.add_child(trackable)
	elif type == 4:
		sm.add_child(trackable)
	elif type == 5:
		boss_block.add_child(trackable)
	elif type == 6:
		z3keys.add_child(trackable)
	elif type == 7:
		z3keys.add_child(trackable)
	elif type == 8:
		smkeys.add_child(trackable)
	elif type == 9:
		smkeys.add_child(trackable)
	return trackable

func change_keys(id):
	keys[id] = !keys[id]
	set_keys()
	if id == 3:
		swap_Z3Keys()
	elif id == 4:
		swap_SMkeys()

func _on_color_picker_button_color_changed(color):
	$ColorRect.color = color

func set_m1z1():
	z1.position = Vector2(4,4)
	m1.position = Vector2(4,4)
	boss_block.position = Vector2(4,4)
	z1.show();	z1ganon.show()
	m1.show();	m1mb.show()
	z3.hide();	z3ganon.hide()
	sm.hide();	smmb.hide()
	
	itemgrid([[m1morph,m1bombs,z1tri1,z1tri2,z1sword,z1candles],
		[m1long,m1ice,z1tri3,z1tri4,z1bow,z1recorder],
		[m1wave,m1varia,z1tri5,z1tri6,z1wand,z1bracelet],
		[m1jump,m1screw,z1tri7,z1tri8,z1ladder,z1raft],
		[m1kraid,m1ridley,m1mb,z1ganon,z1lv9req,z1key]])
	tracker_size(6,5)

func set_smz3():
	hide_all()
	z3.position = Vector2(4,4)
	sm.position = Vector2(4,4)
	boss_block.position = Vector2(4,4)
	z1.hide();	z1ganon.hide()
	m1.hide();	m1mb.hide()
	z3.show();	z3ganon.show(); z3keys.show()
	sm.show();	smmb.show(); smkeys.show()

	itemgrid([[smcharge,smmorph,smspring,z3bow,z3boom,z3hook,z3mushder,z3boots],
		[smice,smhijump,smspeed,z3frods,z3bombos,z3ether,z3quake,z3gloves],
		[smwave,smspace,smscrew,z3lamp,z3hammer,z3shovlute,z3book,z3flippers],
		[smspazma,smvaria,smgravity,z3bottle,z3somaria,z3byrncape,z3mirror,z3pearl],
		[smxray,smgrapple,smg4req,z3sword,z3net,z3ep,z3dp,z3toh],
		[smkraid,smphantoon,smmb,z3gtreq,z3aga,z3pod,z3sp,z3sw],
		[smdraygon,smridley,z3ganon,z3ganonreq,z3tt,z3ip,z3mm,z3tr]])
	tracker_size(8,7)

func set_metroids():
	hide_all()
	m1.position = Vector2(4,4)
	sm.position = Vector2(4,4)
	boss_block.position = Vector2(4,4)
	z1.hide();	z1ganon.hide()
	m1.show();	m1mb.show()
	z3.hide();	z3ganon.hide()
	sm.show();	smmb.show(); smkeys.show()

	itemgrid([[m1morph,m1bombs,smcharge,smmorph,smspring,smhijump],
		[m1long,m1ice,smice,smspeed,smspace,smscrew],
		[m1wave,m1varia,smwave,smvaria,smkraid,smphantoon],
		[m1jump,m1screw,smspazer,smgravity,smdraygon,smridley],
		[m1kraid,m1ridley,smplasma,smg4req,m1mb,smmb]])
	tracker_size(6,5)

func set_zeldas():
	hide_all()
	z1.position = Vector2(4,4)
	z3.position = Vector2(4,4)
	boss_block.position = Vector2(4,4)
	z1.show();	z1ganon.show()
	m1.hide();	m1mb.hide()
	z3.show();	z3ganon.show(); z3keys.show()
	sm.hide();	smmb.hide()

	itemgrid([[z1sword,z1candles,z1bow,z3bow,z3boom,z3hook,z3mushder,z3boots],
		[z1wand,z1boom,z1recorder,z3frods, z3bombos, z3ether, z3quake, z3gloves],
		[z1bracelet,z1ladder,z1raft,z3lamp,z3hammer,z3shovlute,z3book,z3flippers],
		[z1tri1,z1tri2,z1key,z3bottle,z3somaria,z3byrncape,z3mirror,z3pearl],
		[z1tri3,z1tri4,z1lv9req,z3sword,z3net,z3ep,z3dp,z3toh],
		[z1tri5,z1tri6,z1ganon,z3gtreq,z3aga,z3pod,z3sp,z3sw],
		[z1tri7,z1tri8,z3ganon,z3ganonreq,z3tt,z3ip,z3mm,z3tr]])
	tracker_size(8,7)

func set_noSM():
	hide_all()
	z1.position = Vector2(4,4)
	m1.position = Vector2(4,4)
	z3.position = Vector2(4,4)
	boss_block.position = Vector2(4,4)
	z1.show();	z1ganon.show()
	m1.show();	m1mb.show()
	z3.show();	z3ganon.show(); z3keys.show()
	sm.hide();	smmb.hide()

	itemgrid([[m1morph,m1bombs,m1jump,m1varia,z3bow,z3boom,z3hook,z3mush,z3powder],
		[m1long,m1ice,m1wave,m1screw,z3frod,z3irod,z3bombos,z3ether,z3quake],
		[z1sword,z1boom,z1candles,z1bow,z3lamp,z3hammer,z3flute,z3shovel,z3book],
		[z1recorder,z1wand,z1bait,z1bracelet,z3bottle,z3somaria,z3byrna,z3cape,z3mirror],
		[z1ladder,z1raft,z1key,z1lv9req,z3sword,z3boots,z3gloves,z3flippers,z3pearl],
		[z1tri1,z1tri2,z1tri3,z1tri4,z3gtreq,z3net,z3ep,z3dp,z3toh],
		[z1tri5,z1tri6,z1tri7,z1tri8,z3ganonreq,z3aga,z3pod,z3sp,z3sw],
		[z1ganon,m1kraid,m1ridley,m1mb,z3ganon,z3tt,z3ip,z3mm,z3tr]])
	tracker_size(9,8)

func set_noZ3():
	hide_all()
	z1.position = Vector2(4,4)
	m1.position = Vector2(4,4)
	sm.position = Vector2(4,4)
	boss_block.position = Vector2(4,4)
	z1.show();	z1ganon.show()
	m1.show();	m1mb.show()
	z3.hide();	z3ganon.hide()
	sm.show();	smmb.show(); smkeys.show()

	itemgrid([[m1morph,m1bombs,m1jump,m1varia,m1kraid,z1sword,z1boom,z1candles],
		[m1long,m1ice,m1wave,m1screw,m1ridley,z1bow,z1recorder,z1wand],
		[smcharge,smmorph,smspring,smscrew,z1bracelet,z1ladder,z1raft,z1key],
		[smice,smhijump,smspeed,smspace,z1bait,z1book,z1ring,z1letter],
		[smwave,smvaria,smgrapple,smxray,z1tri1,z1tri2,z1tri3,z1tri4],
		[smspazer,smgravity,smkraid,smphantoon,z1tri5,z1tri6,z1tri7,z1tri8],
		[smplasma,smg4req,smdraygon,smridley,z1lv9req,z1ganon,m1mb,smmb]])
	tracker_size(8,7)

func set_noM1():
	hide_all()
	z1.position = Vector2(4,4)
	z3.position = Vector2(4,4)
	sm.position = Vector2(4,4)
	boss_block.position = Vector2(4,4)
	z1.show();	z1ganon.show()
	m1.hide();	m1mb.hide()
	z3.show();	z3ganon.show(); z3keys.show()
	sm.show();	smmb.show(); smkeys.show()

	itemgrid([[smcharge,smmorph,smspring,smscrew,z3bow,z3boom,z3hook,z3mush,z3powder],
		[smice,smhijump,smspeed,smspace,z3frod,z3irod,z3bombos,z3ether,z3quake],
		[smwave,smvaria,smgrapple,smxray,z3lamp,z3hammer,z3flute,z3shovel,z3book],
		[smspazer,smgravity,smkraid,smphantoon,z3bottle,z3somaria,z3byrna,z3cape,z3mirror],
		[smplasma,smg4req,smdraygon,smridley,z3sword,z3boots,z3gloves,z3flippers,z3pearl],
		[z1tri1,z1tri2,z1tri3,z1tri4,z3gtreq,z3net,z3ep,z3dp,z3toh],
		[z1tri5,z1tri6,z1tri7,z1tri8,z3ganonreq,z3aga,z3pod,z3sp,z3sw],
		[z1sword,z1boom,z1candles,z1bow,z1recorder,z3tt,z3ip,z3mm,z3tr],
		[z1wand,z1bracelet,z1ladder,z1raft,z1key,z1lv9req,z1ganon,smmb,z3ganon]])
	tracker_size(9,9)

func set_noZ1():
	hide_all()
	m1.position = Vector2(4,4)
	z3.position = Vector2(4,4)
	sm.position = Vector2(4,4)
	boss_block.position = Vector2(4,4)
	z1.hide();	z1ganon.hide()
	m1.show();	m1mb.show()
	z3.show();	z3ganon.show(); z3keys.show()
	sm.show();	smmb.show(); smkeys.show()

	itemgrid([[m1morph,m1bombs,m1jump,m1varia,z3bow,z3boom,z3hook,z3mush,z3powder],
		[m1long,m1ice,m1wave,m1screw,z3frod,z3irod,z3bombos,z3ether,z3quake],
		[smcharge,smmorph,smspring,smscrew,z3lamp,z3hammer,z3flute,z3shovel,z3book],
		[smice,smhijump,smspeed,smspace,z3bottle,z3somaria,z3byrna,z3cape,z3mirror],
		[smwave,smvaria,smgrapple,smxray,z3sword,z3boots,z3gloves,z3flippers,z3pearl],
		[smspazer,smgravity,smkraid,smphantoon,z3gtreq,z3net,z3ep,z3dp,z3toh],
		[smplasma,smg4req,smdraygon,smridley,z3ganonreq,z3aga,z3pod,z3sp,z3sw],
		[m1kraid,m1ridley,m1mb,smmb,z3ganon,z3tt,z3ip,z3mm,z3tr]])
	tracker_size(9,8)

func set_quad():
	hide_all()
	quad_background.show()
	z1.position = Vector2(13,6)
	m1.position = Vector2(13,83)
	z3.position = Vector2(13,126)
	sm.position = Vector2(227,126)
	boss_block.position = Vector2(227,301)
	z1.show();	z1ganon.show()
	m1.show();	m1mb.show()
	z3.show();	z3ganon.show(); z3keys.show()
	sm.show();	smmb.show(); smkeys.show()

	itemgrid([[z1sword,z1boom,z1candles,z1bow,z1recorder,z1lv9req],
		[z1wand,z1bait,z1bracelet,z1ladder,z1raft,z1key]])
	itemgrid([[z1tri1,z1tri2,z1tri3,z1tri4],
		[z1tri5,z1tri6,z1tri7,z1tri8]],6.1,0)
	itemgrid([[m1morph,m1bombs,m1long,m1ice,m1wave,m1varia]])
	itemgrid([[m1jump,m1screw,m1kraid,m1ridley]],6.1,0)
	itemgrid([[z3bow,z3boom,z3hook,z3mush,z3powder],
		[z3frod,z3irod,z3bombos,z3ether,z3quake],
		[z3lamp,z3hammer,z3flute,z3shovel,z3book],
		[z3bottle,z3somaria,z3byrna,z3cape,z3mirror],
		[z3boots,z3gloves,z3flippers,z3pearl,z3net],
		[z3sword,z3shield,z3magic,z3gtreq,z3ganonreq,z3aga]])
	itemgrid([[z3littleep],[z3littletoh],[z3littlesp],[z3littlett],[z3littlemm]],5,0)
	itemgrid([[z3littledp],[z3littlepod],[z3littlesw],[z3littleip],[z3littletr]],5,0.17)
	itemgrid([[smcharge, smmorph, smspring, smscrew],
		[smice, smhijump, smspeed, smspace],
		[smwave, smvaria, smgrapple, smxray],
		[smspazer, smgravity, smkraid, smphantoon],
		[smplasma, smg4req, smdraygon, smridley]])
	itemgrid([[z1ganon, m1mb, z3ganon, smmb]])
	tracker_size(10,9,26,28)

func itemgrid(grid, baseX = 0, baseY = 0):
	var y = baseY
	for row in grid:
		var x = baseX
		for item in row:
			itemspace(item, x, y)
			x = x+1
		y = y+1

func itemspace(item, x, y):
	var newX = floor(x) * ITEMSPACING + (x - floor(x))*100
	var newY = floor(y) * ITEMSPACING + (y - floor(y))*100
	item.position = Vector2(newX,newY)
	item.show()

func tracker_size(x,y,xboost = 0, yboost = 0):
	self.size = Vector2i(x*ITEMSPACING+6+xboost, y*ITEMSPACING+6+yboost)
	self.content_scale_size = self.size

func hide_all():
	for n in backgrounds.get_children():
		n.hide()
	for n in z1.get_children():
		n.hide()
	for n in m1.get_children():
		n.hide()
	for n in z3.get_children():
		n.hide()
	for n in sm.get_children():
		n.hide()
	for n in z3keys.get_children():
		n.hide()
	for n in smkeys.get_children():
		n.hide()

func toggle_game(id):
	games[id] = !games[id]
	
	if games[1] and games[2] and games[3] and games[4]:
		set_quad()
		fix_quadZ3()
	elif games[1] and games[2] and games[3] and !games[4]:
		if id == 4:
			fix_quadZ3(true)
		set_noSM()
	elif games[1] and games[2] and !games[3] and games[4]:
		if id == 3:
			fix_quadZ3(true)
		set_noZ3()
	elif games[1] and !games[2] and games[3] and games[4]:
		if id == 2:
			fix_quadZ3(true)
		set_noM1()
	elif !games[1] and games[2] and games[3] and games[4]:
		if id == 1:
			fix_quadZ3(true)
		set_noZ1()
	elif games[1] and games[2] and !games[3] and !games[4]:
		set_m1z1()
	elif !games[1] and games[2] and !games[3] and games[4]:
		set_metroids()
		fix_metroids()
	elif games[1] and !games[2] and games[3] and !games[4]:
		set_zeldas()
		fix_zeldas()
	elif !games[1] and !games[2] and games[3] and games[4]:
		set_smz3()
		fix_smz3()
	if was_games(id) == "metroids":
		fix_metroids(true)
	if was_games(id) == "zeldas":
		fix_zeldas(true)
	if was_games(id) == "smz3":
		fix_smz3(true)
	
	set_keys()
	# Z1SM and M1Z3 arent supported, neither are any single game tracker
	# Total please dont make Z2

func was_games(id):
	var pastGames = [false,false,false,false,false]
	pastGames[1] = games[1]
	pastGames[2] = games[2]
	pastGames[3] = games[3]
	pastGames[4] = games[4]
	pastGames[id] = !pastGames[id]
	if !pastGames[1] and !pastGames[2] and pastGames[3] and pastGames[4]:
		return "smz3"
	elif !pastGames[1] and pastGames[2] and !pastGames[3] and pastGames[4]:
		return "metroids"
	elif pastGames[1] and !pastGames[2] and pastGames[3] and !pastGames[4]:
		return "zeldas"
	elif pastGames[1] and pastGames[2] and pastGames[3] and pastGames[4]:
		return "quad"
	return "nothing"

func fix_quadZ3(reverse = false):
	if keys[3]:
		merge_stages(z3mushder, z3mush, z3powder, reverse)
		merge_stages(z3frods, z3frod, z3irod, reverse)
		merge_stages(z3shovlute, z3flute, z3shovel, reverse)
		merge_stages(z3byrncape, z3byrna, z3cape, reverse)
	else:
		swap_stages(z3littleep, z3ep, reverse)
		swap_stages(z3littledp, z3dp, reverse)
		swap_stages(z3littletoh, z3toh, reverse)
		swap_stages(z3littlepod, z3pod, reverse)
		swap_stages(z3littlesp, z3sp, reverse)
		swap_stages(z3littlesw, z3sw, reverse)
		swap_stages(z3littlett, z3tt, reverse)
		swap_stages(z3littleip, z3ip, reverse)
		swap_stages(z3littlemm, z3mm, reverse)
		swap_stages(z3littletr, z3tr, reverse)

func fix_metroids(reverse = false):
	if keys[4]:
		merge_stages(smsuits, smvaria, smgravity, reverse)

func fix_zeldas(reverse = false):
	merge_stages(z3frods, z3frod, z3irod, reverse)
	merge_stages(z3byrncape, z3cape, z3byrna, reverse)
	merge_stages(z3shovlute, z3flute, z3shovel, reverse)

func fix_smz3(reverse = false):
	merge_stages(smspazma, smspazer, smplasma, reverse)
	merge_stages(z3frods, z3frod, z3irod, reverse)
	merge_stages(z3byrncape, z3cape, z3byrna, reverse)
	merge_stages(z3shovlute, z3flute, z3shovel, reverse)
	merge_stages(z3mushder, z3mush, z3powder, reverse)

func set_keys():
	if games[3]:
		if keys[3]:
			set_Z3Keys()
		else:
			set_Z3nonKeys()
	if games[4]:
		if keys[4]:
			set_SMKeys()
		else:
			set_SMnonKeys()

func hide_Z3Keys():
	for n in z3keys.get_children():
		n.hide()

func hide_SMKeys():
	for n in smkeys.get_children():
		n.hide()

func set_Z3Keys():
	var x = 4
	var y = 0
	hide_Z3Keys()
	if !games[1] or !games[2] or !games[3] or !games[4]:
		x = floor(z3net.position.x / ITEMSPACING) + (fmod(z3net.position.x, ITEMSPACING) / 100)
		y = floor(z3net.position.y / ITEMSPACING) + (fmod(z3net.position.y, ITEMSPACING) / 100)
		itemspace(z3littleep, x, y)
		itemspace(z3epbk, x+1.16, y)
		itemspace(z3littledp, x+2, y)
		itemspace(z3dpkeys, x+3, y)
		itemspace(z3dpbk, x+3.16, y)
		itemspace(z3littletoh, x, y+0.16)
		itemspace(z3tohkeys, x+1, y+0.16)
		itemspace(z3tohbk, x+1.16, y+0.16)
		itemspace(z3hc, x+2, y+0.16)
		itemspace(z3hckeys, x+2.16, y+0.16)
		itemspace(z3at, x+3, y+0.16)
		itemspace(z3atkeys, x+3.16, y+0.16)
		itemspace(z3littlepod, x, y+1)
		itemspace(z3podkeys, x+1, y+1)
		itemspace(z3podbk, x+1.16, y+1)
		itemspace(z3littlesp, x+2, y+1)
		itemspace(z3spkeys, x+3, y+1)
		itemspace(z3spbk, x+3.16, y+1)
		itemspace(z3littlesw, x, y+1.16)
		itemspace(z3swkeys, x+1, y+1.16)
		itemspace(z3swbk, x+1.16, y+1.16)
		itemspace(z3littlett, x+2, y+1.16)
		itemspace(z3ttkeys, x+3, y+1.16)
		itemspace(z3ttbk, x+3.16, y+1.16)
		itemspace(z3littleip, x, y+2)
		itemspace(z3ipkeys, x+1, y+2)
		itemspace(z3ipbk, x+1.16, y+2)
		itemspace(z3littlemm, x+2, y+2)
		itemspace(z3mmkeys, x+3, y+2)
		itemspace(z3mmbk, x+3.16, y+2)
		itemspace(z3littletr, x, y+2.16)
		itemspace(z3trkeys, x+1, y+2.16)
		itemspace(z3trbk, x+1.16, y+2.16)
		itemspace(z3gt, x+2, y+2.16)
		itemspace(z3gtkeys, x+3, y+2.16)
		itemspace(z3gtbk, x+3.16, y+2.16)
	else:
		itemspace(z3littleep, x, y)
		itemspace(z3epbk, x+1.16, y)
		itemspace(z3littledp, x, y+0.16)
		itemspace(z3dpkeys, x+1, y+0.16)
		itemspace(z3dpbk, x+1.16, y+0.16)
		itemspace(z3littletoh, x, y+1)
		itemspace(z3tohkeys, x+1, y+1)
		itemspace(z3tohbk, x+1.16, y+1)
		itemspace(z3hc, x, y+1.16)
		itemspace(z3hckeys, x+0.16, y+1.16)
		itemspace(z3at, x+1, y+1.16)
		itemspace(z3atkeys, x+1.16, y+1.16)
		itemspace(z3littlepod, x, y+2)
		itemspace(z3podkeys, x+1, y+2)
		itemspace(z3podbk, x+1.16, y+2)
		itemspace(z3littlesp, x, y+2.16)
		itemspace(z3spkeys, x+1, y+2.16)
		itemspace(z3spbk, x+1.16, y+2.16)
		itemspace(z3littlesw, x, y+3)
		itemspace(z3swkeys, x+1, y+3)
		itemspace(z3swbk, x+1.16, y+3)
		itemspace(z3littlett, x, y+3.16)
		itemspace(z3ttkeys, x+1, y+3.16)
		itemspace(z3ttbk, x+1.16, y+3.16)
		itemspace(z3littleip, x, y+4)
		itemspace(z3ipkeys, x+1, y+4)
		itemspace(z3ipbk, x+1.16, y+4)
		itemspace(z3littlemm, x, y+4.16)
		itemspace(z3mmkeys, x+1, y+4.16)
		itemspace(z3mmbk, x+1.16, y+4.16)
		itemspace(z3littletr, x, y+5)
		itemspace(z3trkeys, x+1, y+5)
		itemspace(z3trbk, x+1.16, y+5)
		itemspace(z3gt, x, y+5.16)
		itemspace(z3gtkeys, x+1, y+5.16)
		itemspace(z3gtbk, x+1.16, y+5.16)
		z3mush.hide();z3powder.hide()
		itemspace(z3mushder, x-1, y)
		z3frod.hide();z3irod.hide()
		itemspace(z3frods, x-4, y+1)
		itemspace(z3bombos, x-3, y+1)
		itemspace(z3ether, x-2, y+1)
		itemspace(z3quake, x-1, y+1)
		z3shovel.hide();z3flute.hide()
		itemspace(z3shovlute, x-2, y+2)
		itemspace(z3book, x-1, y+2)
		z3byrna.hide();z3cape.hide()
		itemspace(z3byrncape, x-2, y+3)
		itemspace(z3mirror, x-1, y+3)
		itemspace(z3gtreq, x-3, y+5)
		itemspace(z3ganonreq, x-2, y+5)
		itemspace(z3aga, x-1, y+5)

func set_Z3nonKeys():
	var x = 4
	var y = 0
	hide_Z3Keys()
	if games[1] and games[2] and games[3] and games[4]:
		itemspace(z3littleep, x+1, y)
		itemspace(z3littledp, x+1, y+0.16)
		itemspace(z3littletoh, x+1, y+1)
		itemspace(z3littlepod, x+1, y+1.16)
		itemspace(z3littlesp, x+1, y+2)
		itemspace(z3littlesw, x+1, y+2.16)
		itemspace(z3littlett, x+1, y+3)
		itemspace(z3littleip, x+1, y+3.16)
		itemspace(z3littlemm, x+1, y+4)
		itemspace(z3littletr, x+1, y+4.16)
		z3frods.hide()
		z3mushder.hide()
		z3shovlute.hide()
		z3byrncape.hide()
		itemspace(z3mush, x-1, y)
		itemspace(z3powder, x, y)
		itemspace(z3frod, x-4, y+1)
		itemspace(z3irod, x-3, y+1)
		itemspace(z3bombos, x-2, y+1)
		itemspace(z3ether, x-1, y+1)
		itemspace(z3quake, x, y+1)
		itemspace(z3flute, x-2, y+2)
		itemspace(z3shovel, x-1, y+2)
		itemspace(z3book, x, y+2)
		itemspace(z3byrna, x-2, y+3)
		itemspace(z3cape, x-1, y+3)
		itemspace(z3mirror, x, y+3)
		itemspace(z3net, x, y+4)
		itemspace(z3shield, x-3, y+5)
		itemspace(z3magic, x-2, y+5)
		itemspace(z3gtreq, x-1, y+5)
		itemspace(z3ganonreq, x, y+5)
		itemspace(z3aga, x+1, y+5)
	else:
		x = floor(z3net.position.x / ITEMSPACING) + (fmod(z3net.position.x, ITEMSPACING) / 100)
		y = floor(z3net.position.y / ITEMSPACING) + (fmod(z3net.position.y, ITEMSPACING) / 100)
		itemspace(z3net, x, y)
		itemspace(z3ep, x+1, y)
		itemspace(z3dp, x+2, y)
		itemspace(z3toh, x+3, y)
		itemspace(z3aga, x, y+1)
		itemspace(z3pod, x+1, y+1)
		itemspace(z3sp, x+2, y+1)
		itemspace(z3sw, x+3, y+1)
		itemspace(z3tt, x, y+2)
		itemspace(z3ip, x+1, y+2)
		itemspace(z3mm, x+2, y+2)
		itemspace(z3tr, x+3, y+2)

func invert_SMBosses():
	if keys[4]:
		smlittleBR.stage = (smkraid.stage + 1) % 2; smlittleBR.updateIcon()
		smlittleWS.stage = (smphantoon.stage + 1) % 2; smlittleWS.updateIcon()
		smlittleMD.stage = (smdraygon.stage + 1) % 2; smlittleMD.updateIcon()
		smlittleLN.stage = (smridley.stage + 1) % 2; smlittleLN.updateIcon()
	else:
		smkraid.stage = (smlittleBR.stage + 1) % 2; smkraid.updateIcon()
		smphantoon.stage = (smlittleWS.stage + 1) % 2; smphantoon.updateIcon()
		smdraygon.stage = (smlittleMD.stage + 1) % 2; smdraygon.updateIcon()
		smridley.stage = (smlittleLN.stage + 1) % 2; smridley.updateIcon()

func set_SMKeys():
	var smX = floor(smcharge.position.x / ITEMSPACING) + (fmod(smcharge.position.x, ITEMSPACING) / 100)
	var smY = floor(smcharge.position.y / ITEMSPACING) + (fmod(smcharge.position.y, ITEMSPACING) / 100)
	hide_SMKeys()
	itemspace(smspazma, smX, smY+3)
	if !games[1] and !games[2] and games[3] and games[4]:
		smX -= 2
	var anchorY = (smkraid.position.y) / ITEMSPACING
	itemspace(smlittleCR, smX+2, anchorY-1)
	itemspace(smCR1, smX+3, anchorY-1)
	itemspace(smCR2, smX+3.11, anchorY-1)
	itemspace(smCRboss, smX+3.22, anchorY-1)
	itemspace(smlittleBR, smX+2, anchorY-1+0.16)
	itemspace(smBR1, smX+3, anchorY-1+0.16)
	itemspace(smBR2, smX+3.11, anchorY-1+0.16)
	itemspace(smBRboss, smX+3.22, anchorY-1+0.16)
	itemspace(smlittleUN, smX+2, anchorY)
	itemspace(smUN1, smX+3, anchorY)
	itemspace(smUN2, smX+3.11, anchorY)
	itemspace(smUNboss, smX+3.22, anchorY)
	itemspace(smlittleMD, smX+2, anchorY+0.16)
	itemspace(smMD1, smX+3, anchorY+0.16)
	itemspace(smMD2, smX+3.11, anchorY+0.16)
	itemspace(smMDboss, smX+3.22, anchorY+0.16)
	itemspace(smlittleWS, smX+2, anchorY+1)
	itemspace(smWS1, smX+3, anchorY+1)
	itemspace(smWSboss, smX+3.22, anchorY+1)
	itemspace(smlittleLN, smX+2, anchorY+1.16)
	itemspace(smLN1, smX+3, anchorY+1.16)
	itemspace(smLNboss, smX+3.22, anchorY+1.16)
	if !games[1] and !games[3]:
		itemspace(smg4req, smX, smY+4)
		itemspace(smspace, smX+1, smY+2)
		itemspace(smscrew, smX+1, smY+3)
		smvaria.hide();	smgravity.hide();
		itemspace(smsuits, smX+1, smY+4)
	elif (!games[1] and !games[2] and games[3] and games[4]):
		pass
	else:
		itemspace(smgrapray, smX, smY+4)

func set_SMnonKeys():
	var smX = floor(smcharge.position.x / ITEMSPACING) + (fmod(smcharge.position.x, ITEMSPACING) / 100)
	var smY = floor(smcharge.position.y / ITEMSPACING) + (fmod(smcharge.position.y, ITEMSPACING) / 100)
	hide_SMKeys()
	var anchorY = (smkraid.position.y - smcharge.position.y) / ITEMSPACING
	smkraid.show(); smphantoon.show(); smdraygon.show(); smridley.show()
	smplasma.show(); smspazer.show()
	if !games[1] and !games[3]:
		smvaria.show()
		smgravity.show()
		itemspace(smg4req, smX+1, smY+4)
		itemspace(smspace, smX+2, smY+1)
		itemspace(smscrew, smX+3, smY+1)
	else:
		smxray.show(); smgrapple.show()
	if !games[1] and !games[2] and games[3] and games[4]:
		itemspace(smspazma, smX, smY+3)
		smplasma.hide(); smspazer.hide()

func swap_Z3Keys():
	if !games[1] or !games[2] or !games[3] or !games[4]:
		if keys[3]:
			swap_stages(z3littleep, z3ep)
			swap_stages(z3littledp, z3dp)
			swap_stages(z3littletoh, z3toh)
			swap_stages(z3littlepod, z3pod)
			swap_stages(z3littlesp, z3sp)
			swap_stages(z3littlesw, z3sw)
			swap_stages(z3littlett, z3tt)
			swap_stages(z3littleip, z3ip)
			swap_stages(z3littlemm, z3mm)
			swap_stages(z3littletr, z3tr)
		else:
			swap_stages(z3littleep, z3ep, true)
			swap_stages(z3littledp, z3dp, true)
			swap_stages(z3littletoh, z3toh, true)
			swap_stages(z3littlepod, z3pod, true)
			swap_stages(z3littlesp, z3sp, true)
			swap_stages(z3littlesw, z3sw, true)
			swap_stages(z3littlett, z3tt, true)
			swap_stages(z3littleip, z3ip, true)
			swap_stages(z3littlemm, z3mm, true)
			swap_stages(z3littletr, z3tr, true)
	else:
		if keys[3]:
			merge_stages(z3mushder, z3mush, z3powder)
			merge_stages(z3frods, z3frod, z3irod)
			merge_stages(z3shovlute, z3flute, z3shovel)
			merge_stages(z3byrncape, z3byrna, z3cape)
		else:
			merge_stages(z3mushder, z3mush, z3powder, true)
			merge_stages(z3frods, z3frod, z3irod, true)
			merge_stages(z3shovlute, z3flute, z3shovel, true)
			merge_stages(z3byrncape, z3byrna, z3cape, true)

func swap_SMkeys():
	if keys[4]:
		if !games[1] and !games[3]:
			merge_stages(smsuits,smvaria,smgravity)
		if games[1] or games[2]:
			merge_stages(smgrapray, smgrapple, smxray)
		merge_stages(smspazma, smspazer, smplasma)
		swap_stages(smlittleLN, smridley)
		swap_stages(smlittleBR, smkraid)
		swap_stages(smlittleWS, smphantoon)
		swap_stages(smlittleMD, smdraygon)
	else:
		if !games[1] and !games[3]:
			merge_stages(smsuits,smvaria,smgravity, true)
		if games[1] or games[2]:
			merge_stages(smgrapray, smgrapple, smxray, true)
		merge_stages(smspazma, smspazer, smplasma, true)
		swap_stages(smlittleLN, smridley, true)
		swap_stages(smlittleBR, smkraid, true)
		swap_stages(smlittleWS, smphantoon, true)
		swap_stages(smlittleMD, smdraygon, true)
	invert_SMBosses()

func merge_stages(item1, item2, item3, reverse = false):
	if !reverse:
		item1.stage = item2.stage
		item1.badgeStage = item3.stage
		item1.show()
		item1.updateIcon()
	else:
		item2.stage = item1.stage
		item3.stage = item1.badgeStage
		item2.updateIcon()
		item2.show()
		item3.updateIcon()
		item3.show()

func swap_stages(item1, item2, reverse = false):
	if !reverse:
		item1.stage = item2.stage
		item1.badgeStage = item2.badgeStage
		item1.show()
		item1.updateIcon()
	else:
		item2.stage = item1.stage
		item2.badgeStage = item1.badgeStage
		item2.show()
		item2.updateIcon()
