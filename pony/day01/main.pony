use "collections"

actor Main
  new create(env : Env) =>
    env.input(
    object iso is InputNotify
      fun ref apply(data : Array[U8] iso) =>
        let inp : String = String.from_iso_array(consume data)
        env.out.print(Logic.max_calories(env,inp))
      fun ref dispose () => env.out.print("Done.")
    end,
    20_000)

primitive Logic
  fun max_calories(env : Env, s : String) : String =>
    let d = "

"
  let entries : Array[String] = s.split_by(d)
  let nentries = entries.size()
  var totals : Array[I64] = Array[I64](nentries)
  for v in entries.values() do
    var total : I64 = 0
    for x in v.split().values() do
      try
        total = total + x.i64(10)?
      end
    end
    totals.push(total)
  end
  let st = Sort[Array[I64], I64](totals)
  try
    let m1 = st.pop()?
    let m2 = st.pop()?
    let m3 = st.pop()?
    m1.string() + " " + m2.string() + " " + m3.string() + " = " +
    (m1 + m2 + m3).string()
  else
    "Error in popping."
  end
