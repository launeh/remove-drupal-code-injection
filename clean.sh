find . -name "*.php" | xargs sed -i 's/<*.*[[:digit:]]+*.*eval*.*[[:digit:]]+*.*>//g' *.php
