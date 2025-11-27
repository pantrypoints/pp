---
title: "Basics"
description: ""
lead: ""
date: 2025-01-06T08:49:15+00:00
lastmod: 2025-01-06T08:49:15+00:00
weight: 100
image: "/photos/code.jpg"
---



Sveltekit does:

1. Routing
2. Loading
3. Rendering


## Loading 

```
export function load({params}) {
	const post = posts.find((post) => post.slug == params.slug);

	return { post };
}
```

## Form 

```
export const actions = {
	default: async ({ cookies, request}) => {
		const data = await request.data();
	}
}
```


