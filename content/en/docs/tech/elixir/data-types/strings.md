---
title: Strings
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 192
---


Elixir strings are a sequence of bytes.

```
string = <<104,101,108,108,111>>
"hello"
```

<!-- By concatenating the string with the byte 0, IEx displays the string as a binary because it is not a valid string anymore. This trick can help us view the underlying bytes of any string. -->

`<< >>` tells the compiler that its elements are bytes. 


## Charlists

Elixir "strings" are represented with a sequence of bytes, not by an array of characters. 

In Elixir 'char lists', each value is the **Unicode code point**.
 <!-- of a character whereas in a binary, the codepoints are encoded as UTF-8. Let’s dig in: -->

<!-- ```
'hełło'
[104, 101, 322, 322, 111]
"hełło" <> <<0>>
<<104, 101, 197, 130, 197, 130, 111, 0>>
322 is the Unicode codepoint for ł but it is encoded in UTF-8 as the two bytes 197, 130.
``` -->


You can get a character’s code point by using ?

Charlist support is mainly included because it is required for some Erlang modules.

```
?Z
# 90
# This allows you to use the notation ?Z rather than ‘Z’ for a symbol.
```


<!-- Graphemes and Codepoints

Codepoints are just simple Unicode characters which are represented by one or more bytes, depending on the UTF-8 encoding. Characters outside of the US ASCII character set will always encode as more than one byte. For example, Latin characters with a tilde or accents (á, ñ, è) are typically encoded as two bytes. Characters from Asian languages are often encoded as three or four bytes. Graphemes consist of multiple codepoints that are rendered as a single character.

The String module already provides two functions to obtain them, graphemes/1 and codepoints/1. Let’s look at an example:

string = "\u0061\u0301"
"á"

String.codepoints string
["a", "́"]

String.graphemes string
["á"] -->


String Function | Description
--- | ---
`.length/1` | Returns the number of Graphemes
`.replace/3` | Replaces a current pattern in the string
`.duplicate/2` |  Repeats string `n` times
`.split/2` | Splits up the string based on the char


```
String.length "Hello"
# 5

String.replace("string", "char_to_replace", "char_to_put")
String.replace("Hello", "e", "a")
# "Hallo"

String.duplicate("Oh my ", 3)
# "Oh my Oh my Oh my "


String.split("Hello World", " ")
["Hello", "World"]
``` 



<!-- Anagrams
A and B are considered anagrams if there’s a way to rearrange A or B making them equal. For example:

A = super
B = perus
If we re-arrange the characters on String A, we can get the string B, and vice versa.

So, how could we check if two strings are Anagrams in Elixir? The easiest solution is to just sort the graphemes of each string alphabetically and then check if both the lists are equal. Let’s try that:

defmodule Anagram do
  def anagrams?(a, b) when is_binary(a) and is_binary(b) do
    sort_string(a) == sort_string(b)
  end

  def sort_string(string) do
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
Let’s first look at anagrams?/2. We are checking whether the parameters we are receiving are binaries or not. That’s the way we check if a parameter is a String in Elixir.

After that, we are calling a function that orders the string alphabetically. It first converts the string to lowercase and then uses String.graphemes/1 to get a list of the graphemes in the string. Finally, it pipes that list into Enum.sort/1. Pretty straightforward, right?

Let’s check the output on iex:

Anagram.anagrams?("Hello", "ohell")
true

Anagram.anagrams?("María", "íMara")
true

Anagram.anagrams?(3, 5)
** (FunctionClauseError) no function clause matching in Anagram.anagrams?/2

    The following arguments were given to Anagram.anagrams?/2:

        # 1
        3

        # 2
        5

    iex:11: Anagram.anagrams?/2
As you can see, the last call to anagrams? caused a FunctionClauseError. This error is telling us that there is no function in our module that meets the pattern of receiving two non-binary arguments, and that’s exactly what we want, to just receive two strings, and nothing more. -->
