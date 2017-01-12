xquery version "1.0-ml";

(:declare variable $vals := (3, 1, 4, 6, 5); :)
declare variable $vals := (1, 2, 3, 4, 5, 23,264,265,7,24,25);

declare variable $doubles :=
fn:map(
  function($v) {
    $v * $v
  },
  $vals
);

declare function local:is-pythagorean-triplet($num, $rest) {
  let $smaller := $rest[. < $num]
  for $s at $idx in $smaller
  return (
    for $i in $smaller[$idx+1 to fn:last()]
    where $i + $s = $num
    return fn:true()
  )
};

for $d at $idx in $doubles
return (
  local:is-pythagorean-triplet($d, fn:remove($doubles, $idx))
)
