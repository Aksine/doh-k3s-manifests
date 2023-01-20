#!/bin/sh

namespace=$1
secret_name=$2
directory_to_save=${3-$2}

mkdir -p $directory_to_save

values=$(kubectl --namespace $namespace get secrets $secret_name -o json \
    | jq -r '.data | keys[] as $k | "\($k):\(.[$k])"')
for file_content in $values
do
    file_name=$(echo $file_content | cut -d':' -f1)
    echo $file_content | cut -d':' -f2 | base64 --decode > $directory_to_save/$file_name
    echo "Created $directory_to_save/$file_name"
done