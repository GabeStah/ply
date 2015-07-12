## Basic Functionality

* Will store basic information about an **Item** (Name, YouTube ID, duration, release date, etc).
* An **Item** can belong to one or more **Series**.
* A **Series** is roughly thought of as a playlist holding multiple **Items** with basic attributes (Name, YouTube ID, release date, etc).
* An **Annotation** is a set of parameters that define how an **Item's** YouTube annotation is created (position, size, text, color, URL, etc).
* An **Item** may have multiple **Templates** associated with it.
* A **Template** is a set of pre-configured **Annotations** that outline how the **Annotation** appears and what associated **Item** they should contain (e.g. URL to next **Item** in series, similar **Item**, etc).
* A **Tag** is a simple identifier that can be associated with multiple objects (**Item**, **Series**, etc).  **Tags** consist of very basic identifiers (name, slug).
* Some objects (**Tags**, **Templates**, **Game**, etc) might be broken into parent-child relationships.  A **Game** object, for example, might have a set of default **Tags** assigned to it, and upon creation of a object associated with **Game**, such as a **Series**, the **Tags** are _copied_ to the newly created **Series**.  However, when the original **Game** object is updated and its **Tags** are changed, that has no impact on previously associated **Series** object unless that **Series** is specifically _forced_ to update **Tag** data from the associated **Game**.

## Item

### Fields

* name:string - Name of item to identify it locally; _not_ the full title for upload.
* youtube_id:string - YouTube ID
* duration:integer - Duration of item
* release_at:datetime - When to release
* published:boolean - Is published
* privacy:string - Public, Unlisted, Private

## Description

Description is a template for generating the description text for an Item.  The text of a Description will consist of a mix of normal text and keyword insertion points or [shortcodes] to indicate where programmatic information should be inserted.

An example Description block might look like so:

```
A [guild_name /] Commentary [item_field=role /] Guide to the [item_field=difficulty /] [item_field=boss /] encounter in [item_field=zone /].

[item_field=table_of_contents /]

Phase 4 Malice WeakAura: http://voximmortalis.com/wiki/WeakAuras_SiegeOfOrgrimmar

[subscribe_blurb /]
[channel_blurb /]
[series_list tag="Siege of Orgrimmar, Heroic" /]
[series_list tag="Siege of Orgrimmar, Normal" /]

[world_of_logs_blurg /]
```

Which would produce the final output text as follows:

```
A Vox Immortalis Commentary Tank Guide to the Heroic Garrosh Hellscream encounter in Siege of Orgrimmar.

Introduction: 0:00
Phase 1: 0:15
Intermission #1: 1:55
Phase 2: 5:44
Intermission #2: 7:26
Phase 2.5: 8:44
Phase 3: 11:03
Phase 4: 12:42

Phase 4 Malice WeakAura: http://voximmortalis.com/wiki/WeakAuras_SiegeOfOrgrimmar

Please subscribe: http://www.youtube.com/subscription_center?add_user=gabestah
My channel: http://www.youtube.com/gabestah/
Siege of Orgrimmar Heroic Raid Guides: http://goo.gl/R8XQP7
Siege of Orgrimmar Heroic Quick Raid Guides: http://goo.gl/VfNWdc
Siege of Orgrimmar Heroic Tank Guides: http://goo.gl/3urGAt
Siege of Orgrimmar Heroic Healer Guides: http://goo.gl/MX1VBe
Siege of Orgrimmar Heroic DPS Guides: http://goo.gl/UnNsy0
Siege of Orgrimmar Heroic + Mumble Videos: http://goo.gl/5xXKNe
Siege of Orgrimmar Normal Raid Guides: http://goo.gl/c1nazF
Siege of Orgrimmar Normal Quick Raid Guides: http://goo.gl/A7AglA
Siege of Orgrimmar Normal Tank Guides: http://goo.gl/Scp6eK
Siege of Orgrimmar Normal Healer Guides: http://goo.gl/8xMyey
Siege of Orgrimmar Normal DPS Guides: http://goo.gl/yEmlUR
Siege of Orgrimmar Normal + Mumble Videos: http://goo.gl/Xdwm7U

World of Logs: http://worldoflogs.com/guilds/4721/
```

## Tags & Tag Collections

A Tag is a simple identifier that can be associated with multiple objects (Globally, Item, Series, etc). Tags consist of very basic identifiers (name, slug).

Implemented with gem: https://github.com/mbleigh/acts-as-taggable-on

Similar to a Description, a Tag can contain and individual text object or a combination of multiple objects through [shortcode] inclusion.  A Tag Collection might be broken up as follows:

```
[game_tags] (wow,mmo,world of warcraft,world,warcraft)
[series_tags] (mop,mists of pandaria,raid)
[content_type_tags] (strategy,guide,how to,how-to,help,commentary,tutorial,tips,tricks,voice over)
TODO: Continue
```

```
wow,mmo,world of warcraft,world,warcraft
mop,mists of pandaria,raid
strategy,guide,how to,how-to,help,commentary,tutorial,tips,tricks,voice over
10-man,10 man,10m,vox,vox immortalis,monk,mistweaver,5.4,2-heal,2 heal,2-tank,2 tank,soo,siege,siege of orgrimmar,heroic,hc,hard mode,mumble,vent,ventrilo,Paragons of the Klaxxi
```
