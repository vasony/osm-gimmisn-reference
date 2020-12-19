load data
CHARACTERSET UTF8
INTO TABLE BS_GOVCENTER_TEMP
APPEND
FIELDS TERMINATED BY x'09'
TRAILING NULLCOLS
(           	
  nyilvszam 	"trim(:nyilvszam)",  
  ker_neve 	"qmc.compact_space(:ker_neve)",  
  ker_cime 	"qmc.compact_space(:ker_cime)",  
  ker_cgszam 	"trim(:ker_cgszam)",  
  ker_kshszam 	"trim(:ker_kshszam)",  
  uzl_neve 	"qmc.compact_space(:uzl_neve)",  
  uzl_cime 	char(4000) 	"qmc.compact_space(:uzl_cime)",  
  uzl_meret	"trim(:uzl_meret)",  
  uzl_befogadokepesseg 		"trim(:uzl_befogadokepesseg)",  
  uzl_nyitvatartasa char(4000) 	"trim(:uzl_nyitvatartasa)",  
  uzl_szi 	"trim(:uzl_szi)",  
  uzl_sz 	"trim(:uzl_sz)",  
  uzl_mt	char(4000) 	"trim(:uzl_mt)",  
  tev_forma 	"trim(:tev_forma)",  
  tev_jelleg 	"trim(:tev_jelleg)",  
  tev_jt 	"trim(:tev_jt)",  
  tev_kt	char(4000) "trim(:tev_kt)", 
  tev_ut 	char(4000) "trim(substr(:tev_ut, 1,4000))", 
  tev_termekek	char(4000) "trim(substr(:tev_termekek, 1,4000))",
  tev_vk_datuma "trim(:tev_vk_datuma)",  
  tev_kezd_datum "trim(:tev_kezd_datum)",  
  tev_mod_datum "trim(:tev_mod_datum)",  
  tev_vege_datum "trim(:tev_vege_datum)",  
  bolt_arusitoter_terulet "trim(:bolt_arusitoter_terulet)",  
  bolt_parkolo "trim(:bolt_parkolo)",  
  bolt_telekhatartol_tavolsag "trim(:bolt_telekhatartol_tavolsag)",  
  bolt_parkolo_elhelyezese "trim(:bolt_parkolo_elhelyezese)",  
  dummy,
  sorszam "seq_osm_uzlet.nextval", 
  onk_id "$onk_id"
)
