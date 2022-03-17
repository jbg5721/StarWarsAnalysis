# Final Draft

## Step 1
find all `^[A-Z]{2,}`  replace with `\n\n\0`
## Step 2
find all `(\n\n)(\w)` replace with `</sp>\1<sp>\2`
## Step 3
find all `<sp>(INT|EXT)ERIOR:.+?</sp>` replace with `</scene>\n<scene><sd>\1</sd>`
## Step 4
Wrapped in root element. Checked and fixed any errors in the xml.
## Step 5
find all `(<sp>[^<]+?^\t\t)(.+?)(<|\t\t)` replace with `\1<sd>\2<\sd>\3`
## Step 6
find all `</sd>\s*\t\t[^<].+?</sp>` replaced manually with `<sd>` elements on the excess ones.
### Then
find all`(</sd>\s*\t\t)([^<]+?)(</sp>)` 12 results so replaced with `\1<sd>\2</sd>\3`
## Step 7
find all `\((.+?)\)` replace with `<sd>\1</sd>`


### Notes on what was done on the rough draft
Wrapped the setting changes and the following in a scene box.

find all `(<speaker>.+?</speaker>\s*)(<sp>)` replace with `\2\1`

find all`(<scene)(><setting) scene =("\d+")(>)` replace with`\1 n=\3\2\4`
