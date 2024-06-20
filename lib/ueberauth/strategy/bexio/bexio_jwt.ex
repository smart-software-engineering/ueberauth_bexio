defmodule Ueberauth.Strategy.Bexio.BexioJwt do
  def parse_jwt_payload(%OAuth2.AccessToken{access_token: access_token}) do
    # Split and decode the token, then parse using json library
    case String.split(access_token, ".") do
      [_, payload, _] ->
        payload
        |> Base.decode64!(padding: false, ignore: :whitespace)
        |> Jason.decode!()
        |> transform_payload()

      _ ->
        nil
    end
  end

  defp transform_payload(%{} = payload) do
    [
      "sub",
      "login_id",
      "company_id",
      "user_id",
      "azp",
      "scope",
      "iss",
      "exp",
      "iat",
      "company_user_id",
      "jti"
    ]
    |> Enum.reduce({payload, %{}}, fn key, {payload, acc} ->
      {value, payload} = Map.pop(payload, key, nil)
      {payload, Map.put(acc, String.to_atom(key), value)}
    end)
    |> keep_unknown_fields()
  end

  defp keep_unknown_fields({payload, known_fields}) do
    Map.merge(payload, known_fields)
  end
end
