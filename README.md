# guitar-hero-wii-debug

debug q mod for wii gh

these enable every debug features possible with scripting instead of just the debug menu

extract rom with wit on cmd
```
   wit extract "path to rom" "path to extracted folder"
```
replace qb.pak in DATA/files/pak

to have a working wbfs for real hardware use wit and run
```
  wit copy "path to extracted folder" "path to rom.wbfs"
```
Guitar Hero Metallica include statistics on the screen

for playability the default qb disables it

if for some reason you want it it's in the "stats_enabled" folder
