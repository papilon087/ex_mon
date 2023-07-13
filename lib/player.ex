defmodule ExMon.Player do
  # Variavel de modulo
  @require_keys [:life, :move_avg, :move_heal, :move_rnd, :name]
  @max_life 100

  @enforce_keys @require_keys
  defstruct @require_keys

  def build(name, move_rnd, move_avg, move_heal) do
    %ExMon.Player{
      life: @max_life,
      move_avg: move_avg,
      move_heal: move_heal,
      move_rnd: move_rnd,
      name: name
    }
  end
end
