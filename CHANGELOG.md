# Changelog

## (Unreleased)

## v0.3.0

- Removed parsing the jwt token, reading the information `company_id`, `company_name`, `uid` from the userinfo endpoint.
- Adding `company_id`, `company_user_id`, `company_name` to the `raw_info` in `UeberAuth.Auth.Extra`.

## v0.2.1

- Further adaption to the new endpoint logic
- `company_profile` in default scopes to keep with current logic

## v0.2.0

- Updated the OAuth2 logic from idp to the new auth endpoint.

## v0.1.6

- Bugfix SSL
- Adding dialyzer and credo

## v0.1.5

- Bugfix Naming

## v0.1.4

- Added company id and login id to the raw user info under extra

## v0.1.3

- Adding company id

## v0.1.2

- Adding parsed JWT token to raw info because company_id and login_id combined are unique

## v0.1.1

- Pipeline Test

## v0.1.0

- Initial Release
