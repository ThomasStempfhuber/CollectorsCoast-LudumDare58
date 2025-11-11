extends Node

var volume = 1

var placing = false

const STARTING_WOOD = 30
const STARTING_PLANKS = 0
const STARTING_STONE = 20
const STARTING_FRUIT = 30
const STARTING_FLAX = 0
const STARTING_SAILS = 0

const STARTING_STORAGE = 40

const WC_STONE_COST = 5
const WC_FRUIT_COST = 10

const SC_WOOD_COST = 10
const SC_FRUIT_COST = 10

const FRF_WOOD_COST = 20
const FRF_STONE_COST = 10

const SM_WOOD_COST = 15
const SM_STONE_COST = 15
const SM_FRUIT_COST = 20

const FF_PLANKS_COST = 15
const FF_STONE_COST = 20
const FF_FRUIT_COST = 30

const SAM_PLANKS_COST = 30
const SAM_STONE_COST = 40
const SAM_FRUIT_COST = 40

const SH_WOOD_COST = 10
const SH_PLANKS_COST = 10
const SH_STONE_COST = 20


const MUS_PLANKS_COST = 40 
const MUS_STONE_COST = 40
const MUS_FRUIT_COST = 20

const HAR_PLANKS_COST = 40
const HAR_STONE_COST = 40
const HAR_SAILS_COST = 5

const LTH_PLANKS_COST = 40
const LTH_STONE_COST = 80
const LTH_FRUIT_COST = 20

const PDS_STONE_COST = 70
const PDS_FRUIT_COST = 20

const SHP_PLANKS_COST = 80 
const SHP_SAILS_COST = 40 
const SHP_FRUIT_COST = 80

const EXP_PLANKS_COST = 50
const EXP_SAILS_COST = 20 
const EXP_FRUIT_COST = 50


var wood = 0
var planks = 0
var stone = 0
var fruit = 0
var flax = 0
var sails = 0

var storage_limit = 0

var museum = false
var pedestals = false
var treasures = 0

var harbours = 0
var ships = 0
var lighthouse = false

var ships_available = 0


var wood_collected = 0
var planks_collected = 0
var stone_collected = 0
var fruit_collected = 0
var flax_collected = 0
var sails_collected = 0

var woodcutters_built = 0
var stonecutters_built = 0
var fruitfarms_built = 0
var sawmills_built = 0
var flaxfarms_built = 0
var sailmakers_built = 0
var storehouses_built = 0

var time_used = 0

func start_game():
	wood = STARTING_WOOD
	planks = STARTING_PLANKS
	stone = STARTING_STONE
	fruit = STARTING_FRUIT
	flax = STARTING_FLAX
	sails = STARTING_SAILS
	
	storage_limit = STARTING_STORAGE
	museum = false
	pedestals = false
	treasures = 0
	harbours = 0
	ships = 0
	lighthouse = false
	ships_available = 0
	
	wood_collected = 0
	planks_collected = 0
	stone_collected = 0
	fruit_collected = 0
	flax_collected = 0
	sails_collected = 0

	woodcutters_built = 0
	stonecutters_built = 0
	fruitfarms_built = 0
	sawmills_built = 0
	flaxfarms_built = 0
	sailmakers_built = 0
	storehouses_built = 0
	
	time_used = 0
	
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func score():
	get_tree().change_scene_to_file("res://scenes/score.tscn")


func main_menu():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func win_game():
	get_tree().change_scene_to_file("res://scenes/end.tscn")
