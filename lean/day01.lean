def splitOn [BEq α] (e : α) (acc : List α) (xs : List α) : List (List α) :=
  match xs with
    | [] => List.reverse acc :: []
    | x :: xs1 => if x == e 
                  then List.reverse acc :: splitOn e [] xs1
                  else splitOn e (x :: acc) xs1

def parseData : Array String → List (List Int) :=
  List.map (List.map String.toInt!) ∘ splitOn "" [] ∘ Array.toList

def take (n : Int) : List α → List α
  | [] => []
  | x :: xs => if n > 0 then x :: take (n-1) xs else []

def part1 : List (List Int) → Option Int :=
  List.max? ∘ List.map (List.sum)

def part2 : List (List Int) → Int :=
  List.sum ∘ take 3 ∘ (fun xs => List.mergeSort xs (fun a b => a ≥ b)) ∘ List.map (List.sum)

def main : IO Unit  := IO.getStdin >>= IO.FS.Stream.lines  >>= fun a =>
  let d := parseData a
  IO.println (part1 d, part2 d)
