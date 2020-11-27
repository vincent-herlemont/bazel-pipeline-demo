current_path=$(dirname "$0")

function back {
    cd -
}

trap 'back' ERR

cd $current_path
bazel build //util/tools
API_ENDPOINT=$(echo $(../bazel-bin/util/tools/tools get-cluster-url))
NEXT_PUBLIC_API_ENDPOINT="$API_ENDPOINT" npm run dev