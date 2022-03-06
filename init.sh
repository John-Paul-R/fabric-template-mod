#!/bin/bash

mod_name='ExampleModName'
author_full_name='John Paul Rutigliano'

github_user='John-Paul-R'
github_project_slug='fabric-template-mod'
cf_project_id='475964'
mr_project_id='6VdDUivB'

github_project_slug_shields='Essential-Commands'
mr_project_slug_shields='essential-commands'

# ---

read -p 'github_user: ' in_github_user #"Replaced-User"
read -p 'github_project_slug: ' in_github_project_slug #"Replaced-Mod"
read -p 'cf_project_id: ' in_cf_project_id #"Replaced-CF-Id"
read -p 'mr_project_id: ' in_mr_project_id #'Replaced-MR-Id'
read -p 'mr_project_slug: ' in_mr_project_slug #"Replaced-MR-Slug"

function replace_in_files {
    local text_to_replace=$1
    local new_text=$2
    shift 2
    local file_paths=("$@")
    for file_path in ${file_paths[@]}; do
        sed -i "s/$text_to_replace/$new_text/g" $file_path
        # echo "$new_text $file_path"
    done
}

files_using_github_user=(
    'gradle.properties'
    'README.md'
    '.github/ISSUE_TEMPLATE/config.yml'
    'example-submod/src/main/resources/fabric.mod.json'
    'src/main/resources/fabric.mod.json'
)

files_using_github_project_slug=(
    'README.md'
)

files_using_mr_project_slug=(
    'README.md'
)

files_using_cf_project_id=(
    'gradle.properties'
    'README.md'
)

files_using_mr_project_id=(
    'gradle.properties'
    'README.md'
)

files_using_mod_name=(
    'gradle.properties'
    'README.md'
    '.github/SECURITY.md'
    'src/main/java/dev/jpcode/modid/Example.java' #rename this
    'src/main/java/dev/jpcode/modid/mixin/TitleScreenMixin.java'
    'src/test/java/dev/jpcode/modid/ExampleTest.java' #rename this
) #also need to rename the directories for package structure...

replace_in_files $github_user           $in_github_user         "${files_using_github_user[@]}"
replace_in_files $github_project_slug   $in_github_project_slug "${files_using_github_project_slug[@]}"
replace_in_files $cf_project_id         $in_cf_project_id       "${files_using_cf_project_id[@]}"
replace_in_files $mr_project_id         $in_mr_project_id       "${files_using_mr_project_id[@]}"
replace_in_files $mr_project_slug       $in_mr_project_slug     "${files_using_mr_project_slug[@]}"

# shields
replace_in_files $github_project_slug_shields   $in_github_project_slug 'README.md'
replace_in_files $mr_project_slug_shields       $in_mr_project_slug     'README.md'

# modid (now examplemodname) needs to be replaced in package names and elsewhere.

# ---
# MC & Fabric Versions
# ---
