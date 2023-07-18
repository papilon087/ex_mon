defmodule ExMon.Game.Status do
  # Imprime informações se o jogo começou e seu status.
  def print_round_message(%{status: :started} = info) do
    IO.puts("\n===== The game is started! =====\n")
    IO.inspect(info)
    IO.puts("-------------------------------")
  end

  # Imprime a mensagem para continuar o turno do player.
  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n===== It's #{player} turn. =====\n")
    IO.inspect(info)
    IO.puts("-------------------------------")
  end

  # Imprime a mensagem de game over.
  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n===== The game is over. =====\n")
    IO.inspect(info)
    IO.puts("-------------------------------")
  end

  # Imprime mensagem de movimento invalido.
  def print_wrong_move_message(move) do
    IO.puts("\n===== Invalid move: #{move} =====\n")
  end

  # Imprime a mensagem quando o jogador atacar o computador
  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n===== The Player attacked the computer dealing #{damage} damage. =====\n")
  end

  # Imprime a mensagem quando o computador atacar o computador
  def print_move_message(:player, :attack, damage) do
    IO.puts("\n===== The Computer attacked the player dealing #{damage} damage. =====\n")
  end

  # Imprime a mensagem quando curar.
  def print_move_message(player, :heal, life) do
    IO.puts("\n===== The #{player} healled itself to #{life} life points. =====\n")
  end
end
