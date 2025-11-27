---
title: Flutter Sound Null Safety Simplified
subtitle: "Data Exemption"
description: Flutter's null safety is confusing
image: "/img/flutter.jpg"
tags: ['Flutter']
date: 2020-06-25
---


Flutter enforced Sound Null Safety earlier this year from Dart 2.12 which forced all data types to have some data. 

Adding a `?` after the datakind will allow that datakind to have nothing (null values).
`datakind? variable = ..` 


<!-- ## What is Sound Null Safety? -->

`?` can be null
`!` 


Not Null Safe | Null Safe
--- | ---
`String variable = null;` | `String? variable = null;`
`variable.length;` | `variable?.length;`



## Convert Non-Nullable to Nullable

`String ---> String?`

Example:

```
void getItem(String? item) {
	if (item == null) return;
	item.toUppercase();
}

String item = "ball";
String? newItem = item;
```


## Convert Nullable to Non-Nullable

```
String? item = null;

# check null before converting to non-nulablle
if (item != null) {
  String newItem = item;
}

# fallback to default value if null
String newItem = item ?? 'ball';

# convert to not nullable (!????) 
String newItem = item!;

# use late with initState
late String item;
void initState
  item = 'ball';
```


