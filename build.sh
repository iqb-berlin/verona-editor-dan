# preparing folders
mkdir -p build/unitAuthoring/js
mkdir build/unitAuthoring/css
mkdir build/unitAuthoring/includes
mkdir build/unitAuthoring/polyfills

tsc

# transpiling code using babeljs
./node_modules/.bin/babel "compilation/typescript_compiled_files" --out-dir "compilation/babeljs_compiled_files"

# bundling up the code
node_modules/.bin/webpack ./compilation/babeljs_compiled_files/unitAuthoring/IQB_UnitAuthoring.js -o "compilation/final_bundles_files/IQB_unitAuthoring_Bundled.js" --mode development

# finishing up unitAuthoring
cp compilation/final_bundles_files/IQB_unitAuthoring_Bundled.js build/unitAuthoring/js/
cp -r src/unitAuthoring/html/* build/unitAuthoring
cp -r src/unitAuthoring/css/* build/unitAuthoring/css/
cp -r src/unitAuthoring/includes/* build/unitAuthoring/includes
cp -r src/polyfills/* build/unitAuthoring/polyfills/
