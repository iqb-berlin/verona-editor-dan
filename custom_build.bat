rem preparing folders
mkdir "compilation"
mkdir "compilation\typescript_compiled_files"
mkdir "compilation\typescript_compiled_files\typescriptCommonFiles"
mkdir "compilation\typescript_compiled_files\unitAuthoring"
mkdir "compilation\babeljs_compiled_files"
mkdir "compilation\final_bundles_files"
mkdir "build"
mkdir "build\unitAuthoring"
mkdir "build\unitAuthoring\js"
mkdir "build\unitAuthoring\css"
mkdir "build\unitAuthoring\includes"
mkdir "build\unitAuthoring\features"
mkdir "build\unitAuthoring\polyfills"

call tsc

rem transpiling code using babeljs
call "./node_modules/.bin/babel" "compilation\typescript_compiled_files" --out-dir "compilation\babeljs_compiled_files"

rem bundling up the code
call webpack "compilation\babeljs_compiled_files\unitAuthoring\IQB_unitAuthoring.js" -o "compilation\final_bundles_files\IQB_unitAuthoring_Bundled.js" --mode development

rem finishing up unitAuthoring
copy "compilation\final_bundles_files\IQB_unitAuthoring_Bundled.js" "build\unitAuthoring\js"
xcopy "src\unitAuthoring\html" "build\unitAuthoring" /E /Y
xcopy "src\unitAuthoring\css" "build\unitAuthoring\css" /E /Y
xcopy "src\unitAuthoring\includes" "build\unitAuthoring\includes" /E /Y
xcopy "src\polyfills" "build\unitAuthoring\polyfills" /E /Y
