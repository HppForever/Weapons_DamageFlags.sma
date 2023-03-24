// Подключаем нужные инклуды для работы плагина

#include <amxmodx>
#include <amxmisc>
#include <hamsandwich>
#include <fun>


#define VipPlus_Flags ADMIN_LEVEL_A         // Флаг випа+
#define Vip_Flags ADMIN_LEVEL_H            // Флаг випа
#define OtherFlags ADMIN_LEVEL_B || get_user_flags(attacker) & ADMIN_LEVEL_D // Остальные флаги

#define Multiplier_VipPlusDamage 1.25    // Множитель урона для випа+ (25%)
#define Multiplier_VipDamage 1.15       // Множитель урона для випа (15%)
#define Multiplier_OtherDamage 1.30    // Множитель урона для остальных привилегий (30%)


public plugin_init()

{
    register_plugin("Weapons_DamageFlags", "1.0", "hpp_forever");          // Автор плагина
    RegisterHam(Ham_TakeDamage, "player", "Hook_TakeDamage")
}

public Hook_TakeDamage(victim, inflictor, attacker, Float:damage, damage_type, id) // Метод "hook_TakeDamage" будет изменять урон оружия для разных флагов игрока

{
	
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ----------------------------------------------------------- [Остальные] увеличение урона оружия ------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
		
		
		if (get_user_flags(attacker) & OtherFlags) // Проверка на флаг
		 
     {
		 new CurrentWeapons_OtherFlags = get_user_weapon(attacker); // Объявляем переменную "CurrentWeapons_OtherFlags" которая будет знать какое оружие находится у игрока который прошел проверку на флаг
		 
        if (CurrentWeapons_OtherFlags == CSW_KNIFE || CurrentWeapons_OtherFlags == CSW_P228|| CurrentWeapons_OtherFlags == CSW_SCOUT || CurrentWeapons_OtherFlags == CSW_HEGRENADE ||    CurrentWeapons_OtherFlags == CSW_XM1014 || CurrentWeapons_OtherFlags == CSW_MAC10 || CurrentWeapons_OtherFlags == CSW_AUG || CurrentWeapons_OtherFlags == CSW_ELITE ||      CurrentWeapons_OtherFlags == CSW_FIVESEVEN || CurrentWeapons_OtherFlags == CSW_UMP45 || CurrentWeapons_OtherFlags == CSW_SG550 || CurrentWeapons_OtherFlags == CSW_GALIL       || CurrentWeapons_OtherFlags == CSW_FAMAS || CurrentWeapons_OtherFlags == CSW_USP || CurrentWeapons_OtherFlags == CSW_GLOCK18 || CurrentWeapons_OtherFlags == CSW_AWP ||        CurrentWeapons_OtherFlags == CSW_MP5NAVY || CurrentWeapons_OtherFlags == CSW_M249 || CurrentWeapons_OtherFlags == CSW_M3  || CurrentWeapons_OtherFlags == CSW_M4A1         ||  CurrentWeapons_OtherFlags == CSW_TMP || CurrentWeapons_OtherFlags == CSW_G3SG1 || CurrentWeapons_OtherFlags == CSW_DEAGLE || CurrentWeapons_OtherFlags == CSW_SG552         ||   CurrentWeapons_OtherFlags == CSW_AK47 || CurrentWeapons_OtherFlags == CSW_P90 || CurrentWeapons_OtherFlags == CSW_VEST || CurrentWeapons_OtherFlags ==               CSW_VESTHELM) // Перечисление всех оружий
			
        {
            SetHamParamFloat(4, damage * Multiplier_OtherDamage) // Установка множителя урона для випа+
        }
    }
		
		
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ----------------------------------------------------------- [Вип+] увеличение урона оружия -----------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


	if (get_user_flags(attacker) & VipPlus_Flags) // Проверка на вип+ флаг
		 
     {
		 new CurrentWeaponsVipPlus = get_user_weapon(attacker); // Объявляем переменную "CurrentWeaponsVipPlus" которая будет знать какое оружие находится у игрока который прошел проверку на флаг
		 
        if (CurrentWeaponsVipPlus == CSW_KNIFE || CurrentWeaponsVipPlus == CSW_P228|| CurrentWeaponsVipPlus == CSW_SCOUT || CurrentWeaponsVipPlus == CSW_HEGRENADE ||    CurrentWeaponsVipPlus == CSW_XM1014 || CurrentWeaponsVipPlus == CSW_MAC10 || CurrentWeaponsVipPlus == CSW_AUG || CurrentWeaponsVipPlus == CSW_ELITE ||      CurrentWeaponsVipPlus == CSW_FIVESEVEN || CurrentWeaponsVipPlus == CSW_UMP45 || CurrentWeaponsVipPlus == CSW_SG550 || CurrentWeaponsVipPlus == CSW_GALIL       || CurrentWeaponsVipPlus == CSW_FAMAS || CurrentWeaponsVipPlus == CSW_USP || CurrentWeaponsVipPlus == CSW_GLOCK18 || CurrentWeaponsVipPlus == CSW_AWP ||        CurrentWeaponsVipPlus == CSW_MP5NAVY || CurrentWeaponsVipPlus == CSW_M249 || CurrentWeaponsVipPlus == CSW_M3  || CurrentWeaponsVipPlus == CSW_M4A1         ||  CurrentWeaponsVipPlus == CSW_TMP || CurrentWeaponsVipPlus == CSW_G3SG1 || CurrentWeaponsVipPlus == CSW_DEAGLE || CurrentWeaponsVipPlus == CSW_SG552         ||   CurrentWeaponsVipPlus == CSW_AK47 || CurrentWeaponsVipPlus == CSW_P90 || CurrentWeaponsVipPlus == CSW_VEST || CurrentWeaponsVipPlus ==               CSW_VESTHELM) // Перечисление всех оружий
			
        {
            SetHamParamFloat(4, damage * Multiplier_VipPlusDamage) // Установка множителя урона для випа+
        }
    }
	
	
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ------------------------------------------------------------ [Вип] увеличение урона оружия -----------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


     if (get_user_flags(attacker) & Vip_Flags) // Проверка на вип флаг
		 
     {
		 new CurrentWeaponsVip = get_user_weapon(attacker); // Объявляем переменную "CurrentWeaponsVip" которая будет знать какое оружие находится у игрока который прошел проверку на флаг
		 
        if (CurrentWeaponsVip == CSW_KNIFE || CurrentWeaponsVip == CSW_P228|| CurrentWeaponsVip == CSW_SCOUT || CurrentWeaponsVip == CSW_HEGRENADE ||    CurrentWeaponsVip == CSW_XM1014 || CurrentWeaponsVip == CSW_MAC10 || CurrentWeaponsVip == CSW_AUG || CurrentWeaponsVip == CSW_ELITE ||      CurrentWeaponsVip == CSW_FIVESEVEN || CurrentWeaponsVip == CSW_UMP45 || CurrentWeaponsVip == CSW_SG550 || CurrentWeaponsVip == CSW_GALIL       || CurrentWeaponsVip == CSW_FAMAS || CurrentWeaponsVip == CSW_USP || CurrentWeaponsVip == CSW_GLOCK18 || CurrentWeaponsVip == CSW_AWP ||        CurrentWeaponsVip == CSW_MP5NAVY || CurrentWeaponsVip == CSW_M249 || CurrentWeaponsVip == CSW_M3  || CurrentWeaponsVip == CSW_M4A1         ||  CurrentWeaponsVip == CSW_TMP || CurrentWeaponsVip == CSW_G3SG1 || CurrentWeaponsVip == CSW_DEAGLE || CurrentWeaponsVip == CSW_SG552         ||   CurrentWeaponsVip == CSW_AK47 || CurrentWeaponsVip == CSW_P90 || CurrentWeaponsVip == CSW_VEST || CurrentWeaponsVip ==               CSW_VESTHELM) // Перечисление всех оружий
			
        {
            SetHamParamFloat(4, damage * Multiplier_VipDamage) // Установка множителя урона для випа
        }
    }
	
	return HAM_IGNORED;
}