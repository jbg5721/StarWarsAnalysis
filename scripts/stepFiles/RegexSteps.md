# Regex Steps

## Step 1
*Find all*  `(.+?)(\n\n)` with *dot matches all* and *replace all* with `<sp>\1</sp>\2`

## Step 2
*Find all* `>(\D[A-Z].+?)(\n)` *replace all* with `><speaker>\1</speaker>\2`

## Step 3
*Find all* `<sp>([\d]+)\.(.+?)</sp>` *replace all* with `<setting scene="\1">\2</setting>`

## Step 4 
*Find all*`<sp>([\w].+?)</sp>` replace all with `<sd>\1</sd>` - Dot matches all was turned on

## Step 5
 **SKIP THIS STEP** *Find all*`<sp>(<speaker>\D[A-Z].+?</speaker>)` *replace all* with `\1\n<sp>`

##  Step 6
We manually put the metadata.

## Step 7
**If you skip step 5 this step is unnecessary** *Find all* `(<speaker>.+?</speaker>\s*)(<sp>)` *Replace all* with `\2\1` 
This is to move the speaker element and contents inside of the sp element.

## Step 8
*Find all* `(<scene)(><setting) scene =("\d+")(>)` *Replace all* with `\1 n=\3\2\4`
This is to remove the setting attribute but move it into the scene element instead.