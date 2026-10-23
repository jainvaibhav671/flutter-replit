# Flutter Starter

A Flutter starter app with a responsive home screen, interactive counter, and light/dark theme toggle.

## Run & Operate

- `pnpm --filter @workspace/api-server run dev` — run the API server (port 5000)
- `cd flutter_app && flutter run` — run the Flutter app on a selected device
- `cd flutter_app && flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080` — run the browser preview
- `cd flutter_app && flutter analyze && flutter test && flutter build web` — check and build the Flutter app
- `pnpm run typecheck` — full typecheck across all packages
- `pnpm run build` — typecheck + build all packages
- `pnpm --filter @workspace/api-spec run codegen` — regenerate API hooks and Zod schemas from the OpenAPI spec
- `pnpm --filter @workspace/db run push` — push DB schema changes (dev only)
- Required env: `DATABASE_URL` — Postgres connection string

## Stack

- pnpm workspaces, Node.js 24, TypeScript 5.9
- API: Express 5
- DB: PostgreSQL + Drizzle ORM
- Validation: Zod (`zod/v4`), `drizzle-zod`
- API codegen: Orval (from OpenAPI spec)
- Build: esbuild (CJS bundle)

## Where things live

- `flutter_app/` — Flutter app source, platform targets, and widget tests
- `artifacts/api-server/` — shared Express API service
- `artifacts/mockup-sandbox/` — component preview canvas

## Architecture decisions

- Keep the mobile app as a standalone Flutter project alongside the pnpm workspace; use the custom Flutter Web Preview workflow for browser preview.

## Product

The starter screen demonstrates responsive Flutter UI, a working counter with increment/decrement/reset actions, and a light/dark theme toggle. Android, iOS, and web project targets are included.

## User preferences

- Flutter is required for the mobile app; do not replace it with Expo or React Native.

## Gotchas

_Populate as you build — sharp edges, "always run X before Y" rules._

## Pointers

- See the `pnpm-workspace` skill for workspace structure, TypeScript setup, and package details
