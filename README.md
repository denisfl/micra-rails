# micra-rails

Rails integration for [Micra.js] — reactive UI in **~5 kB gzip**, no build step.

Drop reactive client state, declarative directives, and a cross-component event
bus into any Rails view — the way `data-controller` works for Stimulus, except
your state is reactive and your bindings are declarative.

```erb
<%= micra_component :counter, count: 0 do %>
  <button @click="dec">−</button>
  <strong data-text="count"></strong>
  <button @click="inc">+</button>
<% end %>
```

```js
// app/javascript/application.js
import * as Micra from "micra";

Micra.define("counter", {
  state: { count: 0 },
  inc() {
    this.state.count++;
  },
  dec() {
    this.state.count--;
  },
});
```

That's the whole API surface. Micra mounts on `DOMContentLoaded`, walks
`[data-component]`, and wires up reactive bindings.

## Install

```bash
bundle add micra-rails
bin/rails generate micra:install
```

The generator:

- pins `micra` via importmap to jsDelivr CDN
- inserts `<%= micra_includes %>` into your application layout
- prints a quickstart counter example

## Helpers

### `micra_component(name, tag: :div, **props, &block)`

Wraps content in `<div data-component="<name>">` with `data-*` attributes for
each prop. Primitives (`String`, `Symbol`, `Numeric`, `Boolean`, `nil`) are
stringified; everything else (`Hash`, `Array`, ActiveRecord objects via
`as_json`) is JSON-encoded.

```erb
<%= micra_component :user_card, user: @user.as_json, tag: :article do %>
  <h3 data-text="user.name"></h3>
  <p data-text="user.bio"></p>
<% end %>
```

### `micra_includes`

Outputs importmap tags + the `Micra.start()` boot script. Call once in your
application layout (the installer does this for you).

### `micra_state(**props)`

Returns a hash of `data-*` attributes — useful when you want to attach state
to an existing element instead of wrapping it.

```erb
<form id="signup" <%= micra_state(intent: "signup", token: form_token).to_html %>>
  ...
</form>
```

## Why Micra over the alternatives

|                            | Micra.js         | Stimulus          | Alpine.js      | Hotwire alone    |
| -------------------------- | ---------------- | ----------------- | -------------- | ---------------- |
| Bundle (gzip)              | ~5 kB            | ~10 kB            | ~14 kB         | —                |
| Reactive client state      | ✓                | manual            | ✓              | server-driven    |
| Standard `data-*` syntax   | ✓                | `data-controller` | `x-*`          | `turbo-*`        |
| Pairs with Turbo / Hotwire | ✓                | ✓                 | works          | native           |
| Sweet spot                 | reactive islands | Rails behaviors   | small reactive | server-driven UI |

Use **Stimulus** for behaviors that don't need client state.
Use **Micra** when you need reactive state on a Rails page.
Pair Micra with **Turbo Streams** for the full Hotwire stack with reactivity.

## Production vs CDN

By default, `micra-rails` pins to jsDelivr at the `@2` major range, so you get
Micra 2.x patches and minors automatically (and never a breaking major):

```ruby
pin "micra", to: "https://cdn.jsdelivr.net/npm/micra.js@2/dist/micra.esm.js"
```

Pin a specific version instead if you'd rather lock it.

To self-host (no third-party CDN):

```bash
bin/importmap pin micra --download
```

This downloads `micra.esm.js` into `vendor/javascript/` and updates the pin.

## Compatibility

| Rails | Status        |
| ----- | ------------- |
| 8.x   | ✓             |
| 7.2   | ✓             |
| 7.1   | ✓             |
| < 7.1 | not supported |

Requires Ruby ≥ 3.1.

## License

MIT © Denis Fedosov-Ledovskikh

[Micra.js]: https://github.com/denisfl/micra.js
