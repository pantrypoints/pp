---
title: Regex
description: "Regex" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-09-24
weight: 182
---


The `~r` sigil creates Regex. These are used to find matching patterns in a string. 

## Regex Functions

Function | Description
--- | ---
`Regex.scan/3` | Lists the matches
`Regex.run/3` | Runs regex until the first match
`Regex.replace/4` | Replaces all matches
`Regex.split/3` | Split the string on matches
`Regex.match?/2` | Does the string have the regex?


.scan/3 | Description | Example 
--- | --- | ---
`1` | Sigil | `~r`
`2` | Regex | `/l/`
`3` | Data | `"hello"``


```
Regex.scan(~r/l/, "hello")
# [["l"], ["l"]]

Regex.scan(~r/\d/, "h3ll0")
# [["3"], ["0"]]
```


Elixir uses the PCRE standard (Perl Compatible Regular Expressions).

Common Regex are

Regex | Description
--- | ---
`\d` | any digit from 0-9
`\w` | word character, any single letter, number, or underscore
`.` | non-newline character (essentially anything)
`\s` | whitespace character

Capitalizing backslash characters inverts their purpose.


Regex | Description
--- | ---
`\D` | non-digit character
`\W` | non-word character
`\S` | non-whitespace character


<!-- Regex.scan(~r/./, "abcd\n123")
\s matches whitespaces " ".

Regex.scan(~r/\s/, "a b c")
By combining these symbols, we can create more complex matches. For example, we can match on a phone number in the format 999-999-9999.

Regex.scan(~r/\d\d\d-\d\d\d-\d\d\d\d/, "111-111-1111 222-222-2222 123-123-1234")
Frequency
In addition to matching character patterns, we can match frequency using the following symbols.

* 0 or more times.
+ one or more times.
? zero or one time.
{} specify the number of times
We can find a match which repeats zero or more times with *.

* uses the previous regular expression, so 1* will match on all strings that contain 1 zero or more times. Similarly, A* would match all strings containing zero or more As.

Regex.scan(~r/1*/, "1121")
+ will match on strings that match one or more of the previous regular expressions.

Regex.scan(~r/1+/, "11211")
? functions like a conditional match, where the match may or may not exist. For example, we could match a and ab with ab?.

Regex.scan(~r/ab?/, "a ab")
{} allows us to specify a specific range of matches. {3} is exactly three matches. {3,} is three or more matches. {3,4} is between three and four matches.

For example, we could use this to create an alternative regular expression for phone numbers.

Regex.scan(~r/\d{3}-\d{3}-\d{4}/, "111-111-1111")
Or match on all digits between 3 and 4 characters.

Regex.scan(~r/\d{3,4}/, "111-111-1111")
Conditions And Ranges
We can also match on ranges of characters or use special conditions.

Use [1-9] to match a range of digits or letters.

Regex.scan(~r/[1-4]/, "1234567")
Regex.scan(~r/[a-c]/, "abcd")
| match on one pattern or another.
Regex.scan(~r/a|2/, "abc123")
[^a] match on characters other than the one provided
Regex.scan(~r/[^a]/, "abc123")
Regex Module
The Regex module provides functions for processing strings using regular expressions.

run/3 Runs the regular expression against the given string until the first match.
scan/3 Scans the string for all matches.
replace/4 Replaces all matches.
split/3 Split the string on matches.
match?/2 Return a boolean if the string contains the regular expression.
Regex.run/3 will run through a regular expression until the first match.

Regex.run(~r/\d/, "aa1234")
As we've already seen, Regex.scan/3 runs through a regular expression finding all matches.

Regex.scan(~r/\d/, "aa1234")
Regex.replace/4 replaces matches with a given string.

Regex.replace(~r/Peter Parker/, "Peter Parker is spiderman", "--secret--")
Regex.replace/3 can also accept an anonymous function to use the matched value to determine how to replace it.

Regex.replace(~r/\d/, "12345", fn each ->
  "#{String.to_integer(each) + 1}"
end)
Regex.split/3 splits a string on all matches the same way that String.split/3 will split a string by a specific value.

String.split("one,two,three", ",")
Regex.split(~r/\d/, "one1two2three")
Regex.match/2 checks if a string contains any match of the regular expression.

Regex.match?(~r/\d/, "hello")
Regex.match?(~r/\d/, "h3ll0")
The String module provides some functions for regular expressions.

replace/3
match?/2
split?/3
These functions are the same as the Regex module, except they take the string as the first argument to make it easier to pipe functions together.

"1234"
|> String.replace(~r/\d/, fn each -> "#{String.to_integer(each) + 1}" end)
|> String.replace(~r/\d/, fn each -> each <> " " end)
Capture Groups
You can build capture groups with (). Capture groups allow you to treat multiple characters as a single unit.

Matching on a capture group may feel unintuitive. For example, using a(b) instead of ab returns multiple matches rather than a single match.

Regex.run(~r/ab/, "ab")
Regex.run(~r/a(b)/, "ab")
Capture groups match separately in regular expressions. So first, we capture ab. Then we capture (b). Notice that if we create another capture group, we also return values that match that group. So (a)(b) matches on ab, then a, then b.

Regex.run(~r/(a)(b)/, "ab")
This could be useful if you wanted to use a specific part of the regular expression when replacing it. For example, let's obfuscate phone numbers so that 111-111-1111 becomes XXX-111-1111.

We can separate the match into multiple capture groups.

Regex.run(~r/\d{3}-(\d{3}-\d{4})/, "111-111-1111")
Now we can use these capture groups in Regex.replace/3.

Regex.replace(~r/\d{3}-(\d{3}-\d{4})/, "111-111-1111", fn full_match, capture_group ->
  IO.inspect(full_match, label: "match")
  IO.inspect(capture_group, label: "capture group")
  "XXX-" <> capture_group
end)
Regular expressions handle an arbitrary number of capture groups. For example, let's obfuscate the phone number 111-111-1111 into 111-XXX-1111.

Regex.replace(~r/(\d{3}-)\d{3}(-\d{4})/, "111-111-1111", fn match, group1, group2 ->
  IO.inspect(match, label: "match")
  IO.inspect(group1, label: "group1")
  IO.inspect(group2, label: "group2")
  group1 <> "XXX" <> group2
end) -->