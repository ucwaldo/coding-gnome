defmodule TextClient.Interact do
  alias TextClient.{State, Player}

  # Server name@domain
  @hangman_server :""

  def start() do
    new_game()
    |> setup_state
    |> Player.play
  end

  defp setup_state(game) do
    %State{
      game_service: game,
      tally: Hangman.tally(game),
    }
  end

  defp new_game() do
    Node.connect(@hangman_server)
    :rpc.call @hangman_server, Hangman, :new_game, []
  end

end
