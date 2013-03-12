currentSource=$(./SwitchAudioSource -c)
nextSource=$((./SwitchAudioSource -a; ./SwitchAudioSource -a) | grep '(output)' | sed 's/ (output)$//' | grep -A 1 "$currentSource" | head -n 2 | tail -n 1)

# XML to Alfred
echo '<?xml version="1.0"?><items>'
echo '<item arg="doesntmatter" uid="doesntmatter">'
echo "<title>Switch Audio Output to: $nextSource</title>"
echo "<subtitle>Current Source: $currentSource</subtitle>"
echo "<icon>icon.png</icon></item></items>"