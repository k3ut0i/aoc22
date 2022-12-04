actor Main
  new create(env : Env) =>
    env.input(
    object iso is InputNotify
      fun ref apply(data : Array[U8] iso) =>
        let inp : String = String.from_iso_array(consume data)
        let lines : Array[String] = inp.split("\n")
        var full_overlaps : U64 = 0
        var part_overlaps : U64 = 0
        for pair in lines.values() do
          let pa = pair.split(",")
          try
            let r1 = Parse.range(pa(0)?)?
            let r2 = Parse.range(pa(1)?)?
            if Logic.contains(r1, r2) then
              full_overlaps = full_overlaps + 1
              // env.out.print(pa(0)? + "  " + pa(1)?)
            end
            if Logic.overlaps(r1, r2) then
              part_overlaps = part_overlaps + 1
            end
          end
        end
        env.out.print(full_overlaps.string() + " " + part_overlaps.string())
    end,
    20_000)

primitive Parse
  fun range(s : String) : (U64, U64) ? =>
    try
      let pair = s.split("-")
      if pair.size() == 2 then
        (pair(0)?.u64()?, pair(1)?.u64()?)
      else
        error
      end
    else
      error
    end

primitive Logic
  fun contains(r1 : (U64, U64), r2 : (U64, U64)) : Bool =>
    (let r1x, let r1y) = r1
    (let r2x, let r2y) = r2
    if (r1x >= r2x) and (r1y <= r2y) then
      true
    elseif (r1x <= r2x) and (r1y >= r2y) then
      true
    else
      false
    end

  fun overlaps(r1 : (U64, U64), r2 : (U64, U64)) : Bool =>
    (let r1x, let r1y) = r1
    (let r2x, let r2y) = r2
    if (r1x >= r2x) and (r1x <= r2y) then
      true
    elseif (r1y >= r2x) and (r1y <= r2y) then
      true
    elseif (r2x >= r1x) and (r2x <= r1y) then
      true
    elseif (r2y >= r1x) and (r2y <= r1y) then
      true
    else
      false
    end
