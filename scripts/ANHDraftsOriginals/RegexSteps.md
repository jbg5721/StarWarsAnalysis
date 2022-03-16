# Regex Steps

## Step 1
*Find all*  `(.+?)\n\n` with *dot matches all* and *replace all* with `<sp>\1</sp>\2`

## Step 2
*Find all* `>(\D[A-Z].+?)(\n)` *replace all* with `><speaker>\1</speaker>\2`

## Step 3
*Find all* `<sp>([\d]+)\.(+?)</sp>< *replace all* with ><setting scene="\1"\2</setting>`

## Step 4 
*Find all*`<sp>([\w].+?)</sp>` replace all with `<sd>\1</sd>` - Dot matches all was turned on

## Step 5
*Find all*`<sp>(<speaker>\D[A-Z].+?</speaker>)` *replace all* with `\1\n<sp>`

##  Step 6
We manually put the metadata.