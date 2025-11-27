---
title: Astro Syntax
slug: astro-syntax
description: An intro to the .astro component syntax.
draft: true
category:
  - One
tags:
  - Tailwind
  - Astro
  - Jamstac
---


code fence: `---`

dynamics is in code fence
reactive is not

{local variable}
${local variable}

```
<MyComponent templateLiteralNameAttribute={`MyNameIs${name}`} />
```


HTML attributes will be converted to strings

```
<!-- ❌ This doesn't work! ❌ -->
<button onClick={handleClick}>click me!</button>
```

Instead, use a client-side script to add the event handler, like you would in vanilla JavaScript:

```
<button id="button">Click Me</button>
<script>
  function handleClick () {
    console.log("button clicked!");
  }
  document.getElementById("button").addEventListener("click", handleClick);
</script>
```


Local variables can be used in JSX-like functions to produce dynamically-generated HTML elements:


---
const items = ["Dog", "Cat", "Platypus"];
---
<ul>
  {items.map((item) => (
    <li>{item}</li>
  ))}
</ul>
```

Astro can conditionally display HTML using JSX logical operators and ternary expressions.

---
const visible = true;
---
{visible && <p>Show me!</p>}

{visible ? <p>Show me!</p> : <p>Else show me!</p>}
```


### Dynamic Tags

```
---
import MyComponent from "./MyComponent.astro";
const Element = 'div'
const Component = MyComponent;
---
<Element>Hello!</Element> <!-- renders as <div>Hello!</div> -->
<Component /> <!-- renders as <MyComponent /> -->
```


When using dynamic tags:

- **Variable names must be capitalized.** For example, use `Element`, not `element`. Otherwise, Astro will try to render your variable name as a literal HTML tag.

- **Hydration directives are not supported.** When using [`client:*` hydration directives](/en/core-concepts/framework-components/#hydrating-interactive-components), Astro needs to know which components to bundle for production, and the dynamic tag pattern prevents this from working.

### Fragments

Astro supports using either `<Fragment> </Fragment>` or the shorthand `<> </>`.

Fragments can be useful to avoid wrapper elements when adding [`set:*` directives](/en/reference/directives-reference/#sethtml), as in the following example:

```astro title="src/components/SetHtml.astro" "Fragment"
---
const htmlString = '<p>Raw HTML content</p>';
---
<Fragment set:html={htmlString} />
```

### Differences between Astro and JSX

Astro component syntax is a superset of HTML. It was designed to feel familiar to anyone with HTML or JSX experience, but there are a couple of key differences between `.astro` files and JSX.

#### Attributes

In Astro, you use the standard `kebab-case` format for all HTML attributes instead of the `camelCase` used in JSX. This even works for `class`, which is not supported by React.

<!-- ```jsx del={1} ins={2} title="example.astro"
<div className="box" dataValue="3" />
<div class="box" data-value="3" />
``` -->

#### Multiple Elements

An Astro component template can render multiple elements with no need to wrap everything in a single `<div>` or `<>`, unlike JavaScript or JSX.

```astro title="src/components/RootElements.astro"
---
// Template with multiple elements
---
<p>No need to wrap elements in a single containing element.</p>
<p>Astro supports multiple root elements in a template.</p>
```
