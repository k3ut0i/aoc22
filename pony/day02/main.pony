actor Main
  new create(env : Env) =>
    env.input(
    object iso is InputNotify
      fun ref apply(data : Array[U8] iso) =>
        let inp : String = String.from_iso_array(consume data)
        var ts : I64 = 0
        for g in inp.split("\n").values() do
          try
            // just Game.create for part1
            ts = ts + Game.create_rev(g)?.b_score()
          end
        end
        env.out.print(ts.string())
      fun ref dispose () => env.out.print("Done.")
    end,
    20_000)

primitive Rock
primitive Paper
primitive Scissors
type Hand is (Rock | Paper | Scissors)

primitive Won
primitive Draw
primitive Lost
type Result is (Won | Draw | Lost)


class Game
  let player_a : Hand
  let player_b : Hand
  new create(str : String) ?=>
    (player_a, player_b) = Parse.parse1(str)?
  fun b_status() : Result =>
    if player_a is player_b then
      Draw
    else
      match (player_a, player_b)
      | (Rock, Scissors) => Lost
      | (Paper, Rock) => Lost
      | (Scissors, Paper) => Lost
      else
        Won
      end
    end
  fun b_score() : I64 =>
    GM.hand_score(player_b) + GM.status_score(b_status())
  new create_rev(s : String) ? =>
    (let pa, let r) = Parse.parse2(s)?
    player_a = pa
    player_b = GM.hand_needed(pa, r)

primitive GM
    fun hand_score(h : Hand) : I64 =>
    match h
    | Rock => 1
    | Paper => 2
    | Scissors => 3
    end
  fun status_score(r : Result) : I64 =>
    match r
    | Lost => 0
    | Draw => 3
    | Won => 6
    end
  fun hand_needed(op : Hand, r : Result) : Hand =>
    match r
    | Draw => op
    | Lost => lose(op)
    | Won => win(op)
    end
  fun lose(op : Hand) : Hand =>
    match op
    | Rock => Scissors
    | Paper => Rock
    | Scissors => Paper
    end
  fun win(op : Hand) : Hand =>
    match op
    | Rock => Paper
    | Paper => Scissors
    | Scissors => Rock
    end

primitive Parse
  fun m1(c : String) : Hand ? =>
    match c
    | "A" => Rock
    | "B" => Paper
    | "C" => Scissors
    else
      error
    end
  fun m2(c : String) : Hand ? =>
    match c
    | "X" => Rock
    | "Y" => Paper
    | "Z" => Scissors
    else
      error
    end
  fun parse1(str : String) : (Hand, Hand) ? =>
    let cs = str.split(" ")
    (m1(cs(0)?)?, m2(cs(1)?)?)
  fun m3(c : String) : Result ? =>
    match c
    | "X" => Lost
    | "Y" => Draw
    | "Z" => Won
    else
      error
    end
  fun parse2(str : String) : (Hand, Result) ? =>
    let cs = str.split(" ")
    (m1(cs(0)?)?, m3(cs(1)?)?)
