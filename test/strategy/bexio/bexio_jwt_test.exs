defmodule Ueberauth.Strategy.Bexio.BexioJwtTest do
  use ExUnit.Case, async: true

  alias Ueberauth.Strategy.Bexio.BexioJwt

  describe "parse_jwt/1" do
    test "can parse the jwt token" do
      sample_jwt =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyaWNvLm1ldHpnZXJAZ21haWwuY29tIiwibG9naW5faWQiOiI1NGM4ZjE0Mi0xMTljLTQ0OWMtOGMxMi04OTI2OWRkNDM3ZjkiLCJjb21wYW55X2lkIjoiYWNkZWVmMTIiLCJ1c2VyX2lkIjoxMzMyNCwiYXpwIjoiNDVmMzMxZGUtNjk5Yi00YTg5LWI1ZmQtZmZjNDZiOTUxNWQ0Iiwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBvZmZsaW5lX2FjY2VzcyBlbWFpbCIsImlzcyI6Imh0dHBzOi8vaWRwLmJleGlvLmNvbSIsImV4cCI6MTcxODg0NzMwMCwiaWF0IjoxNzE4ODQzNzAwLCJjb21wYW55X3VzZXJfaWQiOjEsImp0aSI6ImM0NTgyZDRjLWVhZDYtNDhlNS04NjA2LTU4MTRiODBmNDllNiJ9.gfXzNaDMkoxIpa1qKxld78dAHBSfxWrcXJ_PSvLoZuA"

      payload = BexioJwt.parse_jwt_payload(%OAuth2.AccessToken{access_token: sample_jwt})

      assert %{
               sub: "rico.metzger@gmail.com",
               login_id: "54c8f142-119c-449c-8c12-89269dd437f9",
               company_id: "acdeef12",
               user_id: 13324,
               azp: "45f331de-699b-4a89-b5fd-ffc46b9515d4",
               scope: "openid profile offline_access email",
               iss: "https://idp.bexio.com",
               exp: 1_718_847_300,
               iat: 1_718_843_700,
               company_user_id: 1,
               jti: "c4582d4c-ead6-48e5-8606-5814b80f49e6"
             } == payload
    end

    test "keeps unknown fields and nils missing ones" do
      sample_jwt =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbl9pZCI6IjU0YzhmMTQyLTExOWMtNDQ5Yy04YzEyLTg5MjY5ZGQ0MzdmOSIsImp0aSI6ImM0NTgyZDRjLWVhZDYtNDhlNS04NjA2LTU4MTRiODBmNDllNiIsImhlbGxvIjoid29ybGQifQ.h2smA-0OHRNd4OjT9DhemVQCGtyi3Fn0oe56oHiJpn8"

      payload = BexioJwt.parse_jwt_payload(%OAuth2.AccessToken{access_token: sample_jwt})

      assert %{
               "hello" => "world",
               login_id: "54c8f142-119c-449c-8c12-89269dd437f9",
               jti: "c4582d4c-ead6-48e5-8606-5814b80f49e6",
               azp: nil,
               company_id: nil,
               company_user_id: nil,
               exp: nil,
               iat: nil,
               iss: nil,
               scope: nil,
               sub: nil,
               user_id: nil
             } == payload
    end
  end
end
