// login misije
_num = DMS_MissionCount;

/////////////////////////////////////////////
// Za sada ima podršku samo za bandit misije
/////////////////////////////////////////////

_side = "bandit";

////////////////////////////////
// Pozicija misije, tj. markera
////////////////////////////////

_pos = [22628,19658.5,0.966379];

if ([_pos,DMS_StaticMinPlayerDistance] call DMS_fnc_IsPlayerNearby) exitWith {"delay"};

////////////////////////
// Podesi težinu misije
////////////////////////

// Moguće je: "easy", "moderate", "advanced","hardcore"

_difficulty = "hardcore";

//////////////////////////////////////////////////////////////////////
// Definiraj lokacije gdje će se spawnat. Ukljućuje i spawn pojačanja.
//////////////////////////////////////////////////////////////////////

// Ako želis više botova na jednoj lokaciji onda tu lokaciju kopiraj onoliko puta koliko botova želiš spawnat

_AISoldierSpawnLocations =
[
	[23051.8,19374,0],
	[22913.5,19828.3,0.966379],
	[22398.1,19648.6,0.966379],
	[22245.2,19390.1,0.966379],
	[22456.1,19264.3,0.966379],
	[22525.5,19884.9,0.966379],
	[22162,19765,0.965597],
	[22747.6,19471.8,0],
	[22973.2,19547.4,0.966379]
];

//////////////////////////////////////////////////////////////
// Koliko botova treba stvoriti na misiji  // sektor b = 55 + 5
//////////////////////////////////////////////////////////////
_AICount = 55 + (round (random 5));


_group =
[
	_AISoldierSpawnLocations+[_pos,_pos,_pos],
	_AICount,
	_difficulty,
	"specijalci", // klasa botova koji će se spawnat npr. sniper, mg, random
	_side
] call DMS_fnc_SpawnAIGroup_MultiPos;

////////////////////////////
// Spawn lokacije za gunnere
////////////////////////////

_staticGuns =
[
	[
		[22784.7,19963.3,0],  // 1 - zapiši lokaciju svakog u slučaju da treba fix
		[22812.4,19935.7,13.1362], // 2
		[22357.7,19772.8,0],  // 3
		[22363.9,19700.2,0],   // 4
		[22409,19665.5,5.12149], //5
		[22504.1,19514.8,18.6364], //6
		[22453,19451,6.01074], // 7
		[22766.8,19633.9,0], //8
		[22902.9,19869,12.6954], //9
		[23024.6,19609.7,0] //10
	],
	_group,
	"specijalci",
	_difficulty,
	"bandit",
	"random"
] call DMS_fnc_SpawnAIStaticMG;


///////////////////////////////
// Spawnanje kutija i pozicije
///////////////////////////////

_crateClasses_and_Positions =
[
	// Klase kutija i pozicije za mogući spawn (spawna 3 od trenutnih 6)
	//- Exile_Container_SupplyBox - plp_ct_WoodBoxLightHuge
	[[22777.1,19834,0],"Exile_Container_SupplyBox"], 
	[[22499.3,20063.8,0],"Exile_Container_SupplyBox"],
	[[22162.7,19850,0],"Exile_Container_SupplyBox"],
	[[22458.4,19484.4,0],"Exile_Container_SupplyBox"],
	[[22353.4,19797.6,0],"Exile_Container_SupplyBox"],
	[[22759.6,19638.7,0],"Exile_Container_SupplyBox"]
];

{
	deleteVehicle (nearestObject _x);		// Pobrini se da ukloniš prijašnje kutije prije nego spawnaš novu misiju.
} forEach _crateClasses_and_Positions;

// Nasumični izbor kutija na pozicijama za spawn
_crateClasses_and_Positions = _crateClasses_and_Positions call ExileClient_util_array_shuffle;


// Stvori Kutije
_crate0 = [_crateClasses_and_Positions select 0 select 1, _crateClasses_and_Positions select 0 select 0] call DMS_fnc_SpawnCrate;
_crate1 = [_crateClasses_and_Positions select 1 select 1, _crateClasses_and_Positions select 1 select 0] call DMS_fnc_SpawnCrate;
_crate2 = [_crateClasses_and_Positions select 2 select 1, _crateClasses_and_Positions select 2 select 0] call DMS_fnc_SpawnCrate;

// onesposobi dim na kutijama tako da ih igrači moraju tražiti
{
	_x setVariable ["DMS_AllowSmoke", true];
} forEach [_crate0,_crate1,_crate2];

/*
// Spawnanje vozila sa gunnerom. Nije prikladno za sektor B pa je zakomentirano ovako da ne koristi.
_veh =
[
	[
		[_pos,100,random 360] call DMS_fnc_SelectOffsetPos,
		_pos
	],
	_group,
	"specijalci",
	_difficulty,
	_side
] call DMS_fnc_SpawnAIVehicle;
*/


// Definiramo botove na misiji ovdje
_missionAIUnits =
[
	_group 		// Spawnamo samo jednu grupu botova
];

// Definiraj grupu koja dolazi kao pojačanje
_groupReinforcementsInfo =
[
	[
		_group,			
		[
			[
				-1,		// limit botova...
				0
			],
			[
				////////////////////////////
				// Broj botova kao pojačanje
				////////////////////////////

				5,	// Maximum od 100 botova može biti kao pojačanje.
				0
			]
		],
		[
			240,		// Sekundi između spawnanja pojačanja
			diag_tickTime
		],
		_AISoldierSpawnLocations,
		"specijalci", // bilo random, al napravio sam novu klasu botova ("specijalci") u configu( Nose crno i snipere, treba ih ograniciti da nose samo slabije snipere)
		_difficulty,
		_side,
		"reinforce",
		[
			10,			// Koliko botova mora biti živo da bi aktiviralo pojačanja
			7			// Koliko botova da spavna po valu.
		]
	]
];

// Difiniraj misiju o spawn loota u kutijama
_missionObjs =
[
	_staticGuns,			// Dodaj bazu. Nije potrebna za sektor B
	[],
	[[_crate0,[10,200,2]],[_crate1,[10,250,15]],[_crate2,[10,200,1]]] // Koliko loota spawnaju kutije
];

// Obavijest igraču o početku misije
_msgStart = ['#FFFF00', "Vojska je dobila 3 palete namirnica, oružja i materijala. Idi tamo prije nego odvezu u sklonište."];

// Obavijest igraču o završetku misije
_msgWIN = ['#0080ff',"Grupa preživjelih se uspjela domoći namirnica na sektoru!"];

// Obavijest igraču o  propuštenoj misiji
_msgLOSE = ['#FF0000',"Preživjeli nisu stigli do Sektora,vojska je uspjela sve prevezli u sklonište..."];

///////////////////////////////////////////////////////
// Ime misije koja sp prikaže u obavijestima i na karti
///////////////////////////////////////////////////////

_missionName = "Sektor B";

// Stvori marker
_markers =
[
	_pos,
	_missionName,
	_difficulty
] call DMS_fnc_CreateMarker;

_circle = _markers select 1;
_circle setMarkerDir 20;
_circle setMarkerSize [1500,50]; // Radius markera


_time = diag_tickTime;

// Monitor
_added =
[
	_pos,
	[
		[
			"kill",
			_group
		],
		[
			"playerNear",
			[_pos,1500] // koliko igrač mora biti blizu markera da bi završio misiju // default 100
		]
	],
	_groupReinforcementsInfo,
	[
		_time,
		DMS_StaticMissionTimeOut call DMS_fnc_SelectRandomVal
	],
	_missionAIUnits,
	_missionObjs,
	[_missionName,_msgWIN,_msgLOSE],
	_markers,
	_side,
	_difficulty,
	[]
] call DMS_fnc_AddMissionToMonitor_Static;

// Provjeri da li je sve ispravno,  u suprotnom obriši sve
if !(_added) exitWith
{
	diag_log format ["DMS ERROR :: Attempt to set up mission %1 with invalid parameters for DMS_fnc_AddMissionToMonitor_Static! Deleting mission objects and resetting DMS_MissionCount.",_missionName];

	_cleanup = [];
	{
		_cleanup pushBack _x;
	} forEach _missionAIUnits;

	_cleanup pushBack ((_missionObjs select 0)+(_missionObjs select 1));

	{
		_cleanup pushBack (_x select 0);
	} foreach (_missionObjs select 2);

	_cleanup call DMS_fnc_CleanUp;


	// Obriši markere
	{deleteMarker _x;} forEach _markers;


	// Resetiraj brojač
	DMS_MissionCount = DMS_MissionCount - 1;
};


// Obavijesti igrače
[_missionName,_msgStart] call DMS_fnc_BroadcastMissionStatus;



if (DMS_DEBUG) then
{
	(format ["MISSION: (%1) :: Mission #%2 started at %3 with %4 AI units and %5 difficulty at time %6",_missionName,_num,_pos,_AICount,_difficulty,_time]) call DMS_fnc_DebugLog;
};
