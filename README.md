# `dotdev`

`dotdev` is a personal Hugo replacement designed with three main features in
mind: easier theming via htmx, playground-style runnable code via WASM, and
tracing built-in via Open Telemetry.

# Order of implementation
MVP:
  - [ ] Convert markdown to HTML
  - [ ] Syntax highlighting
	  - [ ] JS dependencies
  - [ ] Routing via file structure
	  - [ ] Provide content/structure via `/api/...` endpoints
  - [ ] CLI
	  - [ ] `run`
	  - [ ] `build`
  - [ ] (MAYBE) Otel
Later :TM:
  - [ ] Playground support
  - [ ] Remainder of CLI commands
