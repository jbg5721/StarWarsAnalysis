# Regex Steps

## Step 1
*Find all*  `(.+?)\n\n` with *dot matches all* and *replace all* with `<sp>\1</sp>\2`

## Step 2
*Find all* `>(\D[A-Z].+?)(\n)` *replace all* with `><speaker>\1</speaker>\2`
