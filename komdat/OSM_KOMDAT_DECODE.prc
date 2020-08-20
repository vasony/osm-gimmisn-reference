create or replace function OSM_KOMDAT_DECODE(p_string in varchar2) return varchar2 is
  v_result  varchar2(4000 char) ;
  v_encoded varchar2(4000 char);
  v_decoded varchar2(4000 char);
  v_shift pls_integer := 0;
begin
  if p_string = 'null' then
    return null;
  end if;
  
  v_encoded := rtrim(ltrim(p_string,'"'),'"');
  if v_encoded is null then
    return null;
  end if;
  
  v_decoded := utl_raw.cast_to_varchar2(utl_encode.base64_decode(utl_raw.cast_to_raw(v_encoded)));
  for a in 1 .. length(v_decoded) loop
    v_result := chr(ascii(substr(v_decoded,a,1))-v_shift) || v_result;
    v_shift := mod(v_shift+1,8);
  end loop;
  
  v_result := replace(v_result, chr(49785), 'y');--121
  v_result := replace(v_result, chr(49786), 'z');--122
  v_result := replace(v_result, chr(49787), '{');--123
  v_result := replace(v_result, chr(49788), '|');--124

  v_result := replace(v_result, chr(50298), 'ú');--
  v_result := replace(v_result, chr(50300), 'ü');--
  
  v_result := qmc.ekezet_convert(v_result);
  if instr(v_result, '  ') > 0 then
    v_result := qmc.compact_space(v_result);
  else
    v_result := trim(v_result);
  end if;
  return v_result;
end;
