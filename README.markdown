currently
=========

the work/thought log for distractable people.
---------------------------------------------

Distractions can be very detrimental to programming because you often lose "where you were" while coding and have to rebuild the thought in your head. This is compounded by the frequent, lightweight distractions offered by Twitter. The `currently` solution: frequent, lightweight context saves. `currently` aims to be a small personal 'concentration log' that you update with whatever you're currently, directly working on. The emphasis is on short specific things; the kind of information you'd want to come back to after an hour break to get your mind in the right frame. This was borne out of a desire to capture thoughts at the end of the week in order to step right into coding Monday morning.

`currently` aims to be simple and tries to stay out of your way. Just pop open a terminal and run:

    currently [what you are doing]

For example:

    currently figuring out markdown syntax for the currently docs

or

    currently checking why async I/O functions don't work when n is 5

`currently` will save this, along with a timestamp, to either a file (by default, `~/.currentlog`) or to [catch.com](https://catch.com), depending on the settings in your `~/.currentlyrc`. If you were distracted (say, an unexpected phone call came in), just type `currently` by itself to load up the last thing you wrote down. If you use a customizable window manager (such as *[awesome](http://awesome.naquadah.org/)*), you could also poll the output of `currently` and display this in a widget.

You can add multiple tags (contexts) to `currently` by using the `-c` flag; you might want a tag for each project or a tag for work/home. To view the last entry in a certain context, just type `currently -c [context]` 

`currently` entries are meant to be an extension of your *short-term* memory; things you might need for an hour but then want to forget the next day. This differs from note-taking applications and to-do lists; the former focus on long-term recall of facts while the latter focus on "the future." `currently` fills the gap by helping you think in *the present*, because we all sometimes feel like the [Memento](http://www.imdb.com/title/tt0209144/) guy.

Of course, there are some fun uses for the data (plotting what times of the day you're most active, etc) so your old entries are stored. You can view the last *n* entries with the `-n` option: `currently -n 5`


Todo
----
* read/write configs from `~/.currentlyrc`
* write to `~/.currentlog`
* catch.com integration
* show awesomeWM wibox example
* auto-infer location tags from geolocation API
* color output
* sync-friendly file format
* [punchcard](http://gitready.com/images/punchcard.png)-style visualization
