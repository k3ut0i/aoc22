use "collections"
actor Main
  new create(env : Env) =>
    env.input(
    object iso is InputNotify
      fun ref apply(data : Array[U8] iso) =>
        let inp : String = String.from_iso_array(consume data)
        let ss : Array[String] = inp.split("\n")
        let ns : USize = ss.size()
        var p_sum : U64 = 0
        for i in ss.values() do
          try
            p_sum = p_sum + Logic.instance_priority(i)?.u64()
          end
        end
        env.out.print(p_sum.string())
        // part2
        var i : USize = 0
        var p2_sum : U64 = 0
        while i < ns do // is there no for(1..n) type of loop?
          try
            p2_sum = p2_sum +
            Logic.group_badge(ss(i)?, ss(i+1)?, ss(i+2)?)?.u64()
          end
          i = i + 3
        end
        env.out.print(p2_sum.string())
    end,
    20_000)

primitive Logic
  fun count_char(c : U8) : U8 =>
    if c > 96 then
      c - 96
    else
      c - 38
    end

  fun instance_priority(s : String) : U8 ? =>
    let size_half : USize = s.size() / 2
     // XXX: Am I doing something wrong here?
    let c1 : String = s.substring(0, ISize.from[USize](size_half))
    let c2 : String = s.substring(ISize.from[USize](size_half),
      ISize.from[USize](s.size()))
    var m : Map[U8, Bool] = m.create(size_half)
    for c in c1.values() do
      m(c) = true
    end
    for c in c2.values() do
      try
        if m(c)? == true then
          return count_char(c)
        end
      end
    end
    error // Should never reach in this instance

  fun group_badge(s1 : String, s2 : String, s3 : String) : U8 ? =>
    var m : Map[U8, U8] = m.create(52)
    for c in s1.values() do
      m.update(c, 1)
    end
    for c in s2.values() do
      m.upsert(c, 2, {(curr, prov) => curr.op_or(prov)})
    end
    for c in s3.values() do
      m.upsert(c, 4, {(curr, prov) => curr.op_or(prov)})
    end
    for c in m.keys() do
      try
        if m(c)? == 7 then
          return count_char(c)
        end
      end
    end
    error // should not occur for this problem
