load data
CHARACTERSET UTF8
INTO TABLE BS_GOVCENTER_TEMP
APPEND
FIELDS TERMINATED BY x'09'
TRAILING NULLCOLS
(           	
  reginyilvszam  FILLER,
  nyilvszam 	"trim(:nyilvszam)",  
  ker_neve 	"LDR_MACSKA(:ker_neve)",
  ker_cime 	"LDR_MACSKA(:ker_cime||' '||:kc2||' '||:kc3)",
  kc2		BOUNDFILLER,
  kc3     	BOUNDFILLER,
  ker_cgszam 	"trim(:ker_cgszam)",  
  ker_kshszam 	"trim(:ker_kshszam)",  
  uzl_nyitvatartasa char(4000) 	"LDR_MACSKA(:uzl_nyitvatartasa)",  
  uzl_cime 	char(4000) 	"LDR_MACSKA(:uzl_cime||' '||:uc2)",  
  uc2		BOUNDFILLER,
  hrsz,
  uzl_neve 	"LDR_MACSKA(:uzl_neve)",  
  uzl_meret	"trim(:uzl_meret)",  
  tev_termekek	char(4000) "LDR_MACSKA(substr(:tev_termekek, 1,4000))",
  tev_forma 	char(4000) "LDR_MACSKA(:tev_forma)",  
  tev_kt	char(4000) "LDR_MACSKA(:tev_kt)", 
  tev_kezd_datum "ldr_datum(:tev_kezd_datum)",  
  tev_mod_datum  "ldr_datum(:tev_mod_datum)",  
  tev_vege_datum "ldr_datum(:tev_vege_datum)",  
  dummy,
  onk_id "2015",
  sorszam SEQUENCE(201,1) 
)
