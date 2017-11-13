/////////////////////////////////////////////////////////////////////////
// Klasa sector B - specijalci
/////////////////////////////////////////////////////////////////////////
	//Specijalci Class
	DMS_specijalci_weps =					[							// Specijalci Rifles
											"srifle_EBR_F",
											"srifle_GM6_F",
											"srifle_LRR_F",
											"arifle_MXM_Black_F",
											"srifle_DMR_01_F",
											#ifdef GIVE_AI_MARKSMAN_DLC_WEAPONS
											"srifle_DMR_02_F",
											"srifle_DMR_03_woodland_F",
											//"srifle_DMR_04_F",
											"srifle_DMR_05_blk_F",
											"srifle_DMR_06_olive_F",
											#endif

											#ifdef GIVE_AI_APEX_WEAPONS
											"srifle_DMR_07_ghex_F",
											#endif
											"Exile_Weapon_DMR",
											"Exile_Weapon_SVD",
											"Exile_Weapon_VSSVintorez",
											"arifle_Katiba_GL_F",
											"arifle_MX_GL_Black_F",
											"arifle_Mk20_GL_F",
											"arifle_TRG21_GL_F",
											"arifle_Katiba_F",
											"arifle_MX_Black_F",
											"arifle_TRG21_F",
											"arifle_TRG20_F",
											"arifle_Mk20_plain_F",
											"arifle_Mk20_F",
											"Exile_Weapon_AK107",
											"Exile_Weapon_AK107_GL",
											"Exile_Weapon_AK74_GL",
											"Exile_Weapon_AK47",
											"Exile_Weapon_AKS_Gold"
										];
	DMS_specijalci_pistols =				[	
											#ifdef GIVE_AI_APEX_WEAPONS
											"hgun_Pistol_01_F",
											#endif
											"hgun_ACPC2_F",
											"hgun_Rook40_F",
											"hgun_P07_F",
											"hgun_Pistol_heavy_01_F",
											"hgun_Pistol_heavy_02_F",
											"Exile_Weapon_Colt1911",
											"Exile_Weapon_Makarov",
											"Exile_Weapon_Taurus",
											"Exile_Weapon_TaurusGold"
										];
	DMS_specijalci_optics =					[							// Optics for Specijalci Class
											#ifdef GIVE_AI_APEX_GEAR
											"optic_SOS_khk_F",
											"optic_DMS_ghex_F",
											"optic_LRPS_tna_F",
											#endif

											#ifdef GIVE_AI_MARKSMAN_DLC_WEAPONS
											"optic_AMS_khk",
											#endif
											"optic_SOS",
											"optic_DMS",
											"optic_LRPS"
										];
	DMS_specijalci_optic_chance				= 30;						// Percentage chance that a Specijalci Class AI will get an optic
	DMS_specijalci_bipod_chance				= 50;						// Percentage chance that a Specijalci Class AI will get a bipod
	DMS_specijalci_suppressor_chance		= 15;						// Percentage chance that a Specijalci Class AI will get a suppressor

	DMS_specijalci_items =					[							// Items for Specijalci Class AI (Loot stuff that goes in uniform/vest/backpack)
											"Exile_Item_InstaDoc",
											"Exile_Item_Surstromming_Cooked",
											"Exile_Item_PlasticBottleFreshWater",
											"Exile_Item_PlasticBottleFreshWater",
											"Exile_Item_Matches"
										];
	DMS_specijalci_equipment =				[							// Equipment for Specijalci Class AI (stuff that goes in toolbelt slots)
											"Rangefinder",
											"ItemGPS"
										];
	DMS_specijalci_RandItemCount =			3;							// How many random items to add to the AI's inventory.
	DMS_specijalci_RandItems =				[							// The random items that will be added to the AI's inventory.
											"Exile_Item_EMRE",
											"Exile_Item_PlasticBottleCoffee",
											"Exile_Item_CanOpener",
											"Exile_Item_Instadoc",
											"Exile_Item_DuctTape"
										];
	DMS_specijalci_helmets =				[							// Helmets for Specijalci Class
											
											"TRYK_H_headsetcap_blk"
										];
	DMS_specijalci_clothes =				[							// Uniforms for Specijalci Class
                                            							
											"TRYK_U_B_BLKBLK_CombatUniform"
										];
	DMS_specijalci_vests =					[							// Vests for Specijalci Class
											
											"TRYK_V_PlateCarrier_blk"
										];
	DMS_specijalci_backpacks =				[							// Backpacks for Specijalci Class
											"TRYK_B_tube_blk",
											"TRYK_B_BAF_BAG_BLK"
										];
/////////////////////////////////////////////////////////////////////////
// Kraj - Klasa sector B - specijalci
/////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
// Change these
/////////////////////////////////////////////////////////////////////////
/*
	DMS_ai_SupportedClasses =			[							// Allowed AI classes. If you want to create your own class, make sure you define everything as I've defined above, and add it here
											"assault",
											"MG",
											"sniper",
											"specijalci" // added new
	];
	DMS_StaticMissionTypes =			[								// List of STATIC missions with spawn chances.
											//["saltflats",1]		//<--Example (already imported by default on Altis in map configs)
											//["slums",1]			//<--Example (already imported by default on Altis in map configs)
											//["occupation",1]		//<--Example
											["sektorB",1],  // added new
											//["ivansLab",1]			
	];
	DMS_StaticMissionsOnServerStart =	[								// List of STATIC missions with spawn chances.
											//"saltflats"			//<--Example
											//"slums"				//<--Example
											//"occupation"			//<--Example
											"sektorB" ,	// added new
											//"ivansLab"      
	];
*/
