use "collections"

actor Main
  new create(env : Env) =>
    env.input(
    object iso is InputNotify
      fun apply(data : Array[U8] iso) =>
        let inp : String = String.from_iso_array(consume data)
        try
          (let state : State , let moves : Array[Move]) = Parse.read_input(env, inp)?
          env.out.print("parsed")
          state.all_moves(moves)?
          env.out.print("moved")
          env.out.print(state.top_crates()?)
        end
    end,
    20_000)

class Move
  let quantity : USize
  let from : USize
  let to : USize
  new create (q : USize, f : USize, t : USize) =>
    quantity = q; from = f; to = t

class State
  let nstacks : USize
  var a : Array[List[U8]]
  // new from_string(s : String) ? => (nstacks, a) = Parse.read_state(s)?
  new create(n : USize, a' : Array[List[U8]]) => nstacks = n; a = a'

  fun top_crates() : String ? =>
    var s : String ref = s.create()
    for l in a.values() do
      s.push(l.head()?.apply()?)
    end
    s.string()
  fun ref move(m : Move) : None ? =>
    var i : USize = 0
    while i < m.quantity do
      a(m.to)?.push(a(m.from)?.pop()?)
      i = i + 1
    end
  fun ref all_moves(am : Array[Move]) : None ? =>
    for m in am.values() do
      move(m)?
    end

primitive Parse
  fun read_move(s : String) : Move ? =>
    let ss = s.split(" ")
    try
      Move.create(ss(1)?.usize()?, ss(3)?.usize()?, ss(5)?.usize()?)
    else
      error
    end

  fun read_state(env : Env, s : String) : (USize, Array[List[U8]]) ? =>
    let lines : Array[String] = s.split("\n").reverse()
    try
      let nstacks : USize = lines.pop()?.split(" ").size() / 3
      var a : Array[List[U8]] = a.create(nstacks)
      var i : USize = 0
      env.out.print(nstacks.string())
      while i < nstacks do
        a(i)? = List[U8](); i = i + 1
      end
      for line in lines.values() do
        var i' : USize = 0
        while i' < nstacks do
          let c : U8 = line((4*i')+1)?
          if  c != ' ' then
            a(i)?.push(c)
          end
          i' = i' + 1
        end
      end
      (nstacks, a)
    else
      error
    end

  fun read_input(env : Env, s : String) : (State, Array[Move]) ? =>
    try
      let ss : Array[String] = s.split("\n\n")
      (let nstacks, let a) = read_state(env, ss(0)?)?
      let rs = State(nstacks, a)
      let moves_lines = ss(1)?.split("\n")
      var am : Array[Move] = am.create(moves_lines.size())
      for line in ss(1)?.split("\n").values() do
        am.push(read_move(line)?)
      end
      (rs, am)
    else
      error
    end
