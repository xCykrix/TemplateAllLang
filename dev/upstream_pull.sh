#!/bin/bash

echo "dev-script(): $1";

# Apply consts and vars.
TU_GIT="UPDATE_UPSTREAM_X1_LOCK";
PWD=$(pwd);
BN_PWD=$(basename $PWD);

# Abort if run in template to protect branch.
if [[ "$BN_PWD" == "TemplateAllLang" ]]; then
  echo "dev-script(): Unable to apply 'TemplateAllLang' to itself. Exiting...";
  exit 1;
fi
echo "dev-script(): Applying Upstream 'TemplateAllLang' Update";

# Delete failed sync attempt(s) and initialize template locally.
rm -rf "./$TU_GIT";
git clone https://github.com/xCykrix/TemplateAllLang "$TU_GIT";

# Move Template Files
cp -rf "./$TU_GIT/.github/" ".";
cp -r "./$TU_GIT/.editorconfig" ".";
cp -r "./$TU_GIT/.gitignore" ".";
cp -r "./$TU_GIT/LICENSE" ".";
cp -r "./$TU_GIT/make.sh" ".";

# Delete Template
rm -rf "./$TU_GIT";

exit 0
