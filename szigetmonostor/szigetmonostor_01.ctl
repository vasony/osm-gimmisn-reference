load data
CHARACTERSET UTF8
INTO TABLE BS_GOVCENTER_TEMP
TRUNCATE
FIELDS TERMINATED BY x'09'
TRAILING NULLCOLS
(           	
  reginyilvszam  FILLER,
  nyilvszam 	"trim(:nyilvszam)",  
  ker_neve 	"LDR_MACSKA(:ker_neve)",
  ker_cime 	"LDR_MACSKA(:ker_cime)",
  ker_szh       FILLER,
  ker_cgszam 	"trim(nvl(:ker_cgszam, :ker_vallig))",  
  ker_kshszam 	"trim(:ker_kshszam)",  
  ker_vallig    BOUNDFILLER,
  ker_osterm    FILLER char(4000),
  uzl_cime 	char(4000) 	"LDR_MACSKA(:uzl_cime)",  
  m01		FILLER char(4000),
  m02           FILLER char(4000),
  m03		FILLER char(4000),
  tev_forma 	char(4000) "LDR_MACSKA(:tev_forma)",  
  uzl_nyitvatartasa char(4000) 	"LDR_MACSKA(:uzl_nyitvatartasa)",  
  uzl_neve 	"LDR_MACSKA(:uzl_neve)",  
  uzl_meret	"trim(:uzl_meret)",  
  uzl_befogadokepesseg 		"trim(:uzl_befogadokepesseg)",  
  tev_vk_datuma "ldr_datum(:tev_vk_datuma)",
  tev_termekek	char(4000) "LDR_MACSKA(substr(:tev_termekek, 1,4000))",
  tev_jt 	"LDR_MACSKA(:tev_jt)",  
  m04		FILLER char(4000),
  m05           FILLER char(4000),
  m06		FILLER char(4000),
  uzl_szi 	"trim(:uzl_szi)",  
  tev_kt	char(4000) "trim(:tev_kt)", 
  m07		FILLER char(4000),
  tev_kezd_datum "ldr_datum(:tev_kezd_datum)",  
  tev_mod_datum  "ldr_datum(:tev_mod_datum)",  
  tev_vege_datum "ldr_datum(:tev_vege_datum)",  
  dummy,
  onk_id "2015",
  sorszam SEQUENCE(1,1) 
)
