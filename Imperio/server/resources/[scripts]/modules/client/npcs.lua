-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Spawned = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ -- Prison
		Distance = 50,
		Coords = { 1690.5, 2529.67, 45.56, 187.09 },
		Model = "s_f_y_cop_01",
		anim = { "amb@lo_res_idles@", "world_human_lean_male_foot_up_lo_res_base" }
	}, { -- Loja de Materiais
		Distance = 100,
		Coords = { 46.67, -1749.79, 29.62, 48.19 },
		Model = "ig_cletus",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Loja de Materiais
		Distance = 100,
		Coords = { 2747.29, 3473.06, 55.67, 252.29 },
		Model = "ig_cletus",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Animal Ark
		Distance = 25,
		Coords = { 563.19, 2752.92, 42.87, 187.09 },
		Model = "a_f_y_eastsa_03",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Blackout
		Distance = 50,
		Coords = { 2101.89, 2323.65, 94.27, 272.13 },
		Model = "s_m_y_construct_01",
		anim = { "anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop" }
	}, { -- Scrap
		Distance = 100,
		Coords = { 2455.81, 4979.48, 51.56, 130.4 },
		Model = "g_m_y_salvagoon_03",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Scrap
		Distance = 100,
		Coords = { -286.33, 2838.56, 54.96, 153.08 },
		Model = "g_m_y_salvagoon_03",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Scrap
		Distance = 100,
		Coords = { -1505.9, 1526.25, 115.25, 73.71 },
		Model = "g_m_y_salvagoon_03",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Scrap
		Distance = 100,
		Coords = { 3452.72, 3646.46, 42.6, 170.082 },
		Model = "g_m_y_salvagoon_03",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Concessionária Sul
		Distance = 25,
		Coords = { -56.94, -1098.77, 26.42, 25.52 },
		Model = "player_zero",
		anim = { "amb@prop_human_bum_shopping_cart@male@base", "base" }
	}, { -- Concessionária Norte
		Distance = 25,
		Coords = { 1224.78, 2728.01, 38.0, 178.59 },
		Model = "player_zero",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Barman
		Distance = 50,
		Coords = { 889.57, -1039.62, 35.25, 269.3 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 50,
		Coords = { 149.24, -3013.46, 7.04, 175.75 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 15,
		Coords = { 2194.73, 5581.52, 53.36, 184.26 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 15,
		Coords = { 1420.99, 6336.16, 23.32, 269.3 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 15,
		Coords = { -1653.73, -1062.23, 12.15, 141.74 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 15,
		Coords = { 1255.55, -1566.21, 58.35, 218.27 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 15,
		Coords = { 493.64, -1531.79, 29.28, 229.61 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 15,
		Coords = { 336.64, -1989.09, 24.2, 48.19 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 15,
		Coords = { -157.19, -1611.54, 33.65, 249.45 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 15,
		Coords = { -2.41, -1827.17, 29.15, 48.19 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 15,
		Coords = { 987.83, -95.28, 74.85, 223.94 },
		Model = "g_f_y_lost_01",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Barman
		Distance = 15,
		Coords = { 100.99, 3605.58, 40.49, 90.71 },
		Model = "g_f_y_lost_01",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender" }
	}, { -- Bus
		Distance = 50,
		Coords = { 453.47, -602.34, 28.59, 266.46 },
		Model = "s_m_m_pilot_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Taxista
		Distance = 50,
		Coords = { 894.97, -179.14, 74.7, 238.12 },
		Model = "a_m_y_stlat_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Taxista
		Distance = 50,
		Coords = { 907.79, -164.09, 74.12, 141.74 },
		Model = "a_m_y_stlat_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Jardineiro
		Distance = 50,
		Coords = { -1275.5, -1139.56, 6.79, 113.39 },
		Model = "s_m_m_gardener_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Carteiro
		Distance = 50,
		Coords = { -424.36, -2789.78, 6.52, 328.82 },
		Model = "s_m_m_gentransport",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Carteiro
		Distance = 50,
		Coords = { -444.92, -2802.09, 7.3, 45.36 },
		Model = "s_m_m_gentransport",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Lester
		Distance = 10,
		Coords = { 1272.26, -1711.54, 54.76, 34.02 },
		Model = "ig_lestercrest",
		anim = { "anim@heists@prison_heiststation@cop_reactions", "cop_b_idle" }
	}, { -- Helicopters
		Distance = 100,
		Coords = { -1896.42, -3032.01, 13.93, 243.78 },
		Model = "g_m_y_korlieut_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Caminhoneiro
		Distance = 100,
		Coords = { 1239.87, -3257.2, 7.09, 274.97 },
		Model = "s_m_m_trucker_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ballas
		Distance = 100,
		Coords = { 95.58, -1985.56, 20.44, 317.49 },
		Model = "ig_g",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Families
		Distance = 100,
		Coords = { -31.47, -1434.84, 31.49, 0.0 },
		Model = "ig_g",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Vagos
		Distance = 100,
		Coords = { 347.45, -2069.06, 20.89, 320.32 },
		Model = "ig_g",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Aztecas
		Distance = 100,
		Coords = { 512.29, -1803.52, 28.51, 246.62 },
		Model = "ig_g",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Bloods
		Distance = 100,
		Coords = { 230.55, -1753.35, 28.98, 232.45 },
		Model = "ig_g",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Cassino Loja 1
		Distance = 25,
		Coords = { 990.78, 31.73, 71.46, 42.52 },
		Model = "s_f_y_casino_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Cassino Loja 2
		Distance = 25,
		Coords = { 990.06, 30.57, 71.46, 70.87 },
		Model = "s_f_y_casino_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Cassino
		Distance = 25,
		Coords = { 988.37, 43.06, 71.3, 170.08 },
		Model = "s_f_y_casino_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- TowDriver
		Distance = 100,
		Coords = { 408.98, -1622.71, 29.28, 232.45 },
		Model = "g_m_m_armboss_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Coveiro
		Distance = 100,
		Coords = { -1745.92, -204.83, 57.39, 320.32 },
		Model = "g_m_m_armboss_01",
		anim = { "timetable@trevor@smoking_meth@base", "base" }
	}, { -- Auto Escola
		Distance = 30,
		Coords = { 216.08, -1389.87, 30.58, 325.99 },
		Model = "ig_barry",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Prefeitura
		Distance = 30,
		Coords = { -551.53, -191.2, 38.22, 209.77 },
		Model = "ig_barry",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Prefeitura Ilegal
		Distance = 30,
		Coords = { -544.76, -185.81, 52.2, 303.31 },
		Model = "ig_barry",
		anim = { "amb@lo_res_idles@", "world_human_lean_male_foot_up_lo_res_base" }
	}, { -- Weeds
		Distance = 100,
		Coords = { -1174.54, -1571.4, 4.35, 124.73 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@", "world_human_lean_male_foot_up_lo_res_base" }
	}, { -- Ilegal
		Distance = 100,
		Coords = { -195.15, 3651.33, 51.73, 334.49 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@", "world_human_lean_male_foot_up_lo_res_base" }
	}, { -- Ilegal
		Distance = 100,
		Coords = { 904.34, 3656.56, 32.57, 274.97 },
		Model = "g_m_y_ballaeast_01",
		anim = { "amb@lo_res_idles@", "world_human_lean_male_foot_up_lo_res_base" }
	}, { -- Ilegal
		Distance = 100,
		Coords = { 2450.88, 3759.53, 41.7, 334.49 },
		Model = "g_m_y_ballasout_01",
		anim = { "amb@lo_res_idles@", "world_human_lean_male_foot_up_lo_res_base" }
	}, { -- Ilegal
		Distance = 100,
		Coords = { 1901.86, 4925.07, 48.86, 153.08 },
		Model = "g_m_y_famca_01",
		anim = { "amb@lo_res_idles@", "world_human_lean_male_foot_up_lo_res_base" }
	}, { -- Transporter
		Distance = 100,
		Coords = { 232.55, 202.84, 105.4, 161.58 },
		Model = "ig_casey",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Police
		Distance = 100,
		Coords = { 463.15, -982.33, 43.69, 87.88 },
		Model = "s_f_y_cop_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Police
		Distance = 100,
		Coords = { 443.49, -974.47, 25.7, 181.42 },
		Model = "s_f_y_cop_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Paramedico
		Distance = 100,
		Coords = { 338.19, -586.91, 74.16, 252.29 },
		Model = "s_m_m_paramedic_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Paramedico
		Distance = 100,
		Coords = { 340.08, -576.19, 28.8, 73.71 },
		Model = "s_m_m_paramedic_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 24.51, -1346.75, 29.49, 272.13 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 2556.77, 380.87, 108.61, 0.0 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 1164.81, -323.61, 69.2, 99.22 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { -706.16, -914.55, 19.21, 87.88 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { -47.35, -1758.59, 29.42, 45.36 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 372.7, 326.89, 103.56, 255.12 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { -3242.7, 1000.05, 12.82, 357.17 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 1728.08, 6415.6, 35.03, 243.78 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 549.09, 2670.89, 42.16, 93.55 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 1959.87, 3740.44, 32.33, 300.48 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 2677.65, 3279.66, 55.23, 331.66 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 1697.32, 4923.46, 42.06, 323.15 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { -1819.52, 793.48, 138.08, 130.4 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 1391.62, 3605.95, 34.98, 198.43 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { -2966.41, 391.52, 15.05, 82.21 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { -3039.42, 584.42, 7.9, 14.18 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 1134.32, -983.09, 46.4, 277.8 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { 1165.32, 2710.79, 38.15, 175.75 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { -1486.72, -377.61, 40.15, 130.4 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { -1221.48, -907.93, 12.32, 31.19 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Departament Store
		Distance = 15,
		Coords = { -160.62, 6320.89, 31.58, 317.49 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { 1692.27, 3760.91, 34.69, 226.78 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { 253.8, -50.47, 69.94, 65.2 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { 842.54, -1035.25, 28.19, 0.0 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { -331.67, 6084.86, 31.46, 223.94 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { -662.37, -933.58, 21.82, 181.42 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { -1304.12, -394.56, 36.7, 73.71 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { -1118.98, 2699.73, 18.55, 221.11 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { 2567.98, 292.62, 108.73, 0.0 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { -3173.51, 1088.35, 20.84, 246.62 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { 22.53, -1105.52, 29.79, 155.91 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Ammu-Nation Store
		Distance = 15,
		Coords = { 810.22, -2158.99, 29.62, 0.0 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Pharmacy Store
		Distance = 30,
		Coords = { -172.89, 6381.32, 31.48, 223.94 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Pharmacy Store
		Distance = 30,
		Coords = { 1690.07, 3581.68, 35.62, 212.6 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Pharmacy Store
		Distance = 30,
		Coords = { 326.5, -1074.43, 29.47, 0.0 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Pharmacy Store
		Distance = 30,
		Coords = { 114.39, -4.85, 67.82, 204.1 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Pharmacy Store
		Distance = 30,
		Coords = { 213.75, -1835.36, 27.57, 323.15 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Recycling Sell
		Distance = 50,
		Coords = { -428.54, -1728.29, 19.78, 70.87 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Recycling Sell
		Distance = 50,
		Coords = { 180.07, 2793.29, 45.65, 283.47 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Recycling Sell
		Distance = 50,
		Coords = { -195.42, 6264.62, 31.49, 42.52 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Jewelry
		Distance = 15,
		Coords = { -628.79, -238.7, 38.05, 311.82 },
		Model = "cs_gurk",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Oxy Store
		Distance = 30,
		Coords = { -1636.74, -1092.17, 13.08, 320.32 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Transporter
		Distance = 20,
		Coords = { 264.74, 219.99, 101.67, 343.0 },
		Model = "ig_casey",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Lenhador
		Distance = 50,
		Coords = { 1961.61, 5179.26, 47.94, 277.8 },
		Model = "a_m_o_ktown_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Lixeiro
		Distance = 50,
		Coords = { 82.98, -1553.55, 29.59, 51.03 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Lixeiro
		Distance = 50,
		Coords = { 287.77, 2843.9, 44.7, 121.89 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Lixeiro
		Distance = 50,
		Coords = { -413.97, 6171.58, 31.48, 320.32 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Caçador
		Distance = 10,
		Coords = { -679.13, 5839.52, 17.32, 226.78 },
		Model = "ig_hunter",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Caçador
		Distance = 50,
		Coords = { -1593.08, 5202.9, 4.31, 297.64 },
		Model = "a_m_o_ktown_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Frutas
		Distance = 30,
		Coords = { 1654.84, 4862.14, 41.99, 277.8 },
		Model = "ig_janet",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Pescador
		Distance = 30,
		Coords = { -1816.64, -1193.73, 14.31, 334.49 },
		Model = "a_f_y_eastsa_03",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Leiteiro
		Distance = 30,
		Coords = { 2435.82, 4774.08, 34.37, 229.61 },
		Model = "s_m_m_cntrybar_01",
		anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" }
	}, { -- Vaca
		Distance = 100,
		Coords = { 2440.58,4736.35,34.29,317.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2432.5,4744.58,34.31,317.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2424.47,4752.37,34.31,317.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2416.28,4760.8,34.31,317.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2408.6,4768.88,34.31,317.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2400.32,4777.48,34.53,317.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2432.46,4802.66,34.83,137.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2440.62,4794.22,34.66,137.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2448.65,4786.57,34.64,137.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2456.88,4778.08,34.49,137.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2464.53,4770.04,34.37,137.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2473.38,4760.98,34.31,137.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2495.03,4762.77,34.37,137.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2503.13,4754.08,34.31,137.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2511.34,4746.04,34.31,137.50 },
		Model = "a_c_cow"
	}, { -- Vaca
		Distance = 100,
		Coords = { 2519.56,4737.35,34.29,137.50 },
		Model = "a_c_cow"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADLIST
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		for Number = 1, #List do
			local Distance = #(Coords - vec3(List[Number]["Coords"][1], List[Number]["Coords"][2], List[Number]["Coords"][3]))
			if Distance <= List[Number]["Distance"] then
				if not Spawned[Number] and LoadModel(List[Number]["Model"]) then
					Spawned[Number] = CreatePed(4, List[Number]["Model"], List[Number]["Coords"][1], List[Number]["Coords"][2], List[Number]["Coords"][3] - 1, List[Number]["Coords"][4], false, false)
					SetPedArmour(Spawned[Number], 100)
					SetEntityInvincible(Spawned[Number], true)
					FreezeEntityPosition(Spawned[Number], true)
					SetEntityNoCollisionEntity(Spawned[Number], Ped, true)
					SetBlockingOfNonTemporaryEvents(Spawned[Number], true)

					SetModelAsNoLongerNeeded(List[Number]["Model"])

					if List[Number]["Model"] == "s_f_y_casino_01" then
						SetPedDefaultComponentVariation(Spawned[Number])
						SetPedComponentVariation(Spawned[Number], 0, 3, 0, 0)
						SetPedComponentVariation(Spawned[Number], 1, 0, 0, 0)
						SetPedComponentVariation(Spawned[Number], 2, 3, 0, 0)
						SetPedComponentVariation(Spawned[Number], 3, 0, 1, 0)
						SetPedComponentVariation(Spawned[Number], 4, 1, 0, 0)
						SetPedComponentVariation(Spawned[Number], 6, 1, 0, 0)
						SetPedComponentVariation(Spawned[Number], 7, 1, 0, 0)
						SetPedComponentVariation(Spawned[Number], 8, 0, 0, 0)
						SetPedComponentVariation(Spawned[Number], 10, 0, 0, 0)
						SetPedComponentVariation(Spawned[Number], 11, 0, 0, 0)
						SetPedPropIndex(Spawned[Number], 1, 0, 0, false)
					end

					if List[Number]["anim"] and LoadAnim(List[Number]["anim"][1]) then
						TaskPlayAnim(Spawned[Number], List[Number]["anim"][1], List[Number]["anim"][2], 8.0, 8.0, -1, 1, 1, 0, 0, 0)
					end
				end
			else
				if Spawned[Number] then
					if DoesEntityExist(Spawned[Number]) then
						DeleteEntity(Spawned[Number])
					end

					Spawned[Number] = nil
				end
			end
		end

		Wait(1000)
	end
end)