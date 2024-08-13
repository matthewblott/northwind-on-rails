select
  trim(name) || ' ' ||
  trim(address_line_1) || ' ' ||
  trim(address_line_2) || ' ' ||
  trim(postal_town) || ' ' ||
  trim(county) || ' ' ||
  trim(post_code) || ' ' ||
  trim(country) as address
from
  addresses
