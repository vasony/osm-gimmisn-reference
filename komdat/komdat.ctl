load data
CHARACTERSET UTF8
INTO TABLE BS_GOVCENTER_TEMP
APPEND
FIELDS TERMINATED BY x'09'
TRAILING NULLCOLS
(           	
  ID  			BOUNDFILLER,
  uzl_neve		CHAR(4000) "OSM_KOMDAT_DECODE(:uzl_neve)",
  stat_id		FILLER,
  status		"OSM_KOMDAT_DECODE(:status)",
  uzl_cime		CHAR(4000) "OSM_KOMDAT_DECODE(:uzl_cime)",
  hrsz			"OSM_KOMDAT_DECODE(:hrsz)",
  UZL_MERET,
  UZL_BEFOGADOKEPESSEG,
  UZL_NYITVATARTASA	CHAR(4000) "OSM_KOMDAT_DECODE(:UZL_NYITVATARTASA)",
  UZL_SZI		"OSM_KOMDAT_DECODE(:UZL_SZI)",
  UZL_SZ		"OSM_KOMDAT_DECODE(:UZL_SZ)",
  szorakoztatoszolg  	FILLER,
  musorszolg            FILLER,
  UZL_MT		CHAR(4000) "OSM_KOMDAT_DECODE(:UZL_MT)",
  ker_neve 		CHAR(4000) "OSM_KOMDAT_DECODE(:ker_neve)",
  ker_cime 		CHAR(4000) "OSM_KOMDAT_DECODE(:ker_cime)",
  ker_cgszam 		"OSM_KOMDAT_DECODE(:ker_cgszam)",
  KER_KSHSZAM		"OSM_KOMDAT_DECODE(:KER_KSHSZAM)",
  ADOSZAM		"OSM_KOMDAT_DECODE(:ADOSZAM)",
  TEV_VK_DATUMA		FILLER,
  NYILVDATE		FILLER,
  nyilvdatev		BOUNDFILLER,
  TEV_FORMA		CHAR(4000) "NULLIF(OSM_KOMDAT_DECODE(:TEV_FORMA),'Nincs átfordítva')",
  TEV_JELLEG		CHAR(4000) "OSM_KOMDAT_DECODE(:TEV_JELLEG)",
  TEV_JT		CHAR(4000) "OSM_KOMDAT_DECODE(:TEV_JT)",
  TEV_KT		CHAR(4000) "OSM_KOMDAT_DECODE(:TEV_KT)",
  TEV_UT		CHAR(4000) "OSM_KOMDAT_DECODE(:TEV_UT)", 
  TEV_TERMEKEK		CHAR(4000) "OSM_KOMDAT_DECODE(:TEV_TERMEKEK)",
  TEV_KEZD_DATUM	"OSM_KOMDAT_DECODE(:TEV_KEZD_DATUM)",
  TEV_MOD_DATUM		"OSM_KOMDAT_DECODE(:TEV_MOD_DATUM)",
  TEV_VEGE_DATUM	"OSM_KOMDAT_DECODE(:TEV_VEGE_DATUM)",
  nyilv_ok		FILLER,
  tipus_nev		FILLER,
  alszam		FILLER,
  berszerhido		FILLER,
  BOLT_ARUSITOTER_TERULET	"nullif(:BOLT_ARUSITOTER_TERULET, 'null')",
  BOLT_PARKOLO			"nullif(:BOLT_PARKOLO, 'null')",
  BOLT_TELEKHATARTOL_TAVOLSAG	"nullif(:BOLT_TELEKHATARTOL_TAVOLSAG, 'null')",
  BOLT_PARKOLO_ELHELYEZESE	"nullif(:BOLT_PARKOLO_ELHELYEZESE, 'null')",
  ELTERO_NYITVATARTAS	CHAR(4000) "OSM_KOMDAT_DECODE(RTRIM(:ELTERO_NYITVATARTAS,'}'))",
  SORSZAM		":ID+$offset",
  NYILVSZAM		":ID||'/'||OSM_KOMDAT_DECODE(:NYILVDATEV)",
  onk_id 		"$onk_id"
)